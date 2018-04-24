///@description findPath(basenode, targetnode)
///@param basenode
///@param targetnode

var thepath = path_add();
path_set_closed(thepath,false)
var nodestack = ds_stack_create();
var lastvisited = noone;
var basenode = argument0;
var targetnode = argument1;
var temptarget = targetnode;

var targetlist = ds_list_create();
var currentnode = basenode;

while(ds_list_find_index(currentnode.myneighbours, temptarget) == -1){ //while1
	show_debug_message("currentnodex " + string(currentnode.x) + " current y " + string(currentnode.y));
	while(currentnode.id!=temptarget.id){ //while2
		//show_debug_message("while2");
		currentnode.visited = true;
		var nodestovisit = ds_list_create();
		for(var i = 0; i < ds_list_size(currentnode.myneighbours);i++){
			var node = ds_list_find_value(currentnode.myneighbours,i);
			if(node.visited==false){
				if(node==temptarget){
					node.searchvalue = -1000;
					ds_list_add(nodestovisit,node);
					break;
				}else{
					if(node.onthestack == false){
						//show_debug_message("higher up targetx " + string(temptarget.x) + " target y " + string(temptarget.y));
						node.searchvalue = distanceVec(node.x,node.y,temptarget.x,temptarget.y);
						ds_list_add(nodestovisit, node);
					}
				}
			}
		}
		nodestovisit = bubblesortnode(nodestovisit);
		for(var j =0; j < ds_list_size(nodestovisit);j++){
			ds_stack_push(nodestack, ds_list_find_value(nodestovisit,j));
			var noddy = ds_list_find_value(nodestovisit,j)
			noddy.onthestack = true;
		}
		ds_list_destroy(nodestovisit);
		lastvisited = currentnode;
		if(ds_stack_empty(nodestack)){
			clearhexvalues();
			ds_stack_destroy(nodestack)
			return -1;
		}else{
		currentnode = ds_stack_pop(nodestack);
		show_debug_message("bottom of while2, currentnodex " + string(currentnode.x) + " current y " + string(currentnode.y));
		}
	}//while2
	show_debug_message("Adding targetx " + string(temptarget.x) + " target y " + string(temptarget.y) + " to path");
	path_add_point(thepath,temptarget.x,temptarget.y,100);
	temptarget = lastvisited;
	currentnode = basenode;
	clearhexvalues();
	ds_stack_clear(nodestack);
}//while1
path_add_point(thepath, temptarget.x,temptarget.y,100);
path_add_point(thepath, basenode.x,basenode.y,100);
path_reverse(thepath);
//path_add_point(thepath, targetnode.x,targetnode.y,100);
clearhexvalues();

ds_stack_destroy(nodestack)
return thepath
					