
diff_dir = test_dir-dir;
t_to0 = ((dir_spd)/rot_accel_c);

if (diff_dir >= 0 )int = sqrt(diff_dir*2/rot_accel_c)

if(player_target=0)player_target = collision_circle(x,y,400,obj_main,0,1);

if burn
	{
	dir_spd -= rot_accel_c;
	burn -= 1;
	}
else 
	{
	if(int <= t_to0) burn = t_to0;	
	}

dir += dir_spd;

timer += 1;
