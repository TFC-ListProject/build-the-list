var tape=require("tape"),jsdom=require("../jsdom"),d3=require("../../");tape("selection.call(function) calls the specified function, passing the selection",function(e){var n,t=jsdom(),a=d3.select(t);e.equal(a.call(function(e){n=e}),a),e.equal(n,a),e.end()}),tape("selection.call(function, arguments…) calls the specified function, passing the additional arguments",function(e){var n=[],t={},a={},i=jsdom(),l=d3.select(i);e.equal(l.call(function(e,t,a){n.push(e,t,a)},t,a),l),e.deepEqual(n,[l,t,a]),e.end()});