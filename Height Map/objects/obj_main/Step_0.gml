if(keyboard_check_pressed(vk_escape)) game_end();

if(keyboard_check(vk_enter))
	{
	if(ds_exists(ds_type_grid,moist_map))ds_grid_destroy(moist_map);
	height_map = ds_grid_create(1,1);
	scr_ds(height_map,grid_size,h_rng,h_ruf,h_chg);//diamond square algorithm for height map
	moist_map = ds_grid_create(grid_size,grid_size);
	ds_grid_clear(moist_map,0);
	//scr_ds(moist_map,pwr,m_rng,m_ruf,m_chg);//diamond square algorithm for dynamic moisture
	
	init = true;
	}
if init timer = 0;

//simulate rain fall

if (timer < 20)
	{
	init = true
	var i,z,n,v;
	
	var flow_rate = 100;
	var rat = 0;
	var erode = .1;
	var rain = 1.5;
	var soak = 1;
	
	var hxy = 0;
	var mxy = 0;
	for(i=0;i<grid_size;i+=1)
		{
		for(z=0;z<grid_size;z+=1)
			{
			
			var h = 0;
			var m = 0;
			h = height_map[# i,z];
			m = moist_map[# i,z];
			
						
			moist_map[# i,z] += rain*(random_range(0,1));
			if(h>0)moist_map[# i,z] -= soak*(random_range(0,1));

			for (n=-1;n<=1;n+=1)
				{
				for (v=-1;v<=1;v+=1)
					{
					if(i+n>=0 && z+v>=0 && i+n<grid_size && z+v<grid_size)//top left
						{
						if(n=0 && v=0) v=1;
						hxy = height_map[# i+n,z+v];
						mxy = moist_map[# i+n,z+v];
						
						if(hxy<h)
							{
							var vol = 0;
							if(mxy>0)vol = (power(h-hxy,-(h-hxy)));
							if (vol>0)
							{
							moist_map[# i+n,z+v] += flow_rate*vol;
							moist_map[# i,z] -= flow_rate*vol;
							height_map[# i+n,z+v] -= (erode*vol);
							}
							}
						}
					}
				}
			}
		}
	}

timer+=1;

