/// @description calculate Path
if(instance_position(mouse_x,mouse_y, obj_hex)!=noone){
	targetHex = instance_position(mouse_x,mouse_y, obj_hex);
}else{
	targetHex = noone
}

//reductionFact = 0.66
//if(targetHex!=noone){
//	distancediff = (targetHex.x - x)
//	ratiox = (distancediff/distanceFact)*reductionFact;
//	potionSpeedx = minspeed*ratiox;
	
//		if(potionSpeedx<0){
//			potionSpeedx= clamp(potionSpeedx, -maxspeed, -minspeed);
//		}else{
//			potionSpeedx = clamp(potionSpeedx, minspeed, maxspeed)
//		}
		
//	 timeToTarget = distancediff/potionSpeedx;	
//}

if(targetHex!=noone){
	if(targetHex.x>(x-obj_hex.sprite_width/2) && targetHex.x<(x+obj_hex.sprite_width/2)){
		circV = y - targetHex.y;
		
		if(path_exists(mypath)){
			path_delete(mypath);	
		}
		mypath = path_add();
		var numpoints = 20;
		var spread = circV/numpoints
		show_debug_message("Here I am");
		var pspeed = 150;
		for(var i=0; i <=numpoints;i++){
			if(i<numpoints/2){
				pspeed-=10
			}
			else{
				pspeed+=20
			}
		show_debug_message("Point "+string(i) +" x: " + string(x)+" y: " + string(y-i*spread))
		path_add_point(mypath, x, y-i*spread, pspeed);
		
		}
		path_set_closed(mypath,false)
		pathdrawx = x;
		pathdrawy = y;
	}
	
	else if(targetHex.y<y){
		circQ =  targetHex.x -x; 
		circV = y - targetHex.y;
		var drtx = sqrt(circQ*circQ + circV*circV)
		var bigR = drtx
								
		var Acoff = calcA(circQ, circV);
		var Bcoff = calcB2(circQ,circV,bigR);		
		var Ccoff = calcC2(circQ, circV,bigR);					

		var x1 = Quadratic(Acoff, Bcoff, Ccoff, true)
		var x2 = Quadratic(Acoff, Bcoff, Ccoff, false)//focusH = Quadractic(Acoff, Bcoff, Ccoff, true);
		
		var y1 = calcFocusY(bigR, x1);
		var y2 = calcFocusY(bigR, x2);    

		var constD = sqrt(power((x2-x1),2)+power((y2-y1),2))

		var newRadius = sqrt(bigR*bigR -(constD/2)*(constD/2))

		var Bcoff2 = calcB2(circQ,circV,newRadius);
		var	Ccoff2 = calcC2(circQ, circV, newRadius);

		if(targetHex.x > x){
			focusX = Quadratic(Acoff, Bcoff2, Ccoff2, true);
		}else{
			focusX = Quadratic(Acoff, Bcoff2, Ccoff2, false);
		}
		focusY = calcFocusY(newRadius, focusX);
    
		constK = (focusY + newRadius)/2
		constP = focusY - constK

		if(path_exists(mypath)){
			path_delete(mypath);	
		}
		mypath = path_add();
		var numpoints = 20;
		var spread = circQ/numpoints
		//show_debug_message("Here are my points in order:");
		for(var i=0; i <=numpoints;i++){
		//show_debug_message("Point "+string(i) +" x: " + string(x+i*spread)+" y: " + string(y-ParabolaY(focusX,i*spread,constP,constK)))
		path_add_point(mypath, x+i*spread, y-ParabolaY(focusX,i*spread,constP,constK), 100);
		
		}
		path_set_closed(mypath,false)
		pathdrawx = x;
		pathdrawy = y;
	
		}
		
	else if(targetHex.y>y){
		var tempTargetx = x
		var tempTargety = y
		var tempX = targetHex.x
		var tempY = targetHex.y
		
		circQ =  tempTargetx -tempX; 
		circV = tempY - tempTargety;
		var drtx = sqrt(circQ*circQ + circV*circV)
		var bigR = drtx
								
		var Acoff = calcA(circQ, circV);
		var Bcoff = calcB2(circQ,circV,bigR);		
		var Ccoff = calcC2(circQ, circV,bigR);					

		var x1 = Quadratic(Acoff, Bcoff, Ccoff, true)
		var x2 = Quadratic(Acoff, Bcoff, Ccoff, false)//focusH = Quadractic(Acoff, Bcoff, Ccoff, true);
		
		var y1 = calcFocusY(bigR, x1);
		var y2 = calcFocusY(bigR, x2);    

		var constD = sqrt(power((x2-x1),2)+power((y2-y1),2))

		var newRadius = sqrt(bigR*bigR -(constD/2)*(constD/2))

		var Bcoff2 = calcB2(circQ,circV,newRadius);
		var	Ccoff2 = calcC2(circQ, circV, newRadius);

		if(tempTargetx > tempX){
			focusX = Quadratic(Acoff, Bcoff2, Ccoff2, true);
		}else{
			focusX = Quadratic(Acoff, Bcoff2, Ccoff2, false);
		}
		focusY = calcFocusY(newRadius, focusX);

		constK = (focusY + newRadius)/2
		constP = focusY - constK

		if(path_exists(mypath)){
			path_delete(mypath);	
		}
		mypath = path_add();
		var numpoints = 20;
		var spread = circQ/numpoints
		//show_debug_message("Here are my points in order:");
		var z=0
		for(var i=numpoints; i >=0;i--){
			//show_debug_message("Point "+string(z) +" x: " + string(tempX+i*spread)+" y: " + string(tempY-ParabolaY(focusX,i*spread,constP,constK)))
		path_add_point(mypath, tempX+i*spread, tempY-ParabolaY(focusX,i*spread,constP,constK), 100);
		z++
		}
		path_set_closed(mypath,false)
		pathdrawx = x;
		pathdrawy = y;
		}
	
	else{
		circQ =  targetHex.x -x; 
		circV = y - targetHex.y;
		
		var bigR = circQ
		focusX = bigR/2
		focusY = sqrt((3*bigR*bigR)/4)/1.1  //1.5
		if(targetHex.x<x){
			focusY = -focusY
		}
		constK = (focusY + bigR)/2
		constP = focusY - constK
		if(targetHex.x<x){		
			constK = -constK
			constP = -constP
		}		
		if(path_exists(mypath)){
			path_delete(mypath);	
		}
		mypath = path_add();
		var numpoints = 20;
		var spread = circQ/numpoints
		for(var i=0; i <=numpoints;i++){
		path_add_point(mypath, x+i*spread, y-ParabolaY(focusX,i*spread,constP,constK), 100);
		}
		path_set_closed(mypath,false)
		pathdrawx = x;
		pathdrawy = y;
	}
}
	
	
	
