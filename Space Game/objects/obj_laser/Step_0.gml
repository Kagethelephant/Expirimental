
x += lengthdir_x(v,dir);
y += lengthdir_y(v,dir);

if(point_distance(x,y,global.player_x,global.player_y)>2000) instance_destroy();
