var x_pos = argument0;
var y_pos = argument1;
var track_dir = argument2;
var track_dir_rad = degtorad(track_dir);


//Find the next block we will collide with
var track_end = get_next_wall_in_direction(x_pos, y_pos, track_dir);

//Take a step back
var x_end = track_end.x + 8 + 16*cos(track_dir_rad + pi);
var y_end = track_end.y + 8 - 16*sin(track_dir_rad + pi);

show_debug_message("step back from anchor wall: " + string(x_end) + ", " + string(y_end));

//Find the left and right sides of the track at that collision point
var left_anchor = get_next_wall_in_direction(x_end, y_end, track_dir + 90);
var right_anchor = get_next_wall_in_direction(x_end, y_end, track_dir - 90);

//Draw a line across the track
var x1 = left_anchor.x + 8 + cos(track_dir_rad - pi/2)*16;
var y1 = left_anchor.y + 8 - sin(track_dir_rad - pi/2)*16;
var x2 = right_anchor.x + 8 + cos(track_dir_rad + pi/2)*16;
var y2 = right_anchor.y + 8 - sin(track_dir_rad + pi/2)*16;

var x_incr = cos(track_dir_rad + pi);
var y_incr = -1 * sin(track_dir_rad + pi);

//show_debug_message("x1, y1, x2, y2: " + string(x1) + ", " + string(y1) + ", " + string(x2) + ", " + string(y2));

//Move the line backwards until it intersects a wall (this will be the start of the turn)
while(!collision_line(x1, y1, x2, y2, Wall_obj, true, true))
{
    x1 += x_incr;
    x2 += x_incr;
    y1 += y_incr;
    y2 += y_incr;
    //show_debug_message("x1, y1, x2, y2: " + string(x1) + ", " + string(y1) + ", " + string(x2) + ", " + string(y2));
}

//Step forwards again so (x1, y1) and (x2, y2) are not intersecting a wall
//Draw a line back to the previous checkpoint to see whether this is a right turn
var right_turn = collision_line(x2 - x_incr, y2 - y_incr, x_pos, y_pos, Wall_obj, true, true);

var anchor_finder_x = -1;
var anchor_finder_y = -1;

//Re-evaluate the anchors right before the turn
if (right_turn)
{
    anchor_finder_x = x1 + cos(track_dir_rad - 0.5*pi)*16;
    anchor_finder_y = y1 - sin(track_dir_rad - 0.5*pi)*16;
}
else
{
    anchor_finder_x = x2 + cos(track_dir_rad + 0.5*pi)*16;
    anchor_finder_y = y2 - sin(track_dir_rad + 0.5*pi)*16;
}

//show_debug_message("anchor_finder_x,y: " + string(anchor_finder_x) + ", " + string(anchor_finder_y));

right_anchor = get_next_wall_in_direction(anchor_finder_x, anchor_finder_y, track_dir-90);
left_anchor = get_next_wall_in_direction(anchor_finder_x, anchor_finder_y, track_dir+90);
x1 = left_anchor.x + 8 + cos(track_dir_rad)*16;
y1 = left_anchor.y + 8 - sin(track_dir_rad)*16;
x2 = right_anchor.x + 8 + cos(track_dir_rad)*16;
y2 = right_anchor.y + 8 - sin(track_dir_rad)*16;

//show_debug_message("x1, y1, x2, y2: " + string(x1) + ", " + string(y2) + ", " + string(x2) + ", " + string(y2));

var cp_center_x = mean(x1, x2);
var cp_center_y = mean(y1, y2);
var cp_size_x = max(abs(x1-x2), 16);
var cp_size_y = max(abs(y1-y2), 16);

var cp_x = cp_center_x - cp_size_x/2;
var cp_y = cp_center_y - cp_size_y/2;

var checkpoint = instance_create(cp_x, cp_y, Checkpoint_obj);
checkpoint.image_xscale = cp_size_x/16;
checkpoint.image_yscale = cp_size_y/16;

if (right_turn) { checkpoint.direction = track_dir - 90; }
else { checkpoint.direction = track_dir + 90; }

checkpoint.next_wall = track_end;
checkpoint.left_anchor = left_anchor;
checkpoint.right_anchor = right_anchor;

return checkpoint;
