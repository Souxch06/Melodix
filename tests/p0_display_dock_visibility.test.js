'use strict';

// Behavioural test of the native dock visibility measurement.
//
// The P0 ownership criterion requires the native dock to be visible. The original
// check was `rootBounds.contains(dockBounds)`. That is a tautology: nativeHomeTab
// lives at main > nativeRoot > nativeTabBar > nativeHomeTab, and
// View.getGlobalVisibleRect() clips a view to its ancestors, so the dock rect is
// always inside the root rect whenever both exist. The check could not fail when
// hScrollView/WebView was drawn over the dock, which is exactly the appropriation
// the P0 is about.
//
// The replacement keeps its decision logic in `dockUnoccluded`, a static method
// with no Android types. This test extracts that method VERBATIM from the harness,
// compiles it, and executes it on a real JVM. It is not a regex over the source
// and it does not test a re-implementation: the bytes under test are the bytes
// that ship in the instrumentation.

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const ROOT = path.resolve(__dirname, '..');
const HARNESS = path.join(ROOT, 'tests/android/HomeRenderInstrumentation.java');

function extractMethod(source, signature) {
  const start = source.indexOf(signature);
  assert.notEqual(start, -1, `the harness must define ${signature}`);
  const end = source.indexOf('\n    }\n', start);
  assert.notEqual(end, -1, `could not find the end of ${signature}`);
  return source.slice(start, end + '\n    }\n'.length);
}

// Prefer javac (what CI uses). Fall back to a standalone ECJ jar and a JRE, which
// is what a sandbox without a full JDK can provide. Never silently pass.
function findToolchain() {
  const which = (name) => {
    const probe = spawnSync(process.platform === 'win32' ? 'where' : 'which', [name], { encoding: 'utf8' });
    return probe.status === 0 ? probe.stdout.split('\n')[0].trim() : null;
  };
  const javac = which('javac');
  const java = which('java');
  if (javac && java) return { kind: 'javac', javac, java };
  const ecj = process.env.MELODIX_ECJ_JAR
    || [path.join(os.homedir(), '.melodix-toolchain/ecj.jar')].find((candidate) => fs.existsSync(candidate));
  const jdk4py = '/usr/local/lib/python3.11/dist-packages/jdk4py/java-runtime/bin/java';
  const runtime = java || (fs.existsSync(jdk4py) ? jdk4py : null);
  if (ecj && runtime) {
    // A pre-modules ECJ cannot read a modular JDK's system library, so it needs
    // an explicit boot classpath. android.jar carries java.* (libcore) and is the
    // same library the harness is compiled against.
    const boot = process.env.MELODIX_BOOTCLASSPATH
      || fs.readdirSync(path.dirname(ecj))
        .filter((name) => /^android-\d+\.jar$/.test(name))
        .sort()
        .map((name) => path.join(path.dirname(ecj), name))
        .pop();
    if (boot) return { kind: 'ecj', ecj, java: runtime, boot };
  }
  return null;
}

