///@description Quadratic(a, b, c, boolFirst)
///@param a
///@param b
///@param c
///@oaram boolFirst

var a = argument0;
var b = argument1;
var c = argument2;
var firstOrSecond = argument3;
var myx = 0;
if(firstOrSecond == true){
	myx = (-b-sqrt(b*b - 4*a*c))/(2*a)
}
else{
	myx = (-b+sqrt(b*b - 4*a*c))/(2*a)
}
return myx
