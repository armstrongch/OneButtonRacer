//populate_digits_array(time)

var input_time = argument0;
var signed = argument1;

var decimal_index = 10;
var colon_index = 11;
var plus_index = 12;
var minus_index = 13;
var empty_index = 14;

var max_time = 9*60*30 + 59*30 + 99/100*30;
var time_elapsed = min(abs(input_time), max_time);

var minutes_elapsed = floor(time_elapsed/30/60);
var seconds_elapsed = floor(time_elapsed/30) - minutes_elapsed*60;
var tenths_elapsed = floor(time_elapsed/30*10) - minutes_elapsed*60*10 - seconds_elapsed*10;
var hundredths_elapsed = floor(time_elapsed/30*100) - minutes_elapsed*60*100 - seconds_elapsed*100 - tenths_elapsed*10;

if (!signed)
{
    digits[0] = minutes_elapsed;
    digits[1] = colon_index;
    digits[2] = floor(seconds_elapsed/10);
    digits[3] = seconds_elapsed % 10;
    digits[4] = decimal_index;
    digits[5] = tenths_elapsed;
    digits[6] = hundredths_elapsed; 
}
else
{
    if (input_time >= 0)
    {
        digits[0] = plus_index;
    }
    else
    {
        digits[0] = minus_index;
    }
    if (minutes_elapsed > 0)
    {
        digits[1] = minutes_elapsed;
        digits[2] = colon_index;
        digits[3] = floor(seconds_elapsed/10);
        digits[4] = seconds_elapsed % 10;
        digits[5] = decimal_index;
        digits[6] = tenths_elapsed;
    }
    else
    {
        digits[1] = empty_index;
        digits[2] = floor(seconds_elapsed/10);
        digits[3] = seconds_elapsed % 10;
        digits[4] = decimal_index;
        digits[5] = tenths_elapsed;
        digits[6] = hundredths_elapsed; 
    }
}


