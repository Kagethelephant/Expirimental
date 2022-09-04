if(keyboard_check_pressed(vk_escape)) game_end();

if(keyboard_check(vk_enter))
	{
	height_map = ds_grid_create(1,1);
	scr_ds(height_map,grid_size,h_rng,h_ruf,h_chg);//diamond square algorithm for height map
	
	init = true;
	}
if init timer = 0;

timer+=1;

