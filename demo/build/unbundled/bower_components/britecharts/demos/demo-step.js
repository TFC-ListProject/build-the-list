"use strict";function createStepChart(){var e,t,a=step(),r=miniTooltip(),i=new dataBuilder.StepDataBuilder,s=d3Selection.select(".js-step-chart-container"),c=s.node()?s.node().getBoundingClientRect().width:!1;c&&(d3Selection.select("#button").on("click",function(){a.exportChart("stepchart.png","Britecharts Step Chart")}),t=i.withSmallData().build(),a.width(c).height(300).xAxisLabel("Meal Type").xAxisLabelOffset(45).yAxisLabel("Quantity").yAxisLabelOffset(-50).margin({top:40,right:40,bottom:10,left:80}).on("customMouseOver",r.show).on("customMouseMove",r.update).on("customMouseOut",r.hide),s.datum(t.data).call(a),r.nameLabel("key"),e=d3Selection.select(".js-step-chart-container .step-chart .metadata-group"),e.datum([]).call(r))}var d3Selection=require("d3-selection"),PubSub=require("pubsub-js"),step=require("./../src/charts/step"),miniTooltip=require("./../src/charts/mini-tooltip"),dataBuilder=require("./../test/fixtures/stepChartDataBuilder");if(d3Selection.select(".js-step-chart-container").node()){createStepChart();var redrawCharts=function(){d3Selection.select(".step-chart").remove(),createStepChart()};PubSub.subscribe("resize",redrawCharts)}