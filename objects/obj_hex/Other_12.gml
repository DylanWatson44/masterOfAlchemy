/// @description move the hex back up
// You can write your code in this editor
y = lerp(y, originy, 0.1)
//obj_player.y=y;
//movingplayer = true;
if(y>=yprevious-0.1){
	y=originy;
	goingup = false
	//movingplayer = false;
	//obj_player.vspeed = 0;
	//obj_player.hspeed = 0;
	depth = layer_get_depth(layer_get_id("layer_hextop"))
	//obj_player.mask_index = spr_player;
}
	