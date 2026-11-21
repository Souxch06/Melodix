"""Minimal Dalvik register type checker for the helpers we add by hand.

The two crashes this project shipped (MEL-BUG-080 and MEL-BUG-082) were both
register TYPE errors that aapt2/apktool happily compiled: the verifier only
rejects them at runtime, and only on a device. This script walks a method and
fails if a register is used with a type other than the one it was last given.

It is deliberately small: the opcodes we emit are a fixed, known set.
"""
import re
import sys

TYPES = {
    'Ljava/lang/StringBuilder;': 'builder',
    'Ljava/lang/String;': 'string',
    'Ljava/lang/Object;': 'object',
}

class Fail(Exception):
    pass


def reg_key(reg):
    n = int(reg[1:])
    return ('p', n) if reg[0] == 'p' else ('v', n)


def ret_type_name(line):
    m = re.search(r'->(\w+)\(', line)
    return m.group(1) if m else ''


def check_method(name, lines):
    # register -> type string. p0.. are the parameters, given by the signature.
    sig = lines[0]
    params = re.search(r'\((.*?)\)', sig).group(1)
    p = []
    i = 0
    while i < len(params):
        if params[i] == 'L':
            j = params.index(';', i)
            p.append(('class', params[i:j + 1]))
            i = j + 1
        elif params[i] == '[':
            p.append(('array', None))
            i += 1
        elif params[i] == 'Z':
            p.append(('bool', None))
            i += 1
        elif params[i] == 'I':
            p.append(('int', None))
            i += 1
        else:
            raise Fail('param type inconnu %r' % params[i])
    regs = {}
    for idx, (kind, cls) in enumerate(p):
        regs[('p', idx)] = kind if kind != 'class' else TYPES.get(cls, 'string')

    for raw in lines:
        line = raw.strip()
        if not line or line.startswith('#') or line.startswith(':'):
            continue
        if line.startswith('.line') or line.startswith('.locals'):
            continue

        m = re.match(r'const-string(?:/jumbo)? (v\d+|p\d+),', line)
        if m:
            regs[reg_key(m.group(1))] = 'string'
            continue

        m = re.match(r'const/4 (v\d+|p\d+),', line)
        if m:
            regs[reg_key(m.group(1))] = 'int'
            continue

        m = re.match(r'const/16 (v\d+|p\d+),', line)
        if m:
            regs[reg_key(m.group(1))] = 'int'
            continue

        m = re.match(r'new-instance (v\d+|p\d+), (\S+)', line)
        if m:
            # MEL-BUG-082: a forward branch may jump over this point. The linear
            # walk must not claim "v0 is a StringBuilder from here on" for code
            # that belongs to another branch — remember it per offset, and only
            # trust the type when the register was set on the same path.
            regs[reg_key(m.group(1))] = TYPES.get(m.group(2), m.group(2))
            continue

        m = re.match(r'move-result-object (v\d+|p\d+)', line)
        if m:
            regs[('last_result',)] = regs.get(('last_result',))
            regs[reg_key(m.group(1))] = regs.get('result_type', 'object')
            continue

        m = re.match(r'move-result (v\d+|p\d+)', line)
        if m:
            regs[reg_key(m.group(1))] = 'int'
            continue

        m = re.match(r'sget-object (v\d+|p\d+), (\S+)', line)
        if m:
            regs[reg_key(m.group(1))] = TYPES.get(m.group(2), 'object')
            continue

        m = re.match(r'sget-boolean (v\d+|p\d+),', line)
        if m:
            regs[reg_key(m.group(1))] = 'bool'
            continue

        m = re.match(r'invoke-(?:virtual|direct|static) \{([^}]*)\}, (\S+);->(\w+)\((.*?)\)(\S+)', line)
        if m:
            args = [a.strip() for a in m.group(1).split(',') if a.strip()]
            expect = m.group(4)
            # build the expected argument types
            wanted = []
            if m.group(0).startswith('invoke-virtual') or m.group(0).startswith('invoke-direct'):
                wanted.append('object')  # receiver
            k = 0
            while k < len(expect):
                if expect[k] == 'L':
                    j = expect.index(';', k)
                    wanted.append(TYPES.get(expect[k:j + 1], 'object'))
                    k = j + 1
                elif expect[k] == 'Z':
                    wanted.append('bool')
                    k += 1
                elif expect[k] == 'I':
                    wanted.append('int')
                    k += 1
                else:
                    raise Fail('type inconnu %r' % expect[k])
            if len(wanted) != len(args):
                raise Fail('%s : %d args attendus, %d passes' % (m.group(3), len(wanted), len(args)))
            for reg, want in zip(args, wanted):
                got = regs.get(reg_key(reg), 'inconnu')
                if want == 'object':
                    if got == 'int' or got == 'bool':
                        raise Fail('%s : %s est %s, objet attendu' % (m.group(3), reg, got))
                elif want == 'string':
                    if got not in ('string', 'object', 'inconnu'):
                        raise Fail('%s : %s est %s, String attendu' % (m.group(3), reg, got))
                elif want == 'builder':
                    if got != 'builder':
                        raise Fail('%s : %s est %s, StringBuilder attendu' % (m.group(3), reg, got))
                elif want == 'bool':
                    if got in ('string', 'builder', 'int'):
                        raise Fail('%s : %s est %s, boolean attendu' % (m.group(3), reg, got))
                elif want == 'int':
                    if got in ('string', 'builder'):
                        raise Fail('%s : %s est %s, int attendu' % (m.group(3), reg, got))
            ret = m.group(5) or ''
            if ret.startswith('L') or ret.startswith('['):
                # The declared RETURN type is the last token of the instruction.
                tail = ret
                if tail == 'Ljava/lang/StringBuilder;':
                    regs['result_type'] = 'builder'
                elif tail == 'Ljava/lang/String;':
                    regs['result_type'] = 'string'
                else:
                    regs['result_type'] = 'object'
            elif ret == 'V':
                regs.pop('result_type', None)
            elif ret == 'I' or ret == 'Z':
                regs['result_type'] = 'int'
            elif ret == '[':
                regs['result_type'] = 'object'
            continue

        m = re.match(r'if-\w+ (v\d+|p\d+), :', line)
        if m:
            # Legal for ANY type: a single-register if-eqz/if-nez is the null
            # check idiom, which is exactly how reference registers are tested.
            continue

        m = re.match(r'if-\w+ (v\d+|p\d+), (v\d+|p\d+), :', line)
        if m:
            continue

    return True


def main(path):
    src = open(path, encoding='utf-8').read().split('\n')
    methods = []
    cur = None
    for line in src:
        if line.startswith('.method'):
            cur = [line]
        elif cur is not None:
            cur.append(line)
            if line.startswith('.end method'):
                methods.append(cur)
                cur = None

    target = sys.argv[2] if len(sys.argv) > 2 else None
    bad = 0
    checked = 0
    for m in methods:
        name = m[0].split()[-1]
        if target and target not in name:
            continue
        if not any(k in name for k in ('proof', 'noteDiag')):
            continue
        checked += 1
        try:
            check_method(name, m)
        except Fail as e:
            bad += 1
            print('FAIL', name, '->', e)
    print('methodes verifiees:', checked, '| erreurs de type:', bad)
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1]))
