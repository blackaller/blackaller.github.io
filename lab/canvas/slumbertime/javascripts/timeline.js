var Timeline = Class.create();
Timeline.prototype = {
	initialize: function(canvas, options) {
	  this.options = Object.extend({
    
		  bg_opacity: 0.05
	  }, options || {})
    this.canvas = canvas;
	this.ctx = canvas.getContext("2d");
    this.maxX = canvas.offsetWidth;
    this.maxY = canvas.offsetHeight;
    this.offsetX = 0;
    this.offsetY = 0;
    	
	this.offsetX = Position.cumulativeOffset(this.canvas)[0];
	this.offsetY = Position.cumulativeOffset(this.canvas)[1];
	
	this.bedtime = 0;
	this.wakeup = 0;
	
 
    this.inicio = 0;
    this.fin = 0;
    
	var now = new Date();
	var sec = now.getSeconds();
	var min = now.getMinutes();
	var hr  = now.getHours();
	//hr = hr>=12 ? hr-12 : hr;

	var startHour =0; 
	var endHour =0;
	
	var startMinute =0; 
	var endMinute =0;
	
	var startDay =0; 
	var endDay =0;
	
	this.timeline_bg();
    this.timeline_markers();
    
    this.timeline_now();
    this.drawing = false;
	
	
    this.canvas.onmousedown = function(e) {
	  
	  	this.set_start_target(Event.pointerX(e) - this.offsetX, 
		                      Event.pointerY(e)  - this.offsetY);
	  
      this.drawing = true;
    //alert('drawing state: ' + this.drawing + '\nstartX: ' + this.inicio + '\nendX: ' +this.fin);
    }.bind(this);
    this.canvas.onmouseup = function(e) {
	  
    this.drawing = false;	  
	
	//this.offsetX = Position.cumulativeOffset(this.canvas)[0];
	//this.offsetY = Position.cumulativeOffset(this.canvas)[1];
	
	
	this.startHour = this.linetoHour(this.start.x);	  
	this.startMinute = this.linetoMinute(this.start.x);
	this.startDay = this.linetoDay(this.start.x);
	
    this.endHour = this.linetoHour(Event.pointerX(e) - this.offsetX);	
	this.endMinute = this.linetoMinute(Event.pointerX(e) - this.offsetX);
	this.endDay = this.linetoDay(Event.pointerX(e) - this.offsetX);
	
	 //alert('startX: ' + this.startTime + '\nendX: ' + this.endTime + '\noffsetX: ' +  this.offsetX + '\noffsetY: ' + this.offsetY);
     //alert('startX: ' + this.startTime + '\nendX: ' + this.endTime + '\n' + hr + ':' + min + '\n' + this.timetoLine(hr, min));
     //alert('drawing state: ' + this.drawing + '\nstartX: ' + this.inicio + '\nendX: ' +this.fin);	
     //alert(  '\nstart Day: ' + this.startDay + '\nstart Time: ' + this.startHour  + ':' + this.startMinute + '\nend Day: ' + this.endDay +  '\nend Time: ' + this.endHour + ': ' + this.endMinute );
	//alert(this.pointtoDate(this.start.x) + "\n" + this.pointtoDate(Event.pointerX(e) - this.offsetX));
	this.bedtime = this.pointtoDate(this.start.x);
	this.wakeup = this.pointtoDate(Event.pointerX(e) - this.offsetX);
	
	if (this.bedtime<this.wakeup)
		alert("bedtime: " + "\n" + this.bedtime + "\n" + "wakeup: " + "\n" + this.wakeup);
	else
		alert("bedtime: " + "\n" + this.wakeup + "\n" + "wakeup: " + "\n" + this.bedtime);
	
    }.bind(this);
	this.canvas.onmousemove = function(e) {
		var x = Event.pointerX(e) - this.offsetX;
		var y = Event.pointerY(e)  - this.offsetY;
		this.set_Pencil_target(x, y);
		this.draw();
		// throw new Error(x+", "+y);
	 }.bind(this);
	 this.set_Pencil_target(0,0);   	  
  },
	
	linetoHour: function(pointX){
		var hrX =pointX;
		
		return((Math.floor (((hrX-50) / 15) + 12)) % 24);	
	},
	
	linetoMinute: function(pointX){
		var minX =pointX;
		
		return(((minX-50) % 15) * 4);	
	},
	
	linetoDay: function(pointX){
		var today = new Date();
		var yesterday = new Date();
        var tomorrow = new Date();
        yesterday.setDate(today.getDate()-1);
        tomorrow.setDate(today.getDate()+1);	
 	
		if ((pointX >=230) && (pointX <=590))
			return(today.getDate());
		else{
			if (pointX<230)
			 	return(yesterday.getDate());
		     else
		     	return(tomorrow.getDate());
		}
	},
	
	
	// i need pointtoDate that sets and returns a date object, aware of the last month and stuff kind of day
	pointtoDate: function(pointX){
		var now = new Date();
		var then = new Date();
		
		then.setHours(this.linetoHour(pointX));
		then.setMinutes(this.linetoMinute(pointX));
				
		if ((pointX >=230) && (pointX <=590))
			then.setDate(now.getDate());
		else{
			if (pointX<230)
			 	then.setDate(now.getDate()-1);
		     else
		     	then.setDate(now.getDate()+1);
		}
		
		if (pointX<230 && then.getDate()>now.getDate()){
		 	then.setMonth(now.getMonth()-1);
		    if (then.getMonth()>now.getMonth())
			 	then.setFullYear(now.getFullYear()-1);
			}
	     else{
	        if (pointX>590 && then.getDate()<now.getDate())
	     	  then.setMonth(now.getMonth()+1);{
	          if (then.getMonth()<now.getMonth())
	     	    then.setFullYear(now.getFullYear()+1);
	        }
		}

		return then;	
	},
	
	
	timetoLine: function(hr, min){
		var pointX =230 + (((hr*60) + min)/4);
		return(pointX);	
	},
	
	draw: function() {
	this.ctx.clearRect(0,0,820,120);
	
		
	this.offsetX = Position.cumulativeOffset(this.canvas)[0];
	this.offsetY = Position.cumulativeOffset(this.canvas)[1];
	
	
	this.timeline_bg();
	this.timeline_markers();
	this.timeline_now();
    this.foo(this.inicio,this.fin);
	},
	
	timeline_now: function(){
			var now = new Date();
			var sec = now.getSeconds();
			var min = now.getMinutes();
			var hr  = now.getHours();
		this.ctx.lineWidth = 4;
		this.ctx.strokeStyle = "deeppink";
		this.ctx.beginPath();
		this.ctx.moveTo(this.timetoLine(hr, min),0);
		this.ctx.lineTo(this.timetoLine(hr, min),60);
		this.ctx.closePath();
		this.ctx.stroke();		
	},

	
	timeline_bg: function(){
		
		this.ctx.fillStyle = "yellow";
		
		var lingrad2 = this.ctx.createLinearGradient(180,0,640,0);
	 	lingrad2.addColorStop(0, "rgba(255,255,0,0)");
	  	lingrad2.addColorStop(.3, "yellow");
	  	lingrad2.addColorStop(.7, "yellow");
		lingrad2.addColorStop(1, "rgba(255,255,0,0)");
		this.ctx.fillStyle = lingrad2;
		
		
		
		this.ctx.fillRect(0,0,820,120);
		
		
		var lingrad = this.ctx.createLinearGradient(50,0,770,0);
	 	lingrad.addColorStop(0, "black");
	  	lingrad.addColorStop(0.2, "dodgerblue");
	  	lingrad.addColorStop(0.8, "dodgerblue");
		lingrad.addColorStop(1, "white");
		this.ctx.fillStyle = lingrad;
		this.ctx.fillRect(0,40,820,20);
		
		
		
	},
	
	
	timeline_markers: function(){
		this.ctx.lineWidth = 4;
		for(i=0;i<=720/180;i++){
			this.ctx.strokeStyle = "#000000";
			this.ctx.beginPath();
			this.ctx.moveTo(50+180*i,100);
			this.ctx.lineTo(50+180*i,70);
			this.ctx.closePath();
			this.ctx.stroke();
		  }
        this.ctx.lineWidth = 2;
		for(i=1;i<820/15;i++){
			this.ctx.strokeStyle = "#000000";
			this.ctx.beginPath();
			this.ctx.moveTo(5+15*i,80);
			this.ctx.lineTo(5+15*i,90);
			this.ctx.closePath();
			this.ctx.stroke();
		  }	
		
	},
	
	
	foo: function(start,end) {
	
	this.ctx.fillStyle = "deeppink";
	if(this.drawing){
		
		this.inicio = this.start.x;
		this.fin = this.target.x - this.start.x;
		this.ctx.fillRect(start,40,end,20);
    }
	else 
	{ 
		
		this.ctx.fillRect(start,40,end,20);}

	},
	

	
	line: function(fromx, fromy, tox,toy) {
    this.ctx.beginPath();
    this.ctx.moveTo(fromx, fromy);
    this.ctx.lineTo(tox,toy);
    this.ctx.stroke();
	},
	
	find_pos: function(current, target, size, step_no) {
    var inc = size / Math.pow(2, step_no);
    if(current == target) return current;
	  else if(target > current) {
	    return (current + inc);
	  }else if(target < current) {
		  return (current - inc);
		}
	},
	
  set_Pencil_target: function(x, y) {
    this.old_target = this.target;
    this.target = {x:x, y:y}
  },

  set_start_target: function(x, y) {
    this.old_start = this.target;
    this.start = {x:x, y:y}
  }

}

