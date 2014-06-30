/**
*
*
*
*
*
*/

function Set(){
	this.data= [];

	this.add = function (elem) {
		if(this.data.indexOf(elem) < 0){
			this.data.push(elem);
			return true;
		}else{
			return false;
		}
	};

	this.remove = function (elem) {
		var pos = this.data.indexOf(elem);
		if (pos > -1) {
			this.data.splice(pos,1);
			return true;
		}else{
			return false;
		}
	};

	this.position = function (elem) {
		return this.data.indexOf(elem);
	};

	this.get = function (position) {
		return this.data[position];
	};

	this.getAll = function () {
		return this.data;
	}

	this.set = function (older, newer) {
		var pos = this.data.indexOf(older);
		if (pos > -1) {
			this.data.splice(pos, 1, newer);
			return true;
		}else{
			return false;
		}
	};

	this.show = function () {
		console.log(this.data);
	};
};
