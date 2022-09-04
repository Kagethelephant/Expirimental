
function scr_view(){

var scale =  .5;
h_view = display_get_height()*scale;
w_view = display_get_width()*scale;

surface_resize(application_surface,w_view,h_view);

//create view
view_set_xport(0,0);
view_set_yport(0,0);
view_set_hport(0, h_view); 
view_set_wport(0, w_view);

view_visible[0] = 1; 
view_enabled[0] = 1;
view_camera[0] = camera_create_view(0,0,w_view,h_view,0,-1,-1,-1,0,0); 
view_set_camera(0,view_camera[0]); 

}