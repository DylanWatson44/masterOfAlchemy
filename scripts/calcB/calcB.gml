///@description calcB(q,v,R,r)
///@param q
///@param v
///@param R
///@param r

var q= argument0
var v = argument1;
var R = argument2;
var r = argument3;

var b = ( ((-2*q)/(2*v)) * ((q*q +v*v -R*R+r*r)/(2*v))) *2;

return b;