hsp = 0
vsp = 0
var x1 = (other.x + (other.sprite_width / 2))
var y1 = ((other.y + other.sprite_height) - 34)
x = Approach(x, x1, spd)
y = Approach(y, y1, spd)
if (x == x1 && y == y1 && state != (89 << 0))
{
    if (other.horseyfinish == 0)
        fmod_event_one_shot_3d("event:/sfx/misc/loserace", x, y)
    spd = 0
    other.horseyfinish = 1
    if (state != (6 << 0))
        ds_list_add(global.baddieroom, id)
    state = (6 << 0)
    global.horse = 0
}
