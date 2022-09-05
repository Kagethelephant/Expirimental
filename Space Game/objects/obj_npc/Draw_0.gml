draw_set_color(c_white);
draw_sprite_ext(spr_player,0,x,y,1,1,dir,c_white,1);

draw_text(5,20*2,"Direction: "+ string(dir));
draw_text(5,20*3,"Time to Stop: "+ string(t_to0));
draw_text(5,20*4,"Time to Deg: "+ string(int));
draw_text(5,20*5,"Rotation Speed: "+ string(dir_spd));

if(burn)
	{
	surface_set_target(surf_graph);
	draw_set_color(c_yellow);
	draw_point(2*timer,150-dir);
	draw_set_color(c_red);
	draw_point(2*timer,150-10*dir_spd);
	surface_reset_target();
	}
draw_surface(surf_graph,0,600);

