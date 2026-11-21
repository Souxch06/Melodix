'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
const section=(text,a,b)=>{const i=text.indexOf(a),j=text.indexOf(b,i+1);assert.ok(i>=0&&j>i);return text.slice(i,j);};
test('home diagnostic copy action can use available width and grow with font size',()=>{
 const src=read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
 const copy=section(src,'const-string v5, "Copier le diagnostic"','invoke-virtual {p1, v4, v5}, Landroid/widget/LinearLayout;->addView');
 assert.match(copy,/setMinimumHeight\(I\)V/);assert.match(copy,/const\/4 v6, -0x1\s+const\/4 v7, -0x2\s+invoke-direct \{v5, v6, v7\}/);
});
