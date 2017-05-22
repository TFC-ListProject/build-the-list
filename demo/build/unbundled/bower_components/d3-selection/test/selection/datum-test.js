var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.datum() returns the datum on the first selected element",function(e){var t={__data__:"hello"};e.equal(d3.select(t).datum(),"hello"),e.equal(d3.selectAll([null,t]).datum(),"hello"),e.end()}),tape("selection.datum(value) sets datum on the selected elements",function(e){var t={__data__:""},a={__data__:""},l=d3.selectAll([t,a]);e.equal(l.datum("bar"),l),e.equal(t.__data__,"bar"),e.equal(a.__data__,"bar"),e.end()}),tape("selection.datum(null) clears the datum on the selected elements",function(e){var t={__data__:"bar"},a={__data__:"bar"},l=d3.selectAll([t,a]);e.equal(l.datum(null),l),e.equal("__data__"in t,!1),e.equal("__data__"in a,!1),e.end()}),tape("selection.datum(function) sets the value of the datum on the selected elements",function(e){var t={__data__:"bar"},a={__data__:"bar"},l=d3.selectAll([t,a]);e.equal(l.datum(function(e,t){return t?"baz":null}),l),e.equal("__data__"in t,!1),e.equal(a.__data__,"baz"),e.end()}),tape("selection.datum(function) passes the value function data, index and group",function(e){var t=jsdom("<parent id='one'><child id='three'></child><child id='four'></child></parent><parent id='two'><child id='five'></child></parent>"),a=t.querySelector("#one"),l=t.querySelector("#two"),d=t.querySelector("#three"),n=t.querySelector("#four"),u=t.querySelector("#five"),_=[];d3.selectAll([a,l]).datum(function(e,t){return"parent-"+t}).selectAll("child").data(function(e,t){return[0,1].map(function(e){return"child-"+t+"-"+e})}).datum(function(e,t,a){_.push([this,e,t,a])}),e.deepEqual(_,[[d,"child-0-0",0,[d,n]],[n,"child-0-1",1,[d,n]],[u,"child-1-0",0,[u]]]),e.end()});