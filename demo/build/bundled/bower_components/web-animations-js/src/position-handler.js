!function(e){function t(e){var t={};for(var n in e)t[n]=-e[n];return t}function n(t){return e.consumeToken(/^(left|center|right|top|bottom)\b/i,t)||e.consumeLengthOrPercent(t)}function r(t,r){var o=e.consumeRepeated(n,/^/,r);if(o&&""==o[1]){var i=o[0];if(i[0]=i[0]||"center",i[1]=i[1]||"center",3==t&&(i[2]=i[2]||{px:0}),i.length==t){if(/top|bottom/.test(i[0])||/left|right/.test(i[1])){var s=i[0];i[0]=i[1],i[1]=s}if(/left|right|center|Object/.test(i[0])&&/top|bottom|center|Object/.test(i[1]))return i.map(function(e){return"object"==typeof e?e:c[e]})}}}function o(r){var o=e.consumeRepeated(n,/^/,r);if(o){for(var i=o[0],s=[{"%":50},{"%":50}],a=0,f=!1,u=0;u<i.length;u++){var d=i[u];"string"==typeof d?(f=/bottom|right/.test(d),a={left:0,right:0,center:a,top:1,bottom:1}[d],s[a]=c[d],"center"==d&&a++):(f&&(d=t(d),d["%"]=(d["%"]||0)+100),s[a]=d,a++,f=!1)}return[s,o[1]]}}function i(t){var n=e.consumeRepeated(o,/^,/,t);return n&&""==n[1]?n[0]:void 0}var c={left:{"%":0},center:{"%":50},right:{"%":100},top:{"%":0},bottom:{"%":100}},s=e.mergeNestedRepeated.bind(null,e.mergeDimensions," ");e.addPropertiesHandler(r.bind(null,3),s,["transform-origin"]),e.addPropertiesHandler(r.bind(null,2),s,["perspective-origin"]),e.consumePosition=o,e.mergeOffsetList=s;var a=e.mergeNestedRepeated.bind(null,s,", ");e.addPropertiesHandler(i,a,["background-position","object-position"])}(webAnimations1);