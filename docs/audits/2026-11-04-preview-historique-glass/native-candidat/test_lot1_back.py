#!/usr/bin/env python3
"""Static + synthetic Smali-control-flow tests, not Android gesture tests."""
import importlib.util
import os
import re
import unittest
from pathlib import Path

here=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('patch',here/'apply_lot1_back.py')
patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])

def method(src,name):
    m=re.search(r'^\.method [^\n]*\b'+name+r'\([^\n]*\n([\s\S]*?)^\.end method',src,re.M)
    if not m: raise AssertionError('missing '+name)
    return m.group(1)

# Small fail-closed interpreter for the actual decoded back methods. Android
# Activity/view APIs are explicit mocks. This is not a Dalvik/ART emulator.
def execute(src,name,state,args=None):
    lines=[];labels={}
    for raw in method(src,name).splitlines():
        line=raw.strip().split('    #',1)[0].strip()
        if not line or line.startswith('.') or line.startswith('#'): continue
        if line.startswith(':'): labels[line]=len(lines);continue
        lines.append(line)
    regs={'p0':state, 'p1':None};regs.update(args or {});pc=0;steps=0;result=None
    while pc<len(lines):
        steps+=1
        if steps>300: raise AssertionError('step limit')
        line=lines[pc];pc+=1;op,_,rest=line.partition(' ');a=[x.strip() for x in rest.split(',')]
        def val(k):return regs.get(k.strip())
        if op in ('const/4','const/16','const'):
            regs[a[0]]=int(a[1],0)
        elif op=='const-string':
            import json
            regs[a[0]]=json.loads(rest.split(',',1)[1].strip())
        elif op=='new-instance': regs[a[0]]=[]
        elif op=='new-array': regs[a[0]]=[None]*val(a[1])
        elif op=='check-cast': pass
        elif op=='aget-object': regs[a[0]]=val(a[1])[val(a[2])]
        elif op=='aput-object': val(a[1])[val(a[2])]=val(a[0])
        elif op=='move-object': regs[a[0]]=val(a[1])
        elif op in ('move-result','move-result-object'):regs[a[0]]=result
        elif op in ('iget-object','iput-object'):
            field=a[2].split('->')[1].split(':')[0]
            if op=='iget-object':regs[a[0]]=val(a[1]).get(field)
            else:val(a[1])[field]=val(a[0])
        elif op=='goto':pc=labels[rest.strip()]
        elif op in ('if-eqz','if-nez'):
            if (not val(a[0])) if op=='if-eqz' else bool(val(a[0])):pc=labels[a[1]]
        elif op.startswith('invoke-'):
            m=re.match(r'\{([^}]*)\},\s*(\S+)',rest)
            if not m:raise AssertionError(line)
            values=[val(x) for x in m.group(1).split(',')];target=m.group(2)
            if 'ArrayDeque;-><init>' in target:pass
            elif 'ArrayDeque;->push' in target:values[0].append(values[1])
            elif 'ArrayDeque;->pop' in target:result=values[0].pop()
            elif 'ArrayDeque;->isEmpty' in target:result=not values[0]
            elif 'ArrayDeque;->clear' in target:values[0].clear()
            elif 'Activity;->findViewById' in target:result={'shown':state.get('shown',False)} if state.get('hasRoot',True) else None
            elif 'Activity;->moveTaskToBack' in target:state['backgrounded']=True;result=True
            elif 'View;->isShown' in target:result=values[0]['shown']
            elif 'String;->equals' in target:result=values[0]==values[1]
            elif 'PreviewPlayerChrome;->interceptBack' in target:result=bool(state.get('animationIntercept',False))
            elif '->lot1PushBack' in target:execute(src,'lot1PushBack',state)
            elif '->lot1PopBack' in target:execute(src,'lot1PopBack',state)
            elif '->lot1ClearBack' in target:execute(src,'lot1ClearBack',state)
            elif '->onNativeBackClick' in target:execute(src,'onNativeBackClick',state)
            elif '->setNativeScreen' in target:state['nativeCurrentScreen']=values[1]
            elif '->renderNativeRows' in target:state['renders'].append(tuple(values[1:]))
            else:raise AssertionError('unsupported '+target)
        elif op=='return':return val(rest.strip())
        elif op=='return-void':return None
        else:raise AssertionError('unsupported '+line)
    raise AssertionError('no return '+name)


class Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.files=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text(encoding='utf8') for n in patch.EXPECTED}
        cls.activity=cls.files[patch.ACTIVITY];cls.dispatcher=cls.files[patch.DISPATCHER]

    def test_original_dispatcher_body_preserved_except_guard(self):
        if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source comparison')
        new=self.dispatcher;old=(root/patch.DISPATCHER).read_text()
        inserted=new[new.index('    # Only the MainActivity'):new.index('    .line 38',new.index('    # Only the MainActivity'))]
        self.assertEqual(new.replace(inserted,''),old)
        self.assertIn('tryLot1NativeBack()Z',inserted)
        self.assertIn('instance-of',inserted)

    def test_existing_open_paths_push_and_top_level_tabs_clear(self):
        for name in ('openNativeRow','openNativeSettings','onNativePlayerExpandClick'):
            self.assertIn('lot1PushBack',method(self.activity,name),name)
        for name in ('onNativeHomeClick','onNativeSearchClick','onNativeLibraryClick'):
            self.assertIn('lot1ClearBack',method(self.activity,name),name)
        self.assertIn('lot1PopBack',method(self.activity,'onNativeBackClick'))
        self.assertIn('tryLot1NativeBack',method(self.dispatcher,'b'))

    def test_player_animation_defers_back_stack_pop(self):
        if 'PreviewPlayerChrome;->interceptBack' not in method(self.activity,'onNativeBackClick'):
            self.skipTest('player motion not applied')
        s={'shown':True,'renders':[],'nativeCurrentScreen':'player','nativeCurrentTitle':'Player',
           'nativeBackStack':[['detail','Mix','tracks','spotify:playlist:one',None]],'animationIntercept':True}
        execute(self.activity,'onNativeBackClick',s)
        self.assertEqual(s['nativeCurrentScreen'],'player')
        self.assertEqual(len(s['nativeBackStack']),1)
        s['animationIntercept']=False
        execute(self.activity,'onNativeBackClick',s)
        self.assertEqual(s['nativeCurrentScreen'],'detail')
        self.assertEqual(s['nativeBackStack'],[])

    def test_synthetic_nested_screen_return_and_player_visibility(self):
        s={'shown':True,'renders':[],'nativeCurrentScreen':'library','nativeCurrentTitle':'Library',
           'nativeCurrentJson':'library data','nativeExpectedId':'playlists','nativeExpectedSearch':None}
        execute(self.activity,'lot1PushBack',s)
        s.update(nativeCurrentScreen='detail',nativeCurrentTitle='Mix',nativeCurrentJson='tracks',nativeExpectedId='spotify:playlist:one')
        execute(self.activity,'lot1PushBack',s)
        s.update(nativeCurrentScreen='player',nativeCurrentTitle='Player')
        execute(self.activity,'lot1PushBack',s)
        s.update(nativeCurrentScreen='settings',nativeCurrentTitle='Settings')
        self.assertEqual(execute(self.activity,'tryLot1NativeBack',s),1)
        self.assertEqual(s['nativeCurrentScreen'],'player');self.assertEqual(s['renders'],[])
        self.assertEqual(execute(self.activity,'tryLot1NativeBack',s),1)
        self.assertEqual(s['nativeCurrentScreen'],'detail');self.assertEqual(s['nativeExpectedId'],'spotify:playlist:one')
        self.assertEqual(s['renders'][-1],('Mix','tracks'))
        execute(self.activity,'onNativeBackClick',s)
        self.assertEqual(s['nativeCurrentScreen'],'library');self.assertEqual(s['nativeExpectedId'],'playlists')
        self.assertEqual(s['renders'][-1],('Library','library data'))

    def test_synthetic_playlist_return_to_home_and_library_without_player_mutation(self):
        for origin in ('home','library'):
            with self.subTest(origin=origin):
                s={'shown':True,'renders':[],'nativeCurrentScreen':origin,'nativeCurrentTitle':origin,
                   'nativeCurrentJson':'saved '+origin,'nativeExpectedId':'saved-id',
                   'nativeExpectedSearch':None,'miniPlayer':{'track':'unchanged','playing':True}}
                execute(self.activity,'lot1PushBack',s)
                s.update(nativeCurrentScreen='detail',nativeCurrentTitle='Playlist',nativeCurrentJson='tracks')
                self.assertEqual(execute(self.activity,'tryLot1NativeBack',s),1)
                self.assertEqual(s['nativeCurrentScreen'],origin)
                self.assertEqual(s['renders'],[(origin,'saved '+origin)])
                self.assertEqual(s['miniPlayer'],{'track':'unchanged','playing':True})

    def test_hidden_shell_and_top_level_follow_expected_route(self):
        followup = bool(os.environ.get('MELODIX_ROOT_BACKGROUND'))
        for shown,screen in [(False,'detail'),(False,'settings'),(False,'home'),(True,'home'),(True,'search'),(True,'library')]:
            with self.subTest(shown=shown,screen=screen):
                s={'shown':shown,'renders':[],'nativeCurrentScreen':screen}
                expected = int(followup and shown and screen in ('home','search','library'))
                self.assertEqual(execute(self.activity,'tryLot1NativeBack',s),expected)
                # Library goes back to Home (renders Home rows), only Home and Search leave the app.
                self.assertEqual(s.get('backgrounded',False),bool(expected and screen!='library'))
                self.assertEqual(s['nativeCurrentScreen'],'home' if (followup and shown and screen=='library') else screen)
                if screen!='library': self.assertEqual(s['renders'],[])


if __name__=='__main__':unittest.main(verbosity=2)
