!function(e){function n(n){function t(n){var t=e.consumeToken(/^inset/i,n);if(t)return r.inset=!0,t;var t=e.consumeLengthOrPercent(n);if(t)return r.lengths.push(t[0]),t;var t=e.consumeColor(n);return t?(r.color=t[0],t):void 0}var r={inset:!1,lengths:[],color:null},o=e.consumeRepeated(t,/^/,n);return o&&o[0].length?[r,o[1]]:void 0}function t(t){var r=e.consumeRepeated(n,/^,/,t);return r&&""==r[1]?r[0]:void 0}function r(n,t){for(;n.lengths.length<Math.max(n.lengths.length,t.lengths.length);)n.lengths.push({px:0});for(;t.lengths.length<Math.max(n.lengths.length,t.lengths.length);)t.lengths.push({px:0});if(n.inset==t.inset&&!!n.color==!!t.color){for(var r,o=[],s=[[],0],l=[[],0],h=0;h<n.lengths.length;h++){var i=e.mergeDimensions(n.lengths[h],t.lengths[h],2==h);s[0].push(i[0]),l[0].push(i[1]),o.push(i[2])}if(n.color&&t.color){var u=e.mergeColors(n.color,t.color);s[1]=u[0],l[1]=u[1],r=u[2]}return[s,l,function(e){for(var t=n.inset?"inset ":" ",s=0;s<o.length;s++)t+=o[s](e[0][s])+" ";return r&&(t+=r(e[1])),t}]}}function o(n,t,r,o){function s(e){return{inset:e,color:[0,0,0,0],lengths:[{px:0},{px:0},{px:0},{px:0}]}}for(var l=[],h=[],i=0;i<r.length||i<o.length;i++){var u=r[i]||s(o[i].inset),g=o[i]||s(r[i].inset);l.push(u),h.push(g)}return e.mergeNestedRepeated(n,t,l,h)}var s=o.bind(null,r,", ");e.addPropertiesHandler(t,s,["box-shadow","text-shadow"])}(webAnimations1);