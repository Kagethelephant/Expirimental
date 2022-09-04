
function scr_ds(grd,size,high,roughness,chng){
//(var to store grid, exponent of map size, height range, roughness, roughness change factor)
if ds_exists(grd,ds_type_grid)  ds_grid_destroy(grd);

var i,z;
var chunk = (size-1); //size of the piece you are working with (-1 so it can be halfed)
var half = chunk/2; // this helps get the center value

grd = ds_grid_create(size,size); //initialize grid
ds_grid_clear(grd,0);

//set the corners to a random height
grd[# 0,0] = random_range(0,high);
grd[# size-1,0] = random_range(0,high);
grd[# 0,size-1] = random_range(0,high);
grd[# size-1,size-1] = random_range(0,high);

while (chunk > 1)
	{
		//square
		for(z=0;z<size-1;z+=chunk)
			{
				for(i=0;i<size-1;i+=chunk)
					{
					var x1y1 = grd[# i,z];
					var x2y1 = grd[# i+chunk,z];
					var x1y2 = grd[# i,z+chunk];
					var x2y2 = grd[# i+chunk,z+chunk];
					
					var avg = (x1y1+x2y1+x1y2+x2y2)/4;
					
					ds_grid_set(grd,i+half,z+half,avg+random_range(-roughness,roughness));
					}
			}
		//diamond
		for(z=0;z<size;z+=half)
			{
				for(i=(z+half)mod chunk;i<size;i+=chunk)
					{
					var x1y = 0;
					var x2y = 0;
					var xy1 = 0;
					var xy2 = 0;
					var tot = 4;
					
					if(i-half>=0)x1y = grd[# i-half,z];
					else tot -=1;
					if(i+half<size)x2y = grd[# i+half,z];
					else tot -=1;
					if(z+half<size)xy1 = grd[# i,z+half];
					else tot -=1;
					if(z-half>=0)xy2 = grd[# i,z-half];
					else tot -=1;
					
					var avg = (x1y+x2y+xy1+xy2)/tot;
					
					grd[# i,z] = avg+random_range(-roughness,roughness);
					}
			}
		chunk /= 2;
		half /= 2;
		roughness /= chng;
	}

}