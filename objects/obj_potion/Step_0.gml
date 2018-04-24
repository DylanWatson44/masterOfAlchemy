/// @description Insert description here
// You can write your code in this editor

//expand and contract the potion
//image_angle+=10;
//var expansionSpeed = 0.1
//var expansionAmount = 2
//var vamount = (1/(myTTT/2));
//if(hspeed>0){
	
//	if(x<halfWayPoint+startingX){
//		image_xscale = lerp(image_xscale, expansionAmount, expansionSpeed)
//		image_yscale = lerp(image_yscale, expansionAmount, expansionSpeed)
//		//y = lerp(y, targetHeight, vamount)
//	}else{
//		image_xscale = lerp(image_xscale, 1, expansionSpeed)
//		image_yscale = lerp(image_yscale, 1, expansionSpeed)
		
//	}
//	if(place_meeting(x,y,myTarget)){
//		hspeed=0
//		vspeed=0
//		x= lerp(x,myTarget.x,0.3)
//		y=lerp(y,myTarget.y, 0.3)
//		mygrav=0;
//	}
//	//y = lerp(y, myTarget.y, vamount)
//}else if(hspeed<0){
//	if(x>startingX - abs(halfWayPoint)){
//		image_xscale = lerp(image_xscale, expansionAmount, expansionSpeed)
//		image_yscale = lerp(image_yscale, expansionAmount, expansionSpeed)
//		//y = lerp(y, targetHeight, vamount)
//	}else{
//		image_xscale = lerp(image_xscale, 1, expansionSpeed)
//		image_yscale = lerp(image_yscale, 1, expansionSpeed)
		
//	}
//	if(place_meeting(x,y,myTarget)){
//		hspeed=0
//		vspeed=0
//		x= lerp(x,myTarget.x,0.3)
//		y=lerp(y,myTarget.y, 0.3)
//		mygrav=0;
//	}
//	//y = lerp(y, myTarget.y, vamount)
//}
if(path_position<1){
	if(path_position<0.5){
		image_xscale = Approach(image_xscale,1.8,((path_position-path_positionprevious)/2)); 
		image_yscale = image_xscale;
	}else{
		image_xscale = Approach(image_xscale,1,((path_position-path_positionprevious)/2));  
		image_yscale = image_xscale; 
	}
	
	if(image_angle>200 &&image_angle<360){
	image_angle+=14
	}else{
	image_angle+=7
	}
	image_angle %=360
}

if(potionpath!=noone){

	if(path_index == -1){
		
	//show_debug_message("attempting to path")
	path_start(potionpath, 4, path_action_stop,false);
	potionpath=noone;
	}
}else{
	//show_debug_message("mypath was empty")
}
//vspeed += mygrav
