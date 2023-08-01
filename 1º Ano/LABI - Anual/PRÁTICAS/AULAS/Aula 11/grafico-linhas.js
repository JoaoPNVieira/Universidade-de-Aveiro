function desenhaGrafico() {
			$("#grafico-linhas").highcharts({
				title: {
					text: "Média de temperaturas",
					},
					xAxis: {
						categories: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
							"Jul", "Ago", "Set", "Out", "Nov", "Dez"]
					},
					series: [{
						name: "Lisboa",
						data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
					},{
						name: "Aveiro",
						data: [3.0, 8.9, 6.5, 18.5, 18.2, 35.5, 25.2, 12.5, 14.3, 38.3, 17.9, 15.6]
					}]
				});
			};
