/// @description Insert description here
// You can write your code in this editor
if(enemypath!=noone){

	if(path_index == -1){

	//show_debug_message("attempting to path")
	path_start(enemypath, 4, path_action_stop,true);
	enemypath=noone;
	}
}else{
	mystarthex =instance_nearest(x,y,obj_hex);
}