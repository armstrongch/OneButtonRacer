direction = predict_next_dir(x, y, direction, next_checkpoint);
speed = charge;
charge = 0;
cpu_hit_checkpoint_flag = false;
image_angle = direction;
