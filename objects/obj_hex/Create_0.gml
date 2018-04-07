/// @description Insert description here
// You can write your code in this editor
steppedon=false;
goingdown=false;
goingup=false;
originy = y;
originscaley = image_yscale;
originscalex = image_xscale;

mybase = instance_create_layer(x,y+sprite_height/2,layer_get_id("layer_hexbase"), hexbase);
myneighbours = ds_list_create()

if(instance_position(x+100,y, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x+100,y, obj_hex))
}
if(instance_position(x-100,y, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x-100,y, obj_hex))
}
if(instance_position(x+50,y+60, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x+50,y+60, obj_hex))
}
if(instance_position(x-50,y+60, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x-50,y+60, obj_hex))
}
if(instance_position(x-50,y-60, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x-50,y-60, obj_hex))
}
if(instance_position(x+50,y-60, obj_hex)!=noone){
	ds_list_add(myneighbours,instance_position(x+50,y-60, obj_hex))
}