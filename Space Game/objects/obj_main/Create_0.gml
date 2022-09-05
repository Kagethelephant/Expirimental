
init = true;
timer_global = 0;

scr_view();

x = w_view/2;
y = h_view/2;

global.player_x = x;
global.player_y = y;
player_rot = 90;

x_view = x;
y_view = y;
view_accel = .03;

rot_spd = 0;
player_spd = 0;
player_vspd = 0;
player_hspd = 0;

rot_accel = 0;
v_accel = 0;

rot_accel_c = .03;
v_accel_c = .05;

rot_spd_max = 2;
v_spd_max = 12;

instance_create_layer(x,y,"bullets", obj_npc);

surf_gui = surface_create(w_view,h_view);

grid_jet_right = ds_grid_create(20,4);
grid_jet_right = ds_grid_create(20,4);
grid_jet_right = ds_grid_create(20,4);
grid_jet_right = ds_grid_create(20,4);