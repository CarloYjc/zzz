layui.config({
	base : "js/"
}).use([ 'form', 'element', 'layer', 'jquery' ], function() {
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, element = layui.element, $ = layui.jquery;
	loadReport1();
	loadReport2();

	function loadReport1() {
		var dom = document.getElementById("container1");
		var myChart = echarts.init(dom);
		$.ajax({
			url : ctx + '/sys/loadReport1',
			type : 'POST',
			success : function(data) {
				var data1 = [];
				var data2 = [];
				var data3 = [];
				$.each(data, function(i, p) {
					data1[i] = p['ym'];
					data2[i] = p['tamt'];
					data3[i] = p['atamt'];
				});
				myChart.setOption(option = {
					title : {
						text : '最近一年销售图',
						subtext: '单位（元）'
					},
					tooltip : {
						trigger : 'axis',
						axisPointer : {
							type : 'cross',
							label : {
								backgroundColor : '#6a7985'
							}
						}
					},
					color : [ "#ff9f7f", "#37A2DA" ],
					legend : {
						data : [ '订单金额', '实收金额' ]
					},
					toolbox : {
						feature : {
							saveAsImage : {}
						}
					},
					grid : {
						left : '3%',
						right : '4%',
						bottom : '3%',
						containLabel : true
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : true,
						data : data1
					} ],
					yAxis : [ {
						type : 'value'
					} ],
					series : [ {
						name : '订单金额',
						type : 'line',
						areaStyle : {},
						data : data2,
						itemStyle : {
							normal : {
								label : {
									show : true,
									position : 'top'
								}
							}
						}
					}, {
						name : '实收金额',
						type : 'line',
						areaStyle : {},
						data : data3,
						itemStyle : {
							normal : {
								label : {
									show : true,
									position : 'top'
								}
							}
						}
					} ]
				}, true);
			}
		});
	}

	function loadReport2() {
		var dom = document.getElementById("container2");
		var myChart = echarts.init(dom);
		$.ajax({
			url : ctx + '/sys/loadReport2',
			type : 'POST',
			success : function(data) {
				var data1 = [];
				var data2 = [];
				$.each(data, function(i, p) {
					data1[i] = p['custName'];
					data2[i] = p['tamt'];
				});
				myChart.setOption(option = {
					toolbox : {
						feature : {
							saveAsImage : {}
						}
					},
					title : {
						text : '客户销售Top10图',
						subtext: '单位（元）'
					},
					tooltip : {
						trigger : 'axis',
						axisPointer : {
							type : 'shadow'
						}
					},
					color : [ "#FFDB5C;" ],
					legend : {
						data : [ '共计' ]
					},
					grid : {
						left : '3%',
						right : '4%',
						bottom : '3%',
						containLabel : true
					},
					xAxis : {
						type : 'category',
						data : data1
					},
					yAxis : {
						type : 'value',
						boundaryGap : [ 0, 0.01 ]
					},
					series : [ {
						name : '共计',
						type : 'bar',
						barWidth : 30,
						data : data2,
						itemStyle : {
							normal : {
								label : {
									show : true,
									position : 'top'
								},
								color: function(params) {
				                	//注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
				                    var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622'];
				                    return colorList[params.dataIndex]
				                }
							}
						}
					} ]
				}, true);
			}
		});
	}

})
