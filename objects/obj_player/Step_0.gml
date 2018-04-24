/// @description Insert description here
// You can write your code in this editor
if(isthrowing){
	event_user(0);
}

if(mymovehex!=noone && movepath==noone && path_index==-1){
	mymovehex.movingplayer =true;
	x = Approach(x,mymovehex.x,mymovespeed)
	y =Approach(y,mymovehex.y,mymovespeed)
}

if(movepath!=noone){

	if(path_index == -1){
		
	//show_debug_message("attempting to path")
	path_start(movepath, 4, path_action_stop,true);
	movepath=noone;
	}
}else{
	if(path_position == 1){
	mymovehex =instance_nearest(x,y,obj_hex);
	}

}