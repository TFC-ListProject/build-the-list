!function(e,t,n){function r(e){for(var t={},n=0;n<e.length;n++)for(var r in e[n])if("offset"!=r&&"easing"!=r&&"composite"!=r){var o={offset:e[n].offset,easing:e[n].easing,value:e[n][r]};t[r]=t[r]||[],t[r].push(o)}for(var f in t){var a=t[f];if(0!=a[0].offset||1!=a[a.length-1].offset)throw{type:DOMException.NOT_SUPPORTED_ERR,name:"NotSupportedError",message:"Partial keyframes are not supported"}}return t}function o(n){var r=[];for(var o in n)for(var f=n[o],a=0;a<f.length-1;a++){var s=a,i=a+1,p=f[s].offset,u=f[i].offset,l=p,c=u;0==a&&(l=-(1/0),WEB_ANIMATIONS_TESTING&&console.assert(0==p),0==u&&(i=s)),a==f.length-2&&(c=1/0,WEB_ANIMATIONS_TESTING&&console.assert(1==u),1==p&&(s=i)),r.push({applyFrom:l,applyTo:c,startOffset:f[s].offset,endOffset:f[i].offset,easingFunction:e.parseEasingFunction(f[s].easing),property:o,interpolation:t.propertyInterpolation(o,f[s].value,f[i].value)})}return r.sort(function(e,t){return e.startOffset-t.startOffset}),r}t.convertEffectInput=function(n){var f=e.normalizeKeyframes(n),a=r(f),s=o(a);return function(e,n){if(null!=n)s.filter(function(e){return n>=e.applyFrom&&n<e.applyTo}).forEach(function(r){var o=n-r.startOffset,f=r.endOffset-r.startOffset,a=0==f?0:r.easingFunction(o/f);t.apply(e,r.property,r.interpolation(a))});else for(var r in a)"offset"!=r&&"easing"!=r&&"composite"!=r&&t.clear(e,r)}},WEB_ANIMATIONS_TESTING&&(n.makePropertySpecificKeyframeGroups=r,n.makeInterpolations=o)}(webAnimationsShared,webAnimations1,webAnimationsTesting);