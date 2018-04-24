///@description clearhexvalues()

for(var i = 0; i < instance_number(obj_hex);i++){
	var hex = instance_find(obj_hex, i);
	hex.value=0;
	hex.visited = false;
	hex.onthestack = false;
}