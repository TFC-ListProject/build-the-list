var tape=require("tape"),jsdom=require("./jsdom"),d3=require("../");tape("d3.matcher(selector).call(element) returns true if the element matches the selector",function(e){var a=jsdom("<body class='foo'>");e.equal(d3.matcher("body").call(a.body),!0),e.equal(d3.matcher(".foo").call(a.body),!0),e.equal(d3.matcher("body.foo").call(a.body),!0),e.equal(d3.matcher("h1").call(a.body),!1),e.equal(d3.matcher("body.bar").call(a.body),!1),e.end()});