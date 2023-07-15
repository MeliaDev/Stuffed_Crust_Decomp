var _x = x
var _y = y
var _spr = spr_pizzahead_haywire
if (supertaunted == 0)
{
    _x = (savedx - savedcx)
    _y = (savedy - savedcy)
    _spr = spr_pizzahead_intro1
    while (_x > (obj_screensizer.actual_width - 100))
        _x -= 20
    while (_y > (obj_screensizer.actual_height - 100))
        _y -= 20
    while (_x < 100)
        _x += 20
    while (_y < 100)
        _y += 20
}
with (instance_create(_x, _y, obj_shakeanddie))
    sprite_index = _spr
fmod_event_one_shot_3d("event:/sfx/misc/explosion", _x, _y)
fmod_event_one_shot_3d("event:/sfx/pep/groundpound", _x, _y)
destroy_sounds([snd])
if supertaunted
{
    if (irandom(100) == 7 || (irandom(100) >= 70 && irandom(100) <= 77))
    {
        with (instance_create(_x, _y, obj_shakeanddie))
            sprite_index = spr_pizzahead_phase3flicker
    }
}
with (obj_chunktimer)
{
    pbuff = 1
    alarm[0] = 240
}
