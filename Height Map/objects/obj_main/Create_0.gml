//global variables
randomize();
init = true;
timer = 0;
query = 0;

//create view
view_set_hport(0, display_get_height()); //size of port to screen (make it the size of the screen)
view_set_wport(0, display_get_width());

scale =  1;
hdis = display_get_height()*scale; //size of view in room (we can scale this down to make it more pixelated
wdis = display_get_width()*scale;

surf = surface_create(wdis,hdis);//surface to draw everything to (look at draw event)

view_visible[0] = 1; //eneable the default view
view_camera[0] = camera_create_view(0,0,wdis,hdis,0,-1,-1,-1,0,0); //create camera, we need this to view what we are drawing but the arguments are generic
view_set_camera(0,0); //use the camera and view we just set up

//create the grids
grid_size = power(2,8)+1;// used to for the size of the grids (2^pwr)

h_chg = 1.5; //amount the change decreases on every iteration of the diamond square algorithm
h_rng = 20;//the range for random values in the diamond square algorithm
h_ruf = 30;

m_chg = 1.3; 
m_rng = 15;
m_ruf = 30;

height_map = ds_grid_create(1,1);
scr_ds(height_map,grid_size,h_rng,h_ruf,h_chg);//diamond square algorithm for height map
moist_map = ds_grid_create(grid_size,grid_size);
ds_grid_clear(moist_map,0);
//scr_ds(moist_map,pwr,m_rng,m_ruf,m_chg);//diamond square algorithm for dynamic moisture