const DRIVER = `public final class Driver {
    static int pass = 0, fail = 0;
    static void check(String name, boolean actual, boolean expected) {
        if (actual == expected) { pass++; }
        else { fail++; System.out.println("FAIL " + name + " expected=" + expected + " actual=" + actual); }
    }
    static final int[] WINDOW = {0, 0, 1080, 2400};
    static final int[] DOCK   = {0, 2200, 1080, 2400};
    static boolean run(int[] dock, int[] window, float nativeZ, int nativeIndex,
            float[] zs, int[] idx, int[][] bounds, boolean[] shown) {
        return DockProbe.dockUnoccluded(dock, window, nativeZ, nativeIndex, zs, idx, bounds, shown);
    }
    public static void main(String[] args) {
        int[][] full = {{0, 0, 1080, 2400}};
        check("visible dock, no occluder", run(DOCK, WINDOW, 0f, 1, new float[]{0f}, new int[]{0}, full, new boolean[]{false}), true);
        // The discriminating case: WebView drawn ABOVE the native shell, over the dock.
        check("webview above covering dock", run(DOCK, WINDOW, 0f, 1, new float[]{0f}, new int[]{2}, full, new boolean[]{true}), false);
        check("webview below covering dock", run(DOCK, WINDOW, 0f, 1, new float[]{0f}, new int[]{0}, full, new boolean[]{true}), true);
        check("webview above but clear of dock", run(DOCK, WINDOW, 0f, 1, new float[]{0f}, new int[]{2}, new int[][]{{0,0,1080,1000}}, new boolean[]{true}), true);
        check("splash higher Z covering", run(DOCK, WINDOW, 0f, 1, new float[]{5f}, new int[]{0}, full, new boolean[]{true}), false);
        check("splash lower Z covering", run(DOCK, WINDOW, 5f, 1, new float[]{0f}, new int[]{2}, full, new boolean[]{true}), true);
        check("equal Z higher draw index", run(DOCK, WINDOW, 3f, 1, new float[]{3f}, new int[]{2}, full, new boolean[]{true}), false);
        check("equal Z lower draw index", run(DOCK, WINDOW, 3f, 2, new float[]{3f}, new int[]{1}, full, new boolean[]{true}), true);
        check("non-child occluder ignored", run(DOCK, WINDOW, 0f, 1, new float[]{9f}, new int[]{-1}, full, new boolean[]{true}), true);
        check("dock translated off window", run(new int[]{0,2400,1080,2600}, WINDOW, 0f, 1, null, null, null, null), false);
        check("dock partly off window", run(new int[]{-10,2200,1080,2400}, WINDOW, 0f, 1, null, null, null, null), false);
        check("degenerate dock", run(new int[]{0,2200,1080,2200}, WINDOW, 0f, 1, null, null, null, null), false);
        check("null dock", run(null, WINDOW, 0f, 1, null, null, null, null), false);
        check("null window", run(DOCK, null, 0f, 1, null, null, null, null), false);
        check("dock exactly filling window", run(new int[]{0,0,1080,2400}, WINDOW, 0f, 1, null, null, null, null), true);
        check("dock centre on exclusive occluder edge", run(DOCK, WINDOW, 0f, 1, new float[]{0f}, new int[]{2}, new int[][]{{0,0,540,2400}}, new boolean[]{true}), true);
        check("transparent occluder", run(DOCK, WINDOW, 0f, 1, new float[]{9f}, new int[]{2}, full, new boolean[]{false}), true);
        check("occluder without bounds", run(DOCK, WINDOW, 0f, 1, new float[]{9f}, new int[]{2}, new int[][]{null}, new boolean[]{true}), true);
        check("empty occluder array", run(DOCK, WINDOW, 0f, 1, new float[]{}, new int[]{}, new int[][]{}, new boolean[]{}), true);
        check("malformed dock array", run(new int[]{0,2200,1080}, WINDOW, 0f, 1, null, null, null, null), false);
        // Documents the defect that was fixed: ancestor containment stayed true
        // even with the WebView over the dock.
        int[] root = {0,0,1080,2400};
        boolean oldTautology = DOCK[0]>=root[0] && DOCK[1]>=root[1] && DOCK[2]<=root[2] && DOCK[3]<=root[3];
        check("old ancestor-containment formula was a tautology", oldTautology, true);
        System.out.println("# pass " + pass);
        System.out.println("# fail " + fail);
        if (fail > 0) System.exit(1);
    }
}
`;

test('the native dock visibility rule is executed and rejects a WebView drawn over the dock', (t) => {
  const source = fs.readFileSync(HARNESS, 'utf8');
  const method = extractMethod(source, '    static boolean dockUnoccluded(');

  // Structural guarantees that keep the extraction honest and the adapter read-only.
  assert.match(source, /private boolean nativeDockActuallyVisible\(Rect dockBounds, ViewGroup mainRoot, View nativeRoot,\s*View hScroll, View splash\)/);
  assert.match(source, /return dockUnoccluded\(dock, window, nativeRoot\.getZ\(\), mainRoot\.indexOfChild\(nativeRoot\),/);
  assert.doesNotMatch(method, /android\./, 'the pure rule must not depend on Android types');
  assert.doesNotMatch(method, /\.set[A-Z]|\.remove|\.add|invalidate\(|requestLayout\(/,
    'the measurement must stay strictly read-only');

  const toolchain = findToolchain();
  if (!toolchain) {
    // Honest skip: without a compiler the rule cannot be executed. CI installs
    // JDK 17 and runs this for real; a bare sandbox must not pretend it did.
    t.skip('no javac and no ECJ jar available: the dock rule was not executed');
    return;
  }

  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-dock-'));
  try {
    fs.writeFileSync(path.join(tmp, 'DockProbe.java'), `public final class DockProbe {\n${method}\n}\n`);
    fs.writeFileSync(path.join(tmp, 'Driver.java'), DRIVER);
    const compiled = toolchain.kind === 'javac'
      ? spawnSync(toolchain.javac, ['-d', tmp, 'DockProbe.java', 'Driver.java'], { cwd: tmp, encoding: 'utf8' })
      : spawnSync(toolchain.java, ['-cp', toolchain.ecj, 'org.eclipse.jdt.internal.compiler.batch.Main',
        '-source', '1.7', '-target', '1.7', '-bootclasspath', toolchain.boot,
        '-d', tmp, '-nowarn', 'DockProbe.java', 'Driver.java'],
      { cwd: tmp, encoding: 'utf8' });
    assert.equal(compiled.status, 0, `the extracted rule must compile: ${compiled.stderr}`);
    assert.ok(fs.existsSync(path.join(tmp, 'DockProbe.class')), 'the rule must produce bytecode');

    const executed = spawnSync(toolchain.java, ['-cp', tmp, 'Driver'], { encoding: 'utf8' });
    assert.equal(executed.status, 0, `the dock rule failed a case: ${executed.stdout}${executed.stderr}`);
    assert.match(executed.stdout, /# fail 0/);
    const passes = /# pass (\d+)/.exec(executed.stdout);
    assert.ok(passes && Number(passes[1]) >= 21, 'every documented dock case must have run');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});
