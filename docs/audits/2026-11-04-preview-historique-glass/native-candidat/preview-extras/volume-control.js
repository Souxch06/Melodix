(function(action, requested) {
    'use strict';
    // Only a uniquely identified native range inside Spotify's volume-bar.
    // No session data, network, Android audio or synthetic playback command.
    var nodes=Array.from(document.querySelectorAll('[data-testid="volume-bar"] input[type="range"], input[data-testid="volume-bar"][type="range"]')).filter(function(n){return n.isConnected;});
    if(nodes.length!==1)return JSON.stringify({ok:false,reason:nodes.length?'ambiguous':'absent'});
    var input=nodes[0];if(input.disabled||input.getAttribute('aria-disabled')==='true')return JSON.stringify({ok:false,reason:'disabled'});
    var min=input.hasAttribute('min')?Number(input.min):0, max=input.hasAttribute('max')?Number(input.max):100, current=Number(input.value);
    if(!isFinite(min)||!isFinite(max)||max<=min||!isFinite(current)||current<min||current>max)return JSON.stringify({ok:false,reason:'range'});
    if(action==='query')return JSON.stringify({ok:true,percent:Math.round(100*(current-min)/(max-min))});
    if(action!=='set'||!isFinite(Number(requested))||Number(requested)<0||Number(requested)>100)return JSON.stringify({ok:false,reason:'request'});
    try{
        var value=min+(max-min)*Number(requested)/100;
        var setter=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set;
        setter.call(input,String(value));input.dispatchEvent(new Event('input',{bubbles:true}));input.dispatchEvent(new Event('change',{bubbles:true}));
        return JSON.stringify({ok:true,sent:true});
    }catch(_){return JSON.stringify({ok:false,reason:'command'});}
})
