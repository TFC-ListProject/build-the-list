var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.size() returns the number of selected elements",function(e){var l=jsdom("<h1 id='one'></h1><h1 id='two'></h1>"),t=l.querySelector("#one"),s=l.querySelector("#two");e.deepEqual(d3.selectAll([]).size(),0),e.deepEqual(d3.selectAll([t]).size(),1),e.deepEqual(d3.selectAll([t,s]).size(),2),e.end()}),tape("selection.size() skips missing elements",function(e){var l=jsdom("<h1 id='one'></h1><h1 id='two'></h1>"),t=l.querySelector("#one"),s=l.querySelector("#two");e.deepEqual(d3.selectAll([,t,,s]).size(),2),e.end()});