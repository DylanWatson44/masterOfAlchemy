/// @description Insert description here
// You can write your code in this editor

//expand and contract the potion
//image_angle+=10;
var expansionSpeed = 0.1
var expansionAmount = 2
var vamount = (1/(myTTT/2));
if(hspeed>0){
	
	if(x<halfWayPoint+startingX){
		image_xscale = lerp(image_xscale, expansionAmount, expansionSpeed)
		image_yscale = lerp(image_yscale, expansionAmount, expansionSpeed)
		//y = lerp(y, targetHeight, vamount)
	}else{
		image_xscale = lerp(image_xscale, 1, expansionSpeed)
		image_yscale = lerp(image_yscale, 1, expansionSpeed)
		
	}
	if(place_meeting(x,y,myTarget)){
		hspeed=0
		vspeed=0
		x= lerp(x,myTarget.x,0.3)
		y=lerp(y,myTarget.y, 0.3)
		mygrav=0;
	}
	//y = lerp(y, myTarget.y, vamount)
}else if(hspeed<0){
	if(x>startingX - abs(halfWayPoint)){
		image_xscale = lerp(image_xscale, expansionAmount, expansionSpeed)
		image_yscale = lerp(image_yscale, expansionAmount, expansionSpeed)
		//y = lerp(y, targetHeight, vamount)
	}else{
		image_xscale = lerp(image_xscale, 1, expansionSpeed)
		image_yscale = lerp(image_yscale, 1, expansionSpeed)
		
	}
	if(place_meeting(x,y,myTarget)){
		hspeed=0
		vspeed=0
		x= lerp(x,myTarget.x,0.3)
		y=lerp(y,myTarget.y, 0.3)
		mygrav=0;
	}
	//y = lerp(y, myTarget.y, vamount)
}

vspeed += mygrav