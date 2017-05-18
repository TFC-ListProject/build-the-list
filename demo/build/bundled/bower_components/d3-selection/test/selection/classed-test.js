function Node(e){this._classes=e}var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.classed(classes) returns true if and only if the first element has the specified classes",function(e){var s=jsdom("<h1 class='c1 c2'>hello</h1><h1 class='c3'></h1>");e.equal(d3.select(s).select("h1").classed(""),!0),e.equal(d3.select(s).select("h1").classed("c1"),!0),e.equal(d3.select(s).select("h1").classed("c2"),!0),e.equal(d3.select(s).select("h1").classed("c3"),!1),e.equal(d3.select(s).select("h1").classed("c1 c2"),!0),e.equal(d3.select(s).select("h1").classed("c2 c1"),!0),e.equal(d3.select(s).select("h1").classed("c1 c3"),!1),e.equal(d3.selectAll([null,s]).select("h1").classed("c1"),!0),e.equal(d3.selectAll([null,s]).select("h1").classed("c2"),!0),e.equal(d3.selectAll([null,s]).select("h1").classed("c3"),!1),e.end()}),tape("selection.classed(classes) coerces the specified classes to a string",function(e){var s=jsdom("<h1 class='c1 c2'>hello</h1><h1 class='c3'></h1>");e.equal(d3.select(s).select("h1").classed({toString:function(){return"c1 c2"}}),!0),e.end()}),tape("selection.classed(classes) gets the class attribute if classList is not supported",function(e){var s=new Node("c1 c2");e.equal(d3.select(s).classed(""),!0),e.equal(d3.select(s).classed("c1"),!0),e.equal(d3.select(s).classed("c2"),!0),e.equal(d3.select(s).classed("c3"),!1),e.equal(d3.select(s).classed("c1 c2"),!0),e.equal(d3.select(s).classed("c2 c1"),!0),e.equal(d3.select(s).classed("c1 c3"),!1),e.end()}),tape("selection.classed(classes, value) sets whether the selected elements have the specified classes",function(e){var s=jsdom(""),c=d3.select(s.body);e.equal(c.classed("c1"),!1),e.equal(c.attr("class"),null),e.equal(c.classed("c1",!0),c),e.equal(c.classed("c1"),!0),e.equal(c.attr("class"),"c1"),e.equal(c.classed("c1 c2",!0),c),e.equal(c.classed("c1"),!0),e.equal(c.classed("c2"),!0),e.equal(c.classed("c1 c2"),!0),e.equal(c.attr("class"),"c1 c2"),e.equal(c.classed("c1",!1),c),e.equal(c.classed("c1"),!1),e.equal(c.classed("c2"),!0),e.equal(c.classed("c1 c2"),!1),e.equal(c.attr("class"),"c2"),e.equal(c.classed("c1 c2",!1),c),e.equal(c.classed("c1"),!1),e.equal(c.classed("c2"),!1),e.equal(c.attr("class"),""),e.end()}),tape("selection.classed(classes, function) sets whether the selected elements have the specified classes",function(e){var s=jsdom(""),c=d3.select(s.body);e.equal(c.classed("c1 c2",function(){return!0}),c),e.equal(c.attr("class"),"c1 c2"),e.equal(c.classed("c1 c2",function(){return!1}),c),e.equal(c.attr("class"),""),e.end()}),tape("selection.classed(classes, function) passes the value function data, index and group",function(e){var s=jsdom("<parent id='one'><child id='three'></child><child id='four'></child></parent><parent id='two'><child id='five'></child></parent>"),c=s.querySelector("#one"),l=s.querySelector("#two"),a=s.querySelector("#three"),t=s.querySelector("#four"),d=s.querySelector("#five"),u=[];d3.selectAll([c,l]).datum(function(e,s){return"parent-"+s}).selectAll("child").data(function(e,s){return[0,1].map(function(e){return"child-"+s+"-"+e})}).classed("c1 c2",function(e,s,c){u.push([this,e,s,c])}),e.deepEqual(u,[[a,"child-0-0",0,[a,t]],[t,"child-0-1",1,[a,t]],[d,"child-1-0",0,[d]]]),e.end()}),tape("selection.classed(classes, value) sets the class attribute if classList is not supported",function(e){var s=new Node(null),c=d3.select(s);e.equal(c.classed("c1"),!1),e.equal(c.attr("class"),null),e.equal(c.classed("c1",!0),c),e.equal(c.classed("c1"),!0),e.equal(c.attr("class"),"c1"),e.equal(c.classed("c1 c2",!0),c),e.equal(c.classed("c1"),!0),e.equal(c.classed("c2"),!0),e.equal(c.classed("c1 c2"),!0),e.equal(c.attr("class"),"c1 c2"),e.equal(c.classed("c1",!1),c),e.equal(c.classed("c1"),!1),e.equal(c.classed("c2"),!0),e.equal(c.classed("c1 c2"),!1),e.equal(c.attr("class"),"c2"),e.equal(c.classed("c1 c2",!1),c),e.equal(c.classed("c1"),!1),e.equal(c.classed("c2"),!1),e.equal(c.attr("class"),""),e.end()}),tape("selection.classed(classes, value) coerces the specified classes to a string",function(e){var s=jsdom("<h1>hello</h1>"),c=d3.select(s).select("h1");e.equal(c.classed("c1 c2"),!1),e.equal(c.classed({toString:function(){return"c1 c2"}},!0),c),e.equal(c.classed("c1 c2"),!0),e.end()}),Node.prototype={getAttribute:function(e){return"class"===e?this._classes:null},setAttribute:function(e,s){"class"===e&&(this._classes=s)}};