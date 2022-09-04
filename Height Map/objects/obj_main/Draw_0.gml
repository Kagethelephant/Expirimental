
if init //draw to surface only once for each change
	{
	surface_set_target(surf); //draw to surface, then draw surface to screen instead of executing this large script every step
	draw_set_color(c_black);
	draw_rectangle(0,0,wdis,wdis,false);
	var sz = grid_size; //size of grid (variable pwr set on create to make the grid initially, this function is used to size grid in scr_ds)
	var in = 0;//grid pisition in pixels
	var zn = 0;//grid pisition in pixels
	var bx = 4;//size (w/h) of grid square in pixels
	var xoff = 0;//draw offset x
	var yoff = 0;//draw offset y

	var i,z;
	for(i=0;i<sz;i+=1)
		{
		in = i*bx; //multiply the step by the size of the box in pixels for drawing
	
		for(z=0;z<sz;z+=1)
			{
			zn = z*bx; //multiply the step by the size of the box in pixels for drawing
			
			var h = height_map[# i,z];
			//find the height of the square to draw it the right color
			if(h>30) draw_set_color(c_white);
			else if(h>22) draw_set_color(c_gray);
			else if(h>18) draw_set_color(c_dkgray);
			else if(h>8) draw_set_color(c_green);	
			else if(h>0) draw_set_color(c_orange);
			else if(h>-2) draw_set_color(c_teal);
			else if(h>-12) draw_set_color(c_blue);
			else draw_set_color(c_navy);
			//draw the grid
			draw_rectangle(xoff+in,yoff+zn,xoff+in+bx,yoff+zn+bx,false);
			}
		}

	surface_reset_target();// must do this whenever drawing to a surface
	init = false; //makes sure this value is reset so we only draw this once (CPU intensive)
	}
draw_surface(surf,0,0);// display what we drew in the for loops

//troubleshooting
draw_set_color(c_black);
draw_text(40,40,fps);
draw_text(40,60,timer div 60);
draw_text(40,80,query);