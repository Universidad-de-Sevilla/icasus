var lines = {
	lines: { show: true },
	points: { show: true },
	xaxis: { tickDecimals: 0, tickSize: 1 }
};

var bars = {
	bars: {	show: true },
	points: { show: false },
	xaxis: { tickDecimals: 0, tickSize: 1 }
};

function graficaLineas(data, place){			
	$.plot(place, data, lines);
};

function graficaBarras(data, place){			
	$.plot(place, data, bars);
};

function getValoresConTimeStamp(series){
	var json = {};
	var datos = [];
	series.forEach(function(med){						
		if(med.unidad === "Total"){
			var par = [];
			par[0]=parseFloat(med.medicion)+ 0.95;
			par[1]=parseFloat(med.valor);
			datos.push(par);
		}
	});
	
	datos.push([2013.1, ]);
	json.data = datos;
	return json;
};
