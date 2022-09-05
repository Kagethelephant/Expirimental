
var spr_h = sprite_get_height(spr_space);
var spr_w = sprite_get_width(spr_space);

var  x_block = floor(x/spr_w);
var  y_block = floor(y/spr_h);

var i,z;
for(i=-2*spr_h;i<=3*spr_h;i+=spr_h)
	{
		for(z=-2*spr_w;z<=3*spr_w;z+=spr_w)
		{
		draw_sprite(spr_space,0,(x_block*spr_w)+z,(y_block*spr_h)+i);	
		}
	}

draw_set_color(c_aqua);
draw_sprite_ext(spr_player,0,x,y,1,1,player_rot,c_white,1);

//draw_circle(mouse_x,mouse_y,6,0);
surface_set_target(surf_gui);
draw_clear_alpha(c_white,0);
draw_set_color(c_white);
draw_text(5,20*1,"Game Time: " + string(timer_global));

surface_reset_target();
draw_surface(surf_gui,x_view-w_view/2,y_view-h_view/2);

//jets



