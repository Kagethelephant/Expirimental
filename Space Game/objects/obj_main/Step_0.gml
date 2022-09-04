if(keyboard_check(vk_escape)) game_end();

timer_global += 1;

camera_set_view_pos(view_camera[0],x_view-w_view/2,y_view-h_view/2);

v_accel = v_accel_c*(keyboard_check(vk_up)-keyboard_check(vk_down));
rot_accel = rot_accel_c*(keyboard_check(vk_left)-keyboard_check(vk_right));

player_spd = sqrt(sqr(player_vspd)+sqr(player_hspd));

if(player_spd < v_spd_max)
	{
	player_vspd += lengthdir_y(v_accel,player_rot);
	player_hspd += lengthdir_x(v_accel,player_rot);	
	}
else 
	{
	if(sign(player_vspd)-sign(lengthdir_y(v_accel,player_rot))!=0)player_vspd += lengthdir_y(v_accel,player_rot);
	if(sign(player_hspd)-sign(lengthdir_x(v_accel,player_rot))!=0)player_hspd += lengthdir_x(v_accel,player_rot);
	}

if(abs(rot_spd+rot_accel)<rot_spd_max) rot_spd += rot_accel;

player_rot += rot_spd;
x += player_hspd;
y += player_vspd;
global.player_x = x;
global.player_y = y;

x_view = x;
y_view = y;

if(keyboard_check_pressed(vk_space))
	{
	var laser = instance_create_layer(x,y,"bullets", obj_laser);
	laser.x = x;
	laser.y = y;
	laser.dir = player_rot;
	laser.v = 10+player_spd;
	}

for(