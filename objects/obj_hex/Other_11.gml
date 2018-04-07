/// @description move the hex down
// You can write your code in this editor
//obj_player.mask_index = noone;
y = lerp(y, originy+(sprite_height/8), 0.25)
if(y<=yprevious+0.1){
	goingdown = false
	goingup = true;
	
}