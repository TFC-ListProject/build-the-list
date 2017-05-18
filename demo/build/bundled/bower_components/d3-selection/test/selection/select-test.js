var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.select(…) returns a selection",function(e){var t=jsdom("<h1>hello</h1>");e.ok(d3.select(t).select("h1")instanceof d3.selection),e.end()}),tape("selection.select(string) selects the first descendant that matches the selector string for each selected element",function(e){var t=jsdom("<h1><span id='one'></span><span id='two'></span></h1><h1><span id='three'></span><span id='four'></span></h1>"),n=t.querySelector("#one"),l=t.querySelector("#three");e.deepEqual(d3.select(t).selectAll("h1").select("span"),{_groups:[[n,l]],_parents:[t]}),e.end()}),tape("selection.select(function) selects the return value of the given function for each selected element",function(e){var t=jsdom("<span id='one'></span>"),n=t.querySelector("#one");e.deepEqual(d3.select(t).select(function(){return n}),{_groups:[[n]],_parents:[null]}),e.end()}),tape("selection.select(function) passes the selector function data, index and group",function(e){var t=jsdom("<parent id='one'><child id='three'></child><child id='four'></child></parent><parent id='two'><child id='five'></child></parent>"),n=t.querySelector("#one"),l=t.querySelector("#two"),r=t.querySelector("#three"),s=t.querySelector("#four"),c=t.querySelector("#five"),a=[];d3.selectAll([n,l]).datum(function(e,t){return"parent-"+t}).selectAll("child").data(function(e,t){return[0,1].map(function(e){return"child-"+t+"-"+e})}).select(function(e,t,n){a.push([this,e,t,n])}),e.deepEqual(a,[[r,"child-0-0",0,[r,s]],[s,"child-0-1",1,[r,s]],[c,"child-1-0",0,[c]]]),e.end()}),tape("selection.select(…) propagates data if defined on the originating element",function(e){var t=jsdom("<parent><child>hello</child></parent>"),n=t.querySelector("parent"),l=t.querySelector("child");n.__data__=0,l.__data__=42,d3.select(n).select("child"),e.equal(l.__data__,0),e.end()}),tape("selection.select(…) will not propagate data if not defined on the originating element",function(e){var t=jsdom("<parent><child>hello</child></parent>"),n=t.querySelector("parent"),l=t.querySelector("child");l.__data__=42,d3.select(n).select("child"),e.equal(l.__data__,42),e.end()}),tape("selection.select(…) propagates parents from the originating selection",function(e){var t=jsdom("<parent><child>1</child></parent><parent><child>2</child></parent>"),n=d3.select(t).selectAll("parent"),l=n.select("child");e.deepEqual(n,{_groups:[t.querySelectorAll("parent")],_parents:[t]}),e.deepEqual(l,{_groups:[t.querySelectorAll("child")],_parents:[t]}),e.ok(n._parents===l._parents),e.end()}),tape("selection.select(…) can select elements when the originating selection is nested",function(e){var t=jsdom("<parent id='one'><child><span id='three'></span></child></parent><parent id='two'><child><span id='four'></span></child></parent>"),n=t.querySelector("#one"),l=t.querySelector("#two"),r=t.querySelector("#three"),s=t.querySelector("#four");e.deepEqual(d3.selectAll([n,l]).selectAll("child").select("span"),{_groups:[[r],[s]],_parents:[n,l]}),e.end()}),tape("selection.select(…) skips missing originating elements",function(e){var t=jsdom("<h1><span>hello</span></h1>"),n=t.querySelector("h1"),l=t.querySelector("span");e.deepEqual(d3.selectAll([,n]).select("span"),{_groups:[[,l]],_parents:[null]}),e.deepEqual(d3.selectAll([null,n]).select("span"),{_groups:[[,l]],_parents:[null]}),e.deepEqual(d3.selectAll([void 0,n]).select("span"),{_groups:[[,l]],_parents:[null]}),e.end()}),tape("selection.select(…) skips missing originating elements when the originating selection is nested",function(e){var t=jsdom("<parent id='one'><child></child><child><span id='three'></span></child></parent><parent id='two'><child></child><child><span id='four'></span></child></parent>"),n=t.querySelector("#one"),l=t.querySelector("#two"),r=t.querySelector("#three"),s=t.querySelector("#four");e.deepEqual(d3.selectAll([n,l]).selectAll("child").select(function(e,t){return 1&t?this:null}).select("span"),{_groups:[[,r],[,s]],_parents:[n,l]}),e.end()});