var Pencil = Class.create();
Pencil.prototype = {
	initialize: function(canvas, options) {
	  this.options = Object.extend({
      max_steps: 12,
		  rotation_function: function(thing, step) {
		    return(Math.PI*2*Math.PI/step);
		  },
		  bg_opacity: 0.05
	  }, options || {})
    this.canvas = canvas;
	this.ctx = canvas.getContext("2d");
    this.maxX = canvas.offsetWidth;
    this.maxY = canvas.offsetHeight;


    this.offsetX = 0;
    this.offsetY =  0;

    if (!(this.canvas==null)){
	  this.offsetX = Position.cumulativeOffset(this.canvas)[0];
	  this.offsetY = Position.cumulativeOffset(this.canvas)[1];
	 }
	
	this.X0 = 0;
    this.Y0= 0;
	this.X1 = 0;
    this.Y1= 0;
	
	
    
	var stroke = new Array();

    
    this.canvas.onmousedown = function(e) {
      this.drawing = true;

    }.bind(this);
    this.canvas.onmouseup = function(e) {
	  	this.ctx.fillStyle = 'rgba(175, 175, 175, 0.2)'; // this value originally was 30,30,30, 0.2
			this.ctx.fillRect(0,0,this.maxX,this.maxY);
      this.drawing = false;
	 //alert('line data: ' + stroke.toJSON());
	 stroke.clear();
	 
	 
    }.bind(this);
		this.canvas.onmousemove = function(e) { 
		  this.set_Pencil_target(Event.pointerX(e) - this.offsetX, 
		                          Event.pointerY(e)  - this.offsetY);
		this.draw(stroke);
	  }.bind(this);
	  this.set_Pencil_target(0,0);
   	  
  },
	
	draw: function(myarray) {
	  this.offsetX = Position.cumulativeOffset(this.canvas)[0];
	  this.offsetY = Position.cumulativeOffset(this.canvas)[1];
    this.foo(myarray);
	},

	foo: function(myarray) {
	if(this.drawing){
		var segment = new Array();
		var now = new Date();
		
		//this.ctx.fillStyle = 'rgba(30,30,30,0.00)';
		//this.ctx.fillRect(0,0,this.maxX,this.maxY);

		//this.ctx.fillStyle = 'rgba(0,150,255,.05)';
		//this.ctx.strokeStyle = 'black';
    //this.ctx.fillRect(0,0,this.maxX/2,this.maxY);
    //this.ctx.lineCap = "round";
    //this.ctx.lineCap = "butt";

	
	this.ctx.strokeStyle = 'rgba(0, 130,220,0.8)';
	this.ctx.lineWidth = 1;
	this.line(this.old_target.x, this.old_target.y, this.target.x, this.target.y );
	
	this.ctx.fillStyle = 'rgba(0, 130,220,0.2)';
	this.ctx.beginPath();
    this.ctx.arc(this.target.x, this.target.y,2,0,Math.PI*2,true);
    this.ctx.fill();
    segment.push( this.old_target.x, this.old_target.y, this.target.x, this.target.y );
    // i only need to store the startpoint because the endpoint is the startpoint of the next one
    // except for the last one
    // segment.push( this.old_target.x, this.old_target.y);
    myarray.push(segment);


    }
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
  }
}

window.onload = function(e) {  
  r = new Pencil($('paper-0'), {
    max_steps: 16, 
    rotation_function: function(thing, steps) {
      return(Math.PI*Math.PI/steps);
    },
    bg_opacity: 0.005});
  //setInterval(function() { r.draw() },0);
}