//show_debug_message("------")
//show_debug_message("q="+string(circQ))
//show_debug_message("v="+string(circV))
//show_debug_message("drtx="+string(drtx))
//show_debug_message("littleR=" +string(littleR))
//show_debug_message("bigR="+string(bigR))
//show_debug_message("A="+string(Acoff))
//show_debug_message("B1="+string(Bcoff))
//show_debug_message("C1="+string(Ccoff))
//show_debug_message("X1="+string(x1))
//show_debug_message("Y1="+string(y1))
//show_debug_message("X2="+string(x2))
//show_debug_message("Y2="+string(y2))
//show_debug_message("d="+string(constD))
//show_debug_message("newradius= "+string(newRadius))
//show_debug_message("H="+string(focusX))
//show_debug_message("focusY="+string(focusY))
//show_debug_message("k="+string(constK))
//show_debug_message("P="+string(constP))
//show_debug_message("------")
	
//else if(targetHex.y>y){
	//	var drtx = (abs(circQ)/2)
	//	var bigR = drtx
								
	//	var Acoff = calcA(circQ, circV);
	//	var Bcoff = calcB3(circQ,circV,bigR);		
	//	var Ccoff = calcC3(circQ,circV,bigR);
	//	if(targetHex.x > x){
	//	focusX = Quadratic(Acoff, Bcoff, Ccoff, false);
	//	}else{
	//		focusX = Quadratic(Acoff, Bcoff, Ccoff, true);
	//	}
	//	focusY = calcFocusY(bigR, focusX);

	//	constK = (focusY + bigR)/2
	//	constP = focusY - constK
		
	//	//show_debug_message("------")
	//	//show_debug_message("q="+string(circQ))
	//	//show_debug_message("v="+string(circV))
	//	//show_debug_message("drtx="+string(drtx))
	//	//show_debug_message("A="+string(Acoff))
	//	//show_debug_message("B="+string(Bcoff))
	//	//show_debug_message("C="+string(Ccoff))
	//	//show_debug_message("H="+string(focusX))
	//	//show_debug_message("focusY="+string(focusY))
	//	//show_debug_message("k="+string(constK))
	//	//show_debug_message("P="+string(constP))
	//}