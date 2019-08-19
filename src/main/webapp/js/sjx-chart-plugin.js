/**
 * 封装一个图表的使用插件这里是使用百度的图表接口api
 * 一个封装了 饼形图(pie) 折线图(line)	柱形图(bar)
 * 三种比较简单的图表
 * @author 宋建熙
 */
(function($) {
	$.fn.SjxChartShow = function(options) {

		var containerID = $(this).attr("ID");
		/**
		 * 需要传入的参数
		 * type为(bar line pie)
		 * data为数据：json数据
		 * 		格式为：{name：xxx,value:xxx}或{name：xxx,group:xxx,value:xxx}
		 * title为图表的主标题
		 * subTitle为图表的副标题
		 */
		var defaultSetting = {
			type : "bar",
			data : [],
			title : "",
			subTitle : ""
		};

		var UserData = $.extend(defaultSetting, options || {});

		var Echarts = {

			/*---------Chart的基本配置		的开始-------------*/
			ChartConfig : function(container, option) {
				var chart_path = "/sjx-books/js/echarts/echarts"; // 配置图表请求路径
				var map_path = "/sjx-books/js/echarts/echarts-map"; // 配置地图的请求路径

				require.config({// 引入常用的图表类型的配置
					paths : {
						echarts : chart_path,
						'echarts/chart/bar' : chart_path,
						'echarts/chart/pie' : chart_path,
						'echarts/chart/line' : chart_path,
						'echarts/chart/k' : chart_path,
						'echarts/chart/scatter' : chart_path,
						'echarts/chart/radar' : chart_path,
						'echarts/chart/chord' : chart_path,
						'echarts/chart/force' : chart_path,
						'echarts/chart/map' : map_path
					}
				});
				this.option = {
					chart : {},
					option : option,
					container : container
				};
				return this.option;
			},
			/*---------Chart的基本配置		的结束-------------*/

			/*---------SjxChart 数据格 式化的 	开始-----------------*/
			ChartDataFormate : {
				FormateNOGroupData : function(data) {
					// data的格式如上的Result1，这种格式的数据，多用于饼图、单一的柱形图的数据源
					var categories = [];
					var datas = [];
					for ( var i = 0; i < data.length; i++) {
						categories.push(data[i].name || "");
						datas.push({
							name : data[i].name,
							value : data[i].value || 0
						});
					}
					return {
						category : categories,
						data : datas
					};
				},

				FormateGroupData : function(data, type, is_stack) {
					// data的格式如上的Result2，type为要渲染的图表类型：可以为line，bar，is_stack表示为是否是堆积图，这种格式的数据多用于展示多条折线图、分组的柱图
					var chart_type = 'line';
					if (type)
						chart_type = type || 'line';

					var xAxis = [];
					var group = [];
					var series = [];

					for ( var i = 0; i < data.length; i++) {
						for ( var j = 0; j < xAxis.length && xAxis[j] != data[i].name; j++)
							;
						if (j == xAxis.length)
							xAxis.push(data[i].name);

						for ( var k = 0; k < group.length && group[k] != data[i].group; k++)
							;
						if (k == group.length)
							group.push(data[i].group);
					}

					for ( var i = 0; i < group.length; i++) {
						var temp = [];
						for ( var j = 0; j < data.length; j++) {
							if (group[i] == data[j].group) {
								if (type == "map") {
									temp.push({
										name : data[j].name,
										value : data[i].value
									});
								} else {
									temp.push(data[j].value);
								}
							}

						}

						switch (type) {
						case 'bar':
							var series_temp = {
								name : group[i],
								data : temp,
								type : chart_type
							};
							if (is_stack)
								series_temp = $.extend({}, {
									stack : 'stack'
								}, series_temp);
							break;

						case 'map':
							var series_temp = {
								name : group[i],
								type : chart_type,
								mapType : 'china',
								selectedMode : 'single',
								itemStyle : {
									normal : {
										label : {
											show : true
										}
									},
									emphasis : {
										label : {
											show : true
										}
									}
								},
								data : temp
							};
							break;

						case 'line':
							var series_temp = {
								name : group[i],
								data : temp,
								type : chart_type
							};
							if (is_stack)
								series_temp = $.extend({}, {
									stack : 'stack'
								}, series_temp);
							break;

						default:
							var series_temp = {
								name : group[i],
								data : temp,
								type : chart_type
							};
						}
						series.push(series_temp);
					}
					return {
						category : group,
						xAxis : xAxis,
						series : series
					};
				}
			},
			/*---------SjxChart 数据格 式化的 	结束-----------------*/

			/*---------SjxChart 图表模板的 	开始-----------------*/

			ChartOptionTemplates : {

				Pie : function(data, name) {
					// data:数据格式：{name：xxx,value:xxx}...
					var pie_datas = Echarts.ChartDataFormate.FormateNOGroupData(data);
					var option = {
						tooltip : {
							trigger : 'item',
							formatter : '{b} : {c} ({d}/%)',
							show : true
						},
						legend : {
							orient : 'vertical',
							x : 'left',
							data : pie_datas.category
						},
						calculable : true,
						series : [ {
							name : name || "",
							type : 'pie',
							radius : '50%',
							center : [ '50%', '60%' ],
							data : pie_datas.data
						} ]
					};
					return $.extend({}, Echarts.SjxChartTemplatesCommon.CommonOption, option);
				},

				Lines : function(data, name, is_stack) {
					// data:数据格式：{name：xxx,group:xxx,value:xxx}...
					var stackline_datas = Echarts.ChartDataFormate.FormateGroupData(data, 'line', is_stack);
					var option = {
						legend : {
							data : stackline_datas.category
						},

						title : {
							text : UserData.title || "主标题",
							subtext : UserData.subTitle || "副标题",
							x : "left",
							y : "top",
						},

						xAxis : [ {
							type : 'category', // X轴均为category，Y轴均为value
							data : stackline_datas.xAxis,
							boundaryGap : false
						// 数值轴两端的空白策略
						} ],

						yAxis : [ {
							name : name || '',
							type : 'value',
							splitArea : {
								show : true
							}
						} ],
						series : stackline_datas.series
					};
					return $.extend({}, Echarts.SjxChartTemplatesCommon.CommonLineOption, option);
				},

				Bars : function(data, name, is_stack) {
					// data:数据格式：{name：xxx,group:xxx,value:xxx}...
					var bars_dates = Echarts.ChartDataFormate.FormateGroupData(data, 'bar', is_stack);

					var option = {
						legend : bars_dates.category,
						xAxis : [ {
							type : 'category',
							data : bars_dates.xAxis,
							axisLabel : {
								show : true,
								interval : 'auto',
								rotate : 0,
								margion : 8
							}
						} ],

						yAxis : [ {
							type : 'value',
							name : name || '',
							splitArea : {
								show : true
							}
						} ],
						series : bars_dates.series
					};
					return $.extend({}, Echarts.SjxChartTemplatesCommon.CommonLineOption, option);
				}
			},
			/*---------SjxChart 图表模板的 	结束-----------------*/

			/*---------SjxChart 图表模板	公共配置 的 	开始-----------------*/
			SjxChartTemplatesCommon : {
				CommonOption : {
					// 通用的图表基本配置
					tooltip : {
						trigger : 'axis'// tooltip触发方式:axis以X轴线触发,item以每一个数据项触发
					},
					toolbox : {
						show : true, // 是否显示工具栏
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : true
							}, // 数据预览
							restore : {
								show : true
							}, // 复原
							saveAsImage : {
								show : true
							},// 是否保存图片
						}
					},
					title : {
						text : UserData.title || "主标题",
						subtext : UserData.subTitle || "副标题",
						x : "center",
						y : "top",
						textStyle : {
							fontSize : 15,
							fontWeight : "bolder",
							color : "#333"
						},
					},
				},

				CommonLineOption : {// 通用的折线图表的基本配置
					tooltip : {
						trigger : 'axis'
					},
					calculable : true,
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : true
							}, // 数据预览
							restore : {
								show : true
							}, // 复原
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},// 支持柱形图和折线图的切换
							saveAsImage : {
								show : true
							}, // 是否保存图片
						}
					},
					title : {
						text : UserData.title || "主标题",
						subtext : UserData.subTitle || "副标题",
						x : "center",
						y : "top",
						textStyle : {
							fontSize : 15,
							fontWeight : "bolder",
							color : "#333"
						},
					},
				},
			},
		/*---------SjxChart 图表模板	公共配置 的 	结束-----------------*/

		};

		var SjxCharts = {
			SjxRenderChart : function(options) {
				require([

				'echarts', 'echarts/chart/line', 'echarts/chart/bar', 'echarts/chart/pie', 'echarts/chart/k', 'echarts/chart/scatter',
						'echarts/chart/radar', 'echarts/chart/chord', 'echarts/chart/force', 'echarts/chart/map' ],

				function(ec) {
					echarts = ec;
					if (options.chart && options.chart.dispose)
						options.chart.dispose();

					options.chart = echarts.init(options.container);
					window.onresize = options.chart.resize;
					options.chart.setOption(options.option, true);
				});
			}
		};

		var SjxChartShow = {
			ShowTheChart : function() {
				var container = document.getElementById(containerID);
				var chartType;
				var renderChart;
				switch (UserData.type) {
				case "bar":
					chartType = Echarts.ChartOptionTemplates.Bars(UserData.data);
					break;
				case "line":
					chartType = Echarts.ChartOptionTemplates.Lines(UserData.data);
					break;
				case "pie":
					chartType = Echarts.ChartOptionTemplates.Pie(UserData.data);
					break;
				}
				renderChart = SjxCharts.SjxRenderChart(Echarts.ChartConfig(container, chartType));
				return renderChart;
			},
		};

		return SjxChartShow.ShowTheChart();

	};
})(jQuery);