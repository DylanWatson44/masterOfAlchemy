/// @description Insert description here
// You can write your code in this editor
draw_self()

if(targetHex!=noone){
	mypath = path_add();
	var numpoints = 20;
	var spread = circQ/numpoints
	for(var i=0; i <=numpoints;i++){
	path_add_point(mypath, x+i*spread, y-ParabolaY(focusX,i*spread,constP,constK), 100);
	}
	draw_path(mypath,x,y,false);
}