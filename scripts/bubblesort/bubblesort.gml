///@description bubblesort(list)
///@param list

var list = argument0;
var n = ds_list_size(list);
var swapped = false;
for(var i = 0; i <n-1;i++){
	 swapped = false;
	 for(var j = 0; j <n-i-1;j++){
		 if(ds_list_find_value(list,j) > ds_list_find_value(list, j+1)){
			 
			var temp1 = ds_list_find_value(list, j);
			var temp2 = ds_list_find_value(list, j+1);
			ds_list_replace(list,j,temp2);
			ds_list_replace(list,j+1,temp1);
			swapped = true;
		 }
	 }
	 if(!swapped){
		 break;
	 }
}
return list;