/// @description Insert description here
// You can write your code in this editor
if(steppedon==false &&movingplayer==true){
	depth = layer_get_depth(layer_get_id("layer_middle"))
	for(var i = 0; i<instance_number(obj_hex);i++){
	var hex =instance_find(obj_hex, i)	
	hex.steppedon = false;
	hex.movingplayer = false;
	}
	goingdown=true
	steppedon=true
	//alarm_set(0,30);
	//alarm_set(1,60);
}
