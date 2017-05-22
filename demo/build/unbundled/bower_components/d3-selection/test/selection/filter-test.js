var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.filter(…) returns a selection",function(e){var t=jsdom("<h1>hello</h1>");e.ok(d3.select(t.body).filter("body")instanceof d3.selection),e.end()}),tape("selection.filter(string) retains the selected elements that matches the selector string",function(e){var t=jsdom("<h1><span id='one'></span><span id='two'></span></h1><h1><span id='three'></span><span id='four'></span></h1>"),n=t.querySelector("#one"),r=t.querySelector("#three");e.deepEqual(d3.select(t).selectAll("span").filter("#one,#three"),{_groups:[[n,r]],_parents:[t]}),e.end()}),tape("selection.filter(function) retains elements for which the given function returns true",function(e){var t=jsdom("<h1><span id='one'></span><span id='two'></span></h1><h1><span id='three'></span><span id='four'></span></h1>"),n=t.querySelector("#one"),r=t.querySelector("#two"),l=t.querySelector("#three"),i=t.querySelector("#four");e.deepEqual(d3.selectAll([n,r,l,i]).filter(function(e,t){return 1&t}),{_groups:[[r,i]],_parents:[null]}),e.end()}),tape("selection.filter(function) passes the selector function data, index and group",function(e){var t=jsdom("<parent id='one'><child id='three'></child><child id='four'></child></parent><parent id='two'><child id='five'></child></parent>"),n=t.querySelector("#one"),r=t.querySelector("#two"),l=t.querySelector("#three"),i=t.querySelector("#four"),o=t.querySelector("#five"),s=[];d3.selectAll([n,r]).datum(function(e,t){return"parent-"+t}).selectAll("child").data(function(e,t){return[0,1].map(function(e){return"child-"+t+"-"+e})}).filter(function(e,t,n){s.push([this,e,t,n])}),e.deepEqual(s,[[l,"child-0-0",0,[l,i]],[i,"child-0-1",1,[l,i]],[o,"child-1-0",0,[o]]]),e.end()}),tape("selection.filter(…) propagates parents from the originating selection",function(e){var t=jsdom("<parent><child>1</child></parent><parent><child>2</child></parent>"),n=d3.select(t).selectAll("parent"),r=n.filter(function(){return!0});e.deepEqual(n,{_groups:[t.querySelectorAll("parent")],_parents:[t]}),e.deepEqual(r,{_groups:[t.querySelectorAll("parent")],_parents:[t]}),e.ok(n._parents===r._parents),e.end()}),tape("selection.filter(…) can filter elements when the originating selection is nested",function(e){var t=jsdom("<parent id='one'><child><span id='three'></span></child></parent><parent id='two'><child><span id='four'></span></child></parent>"),n=t.querySelector("#one"),r=t.querySelector("#two"),l=t.querySelector("#three"),i=t.querySelector("#four");e.deepEqual(d3.selectAll([n,r]).selectAll("span").filter("*"),{_groups:[[l],[i]],_parents:[n,r]}),e.end()}),tape("selection.filter(…) skips missing originating elements and does not retain the original indexes",function(e){var t=jsdom("<h1>hello</h1>"),n=t.querySelector("h1");e.deepEqual(d3.selectAll([,n]).filter("*"),{_groups:[[n]],_parents:[null]}),e.deepEqual(d3.selectAll([null,n]).filter("*"),{_groups:[[n]],_parents:[null]}),e.deepEqual(d3.selectAll([void 0,n]).filter("*"),{_groups:[[n]],_parents:[null]}),e.end()}),tape("selection.filter(…) skips missing originating elements when the originating selection is nested",function(e){var t=jsdom("<parent id='one'><child></child><child id='three'></child></parent><parent id='two'><child></child><child id='four'></child></parent>"),n=t.querySelector("#one"),r=t.querySelector("#two"),l=t.querySelector("#three"),i=t.querySelector("#four");e.deepEqual(d3.selectAll([n,r]).selectAll("child").select(function(e,t){return 1&t?this:null}).filter("*"),{_groups:[[l],[i]],_parents:[n,r]}),e.end()});