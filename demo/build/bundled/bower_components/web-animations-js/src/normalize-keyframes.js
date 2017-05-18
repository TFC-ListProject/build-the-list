!function(o,r){function e(o,r){return o in s?s[o][r]||r:r}function t(o){return"display"===o||0===o.lastIndexOf("animation",0)||0===o.lastIndexOf("transition",0)}function i(o,r,i){if(!t(o)){var n=d[o];if(n){a.style[o]=r;for(var f in n){var l=n[f],s=a.style[l];i[l]=e(l,s)}}else i[o]=e(o,r)}}function n(o){var r=[];for(var e in o)if(!(e in["easing","offset","composite"])){var t=o[e];Array.isArray(t)||(t=[t]);for(var i,n=t.length,f=0;n>f;f++)i={},"offset"in o?i.offset=o.offset:1==n?i.offset=1:i.offset=f/(n-1),"easing"in o&&(i.easing=o.easing),"composite"in o&&(i.composite=o.composite),i[e]=t[f],r.push(i)}return r.sort(function(o,r){return o.offset-r.offset}),r}function f(r){function e(){var o=t.length;null==t[o-1].offset&&(t[o-1].offset=1),o>1&&null==t[0].offset&&(t[0].offset=0);for(var r=0,e=t[0].offset,i=1;o>i;i++){var n=t[i].offset;if(null!=n){for(var f=1;i-r>f;f++)t[r+f].offset=e+(n-e)*f/(i-r);r=i,e=n}}}if(null==r)return[];window.Symbol&&Symbol.iterator&&Array.prototype.from&&r[Symbol.iterator]&&(r=Array.from(r)),Array.isArray(r)||(r=n(r));for(var t=r.map(function(r){var e={};for(var t in r){var n=r[t];if("offset"==t){if(null!=n){if(n=Number(n),!isFinite(n))throw new TypeError("Keyframe offsets must be numbers.");if(0>n||n>1)throw new TypeError("Keyframe offsets must be between 0 and 1.")}}else if("composite"==t){if("add"==n||"accumulate"==n)throw{type:DOMException.NOT_SUPPORTED_ERR,name:"NotSupportedError",message:"add compositing is not supported"};if("replace"!=n)throw new TypeError("Invalid composite mode "+n+".")}else n="easing"==t?o.normalizeEasing(n):""+n;i(t,n,e)}return void 0==e.offset&&(e.offset=null),void 0==e.easing&&(e.easing="linear"),e}),f=!0,d=-(1/0),a=0;a<t.length;a++){var l=t[a].offset;if(null!=l){if(d>l)throw new TypeError("Keyframes are not loosely sorted by offset. Sort or specify offsets.");d=l}else f=!1}return t=t.filter(function(o){return o.offset>=0&&o.offset<=1}),f||e(),t}var d={background:["backgroundImage","backgroundPosition","backgroundSize","backgroundRepeat","backgroundAttachment","backgroundOrigin","backgroundClip","backgroundColor"],border:["borderTopColor","borderTopStyle","borderTopWidth","borderRightColor","borderRightStyle","borderRightWidth","borderBottomColor","borderBottomStyle","borderBottomWidth","borderLeftColor","borderLeftStyle","borderLeftWidth"],borderBottom:["borderBottomWidth","borderBottomStyle","borderBottomColor"],borderColor:["borderTopColor","borderRightColor","borderBottomColor","borderLeftColor"],borderLeft:["borderLeftWidth","borderLeftStyle","borderLeftColor"],borderRadius:["borderTopLeftRadius","borderTopRightRadius","borderBottomRightRadius","borderBottomLeftRadius"],borderRight:["borderRightWidth","borderRightStyle","borderRightColor"],borderTop:["borderTopWidth","borderTopStyle","borderTopColor"],borderWidth:["borderTopWidth","borderRightWidth","borderBottomWidth","borderLeftWidth"],flex:["flexGrow","flexShrink","flexBasis"],font:["fontFamily","fontSize","fontStyle","fontVariant","fontWeight","lineHeight"],margin:["marginTop","marginRight","marginBottom","marginLeft"],outline:["outlineColor","outlineStyle","outlineWidth"],padding:["paddingTop","paddingRight","paddingBottom","paddingLeft"]},a=document.createElementNS("http://www.w3.org/1999/xhtml","div"),l={thin:"1px",medium:"3px",thick:"5px"},s={borderBottomWidth:l,borderLeftWidth:l,borderRightWidth:l,borderTopWidth:l,fontSize:{"xx-small":"60%","x-small":"75%",small:"89%",medium:"100%",large:"120%","x-large":"150%","xx-large":"200%"},fontWeight:{normal:"400",bold:"700"},outlineWidth:l,textShadow:{none:"0px 0px 0px transparent"},boxShadow:{none:"0px 0px 0px 0px transparent"}};o.convertToArrayForm=n,o.normalizeKeyframes=f,WEB_ANIMATIONS_TESTING&&(r.normalizeKeyframes=f)}(webAnimationsShared,webAnimationsTesting);