var allMonth=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	var allNameOfWeekDays=["Lu","Ma", "Mi", "Ju", "Vi", "Sa", "Do"];

	var allNameOfMonths=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];

	var newDate=new Date();

	var yearZero=newDate.getFullYear();

	var monthZero=newDate.getMonth();

	var day=newDate.getDate();

	var currentDay=0, currentDayZero=0;

	var month=monthZero, year=yearZero;

	var yearMin=2009, yearMax=2015;

	var target='';

	var hoverEle=false;

	function setTarget(e){

		if(e) return e.target;

		if(event) return event.srcElement;

	}

	function newElement(type, attrs, content, toNode) {

		var ele=document.createElement(type);

		if(attrs) {

			for(var i=0; i<attrs.length; i++) {

				eval('ele.'+attrs[i][0]+(attrs[i][2] ? '=\u0027' :'=')+attrs[i][1]+(attrs[i][2] ? '\u0027' :''));

			}

		}

		if(content) ele.appendChild(document.createTextNode(content));

		if(toNode) toNode.appendChild(ele);

		return ele;

	}

	function setMonth(ele){month=parseInt(ele.value);calender()}

	function setYear(ele){year=parseInt(ele.value);calender()}

	function setValue(ele) {

		if(ele.parentNode.className=='week' && ele.firstChild){

			var dayOut=ele.firstChild.nodeValue;

			if(dayOut < 10) dayOut='0'+dayOut;

			var monthOut=month+1;

			if(monthOut < 10) monthOut='0'+monthOut;

			target.value=dayOut+'-'+monthOut+'-'+year;

			removeCalender();

		}

	}

	function removeCalender() {

		var parentEle=document.getElementById("calender");

		while(parentEle.firstChild) parentEle.removeChild(parentEle.firstChild);

		document.getElementById('basis').parentNode.removeChild(document.getElementById('basis'));

	}		

	function calender() {

		var parentEle=document.getElementById("calender");

		parentEle.onmouseover=function(e) {

			var ele=setTarget(e);

			if(ele.parentNode.className=='week' && ele.firstChild && ele!=hoverEle) {

				if(hoverEle) hoverEle.className=hoverEle.className.replace(/hoverEle ?/,'');

				hoverEle=ele;

				ele.className='hoverEle '+ele.className;

			} else {

				if(hoverEle) {

					hoverEle.className=hoverEle.className.replace(/hoverEle ?/,'');

					hoverEle=false;

				}

			}

		}

		while(parentEle.firstChild) parentEle.removeChild(parentEle.firstChild);

		function check(){

			if(year%4==0&&(year%100!=0||year%400==0))allMonth[1]=29;

			else allMonth[1]=28;

		}

		function addClass (name) { if(!currentClass){currentClass=name} else {currentClass+=' '+name} };

		if(month < 0){month+=12; year-=1}

		if(month > 11){month-=12; year+=1}

		if(year==yearMax-1) yearMax+=1;

		if(year==yearMin) yearMin-=1;

		check();

		var control=newElement('p',[['id','control',1]],false,parentEle);

		var controlPlus=newElement('a', [['href','javascript:month--;calender()',1],['className','controlPlus',1]], '<', control);

		var select=newElement('select', [['onchange',function(){setMonth(this)}]], false, control);

		for(var i=0; i<allNameOfMonths.length; i++) newElement('option', [['value',i,1]], allNameOfMonths[i], select);

		select.selectedIndex=month;

		select=newElement('select', [['onchange',function(){setYear(this)}]], false, control);

		for(var i=yearMin; i<yearMax; i++) newElement('option', [['value',i,1]], i, select);

		select.selectedIndex=year-yearMin;

		controlPlus=newElement('a', [['href','javascript:month++;calender()',1],['className','controlPlus',1]], '>', control);

		check();

		currentDay=1-new Date(year,month,1).getDay();

		if(currentDay > 0) currentDay-=7;

		currentDayZero=currentDay;

		var newMonth=newElement('table',[['cellSpacing',0,1],['onclick',function(e){setValue(setTarget(e))}]], false, parentEle);

		var newMonthBody=newElement('tbody', false, false, newMonth);

		var tr=newElement('tr', [['className','head',1]], false, newMonthBody);

		tr=newElement('tr', [['className','weekdays',1]], false, newMonthBody);

		for(i=0;i<7;i++) td=newElement('td', false, allNameOfWeekDays[i], tr);	

		tr=newElement('tr', [['className','week',1]], false, newMonthBody);

		for(i=0; i<allMonth[month]-currentDayZero; i++){

			var currentClass=false;			

			currentDay++;

			if(currentDay==day && month==monthZero && year==yearZero) addClass ('today');

			if(currentDay <= 0 ) {

				if(currentDayZero!=-7) td=newElement('td', false, false, tr);

			}

			else {

				if((currentDay-currentDayZero)%7==0) addClass ('holiday');

				td=newElement('td', (!currentClass ? false : [['className',currentClass,1]] ), currentDay, tr);

				if((currentDay-currentDayZero)%7==0) tr=newElement('tr', [['className','week',1]], false, newMonthBody);

			}

			if(i==allMonth[month]-currentDayZero-1){

				i++;

				while(i%7!=0){i++;td=newElement('td', false, false, tr)};

			}

		}

	}

	function showCalender(ele) {

		if(document.getElementById('basis')) { removeCalender() }

		else {

			target=document.getElementById(ele.id.replace(/for_/,'')); 

			var basis=ele.parentNode.insertBefore(document.createElement('div'),ele);

			basis.id='basis';

			newElement('div', [['id','calender',1]], false, basis);

			calender();

		}

	}
