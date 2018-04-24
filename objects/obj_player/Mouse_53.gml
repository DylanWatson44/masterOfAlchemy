/// @description Insert description here
// You can write your code in this editor

if(isthrowing == true){
	show_debug_message("throwing");
	mypotion = instance_create_layer(x,y,layer,obj_potion)
	mypotion.potionpath = mypath;
	//mypotion.hspeed = potionSpeedx;
	//mypotion.myTarget = targetHex;
	//mypotion.targetX = targetHex.x;
	//mypotion.halfWayPoint = distancediff/2
	////mypotion.targetHeight = targetHex.y - (timeToTarget*elevationfactor)
	//mypotion.myTTT = timeToTarget;
	//mypotion.mygrav = potionGrav*abs(ratiox);
	//mypotion.vspeed = -abs((timeToTarget*mypotion.mygrav)/2)
	isthrowing = false;
}

//show_debug_message(x);
//show_debug_message(y)