if(target=0)
	{
	target = collision_circle(pos_x,pos_y,400,obj_main,0,1);
	}

if(target)
	{
		if(instance_exists(target))
		{
		instance_destroy();
		}
	}





