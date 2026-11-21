'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('session logo uses the light foreground while details remain collapsed and copy stays available',()=>{
 const xml=fs.readFileSync('res/layout/native_session_surface.xml','utf8');
 assert.match(xml,/id="@\+id\/sessionLogo"[^>]*src="@drawable\/session_brand"[^>]*tint="@color\/session_text"/);
 assert.match(xml,/id="@\+id\/sessionDetailPanel"[^>]*visibility="gone"/);assert.match(xml,/id="@\+id\/sessionCopy"[^>]*text="Copier le diagnostic"/);
 const colors=fs.readFileSync('res/values/session_status.xml','utf8');assert.match(colors,/name="session_text">#F5F5FA/);assert.match(colors,/name="session_bg">#0B0B14/);
});
