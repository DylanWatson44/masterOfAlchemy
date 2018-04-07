///@description ParabolaY (h, xx, p, k)
///@param h
///@param xx
///@param p
///@param k

var h = argument0
var xx = argument1
var p = argument2
var k = argument3

var answer = (h*h +xx*xx -2*xx*h + 4*p*k)/(4*p);
return answer;