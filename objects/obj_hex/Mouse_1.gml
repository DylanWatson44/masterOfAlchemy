/// @description Insert description here
// You can write your code in this editor
//movedir = point_direction(obj_player.x,obj_player.y,x,y)
////if(point_distance(obj_player.x, obj_player.y, x, y)<= sprite_height){
//	for(var i = 0; i<instance_number(obj_hex);i++){
//	var hex =instance_find(obj_hex, i)	
//	hex.movingplayer = false;
//	}
//	movingplayer=true;
//}
//depth = layer_get_depth(layer_get_id("layer_middle"))

//obj_player.mymovehex = self;

with(obj_player){
	if(path_index!=-1){
	path_end();
	mymovehex =instance_nearest(x,y,obj_hex);
	}
}
if(obj_player.mymovehex.id !=self.id){
playpath = findPath(obj_player.mymovehex, self);
obj_player.movepath = playpath;
}