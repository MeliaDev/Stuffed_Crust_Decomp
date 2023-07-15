instance_destroy()
with (other)
{
    sprite_index = spr_ballgoal_full
    image_speed = 0.4
}
var gh = golfhit
with (instance_create(0, 0, obj_pizzaball_rank))
{
    fmod_event_instance_play(global.snd_golfjingle)
    var s = 0
    if (global.golfhit <= gh[0])
    {
        s = 3
        collect = 400
        sprite_index = spr_pizzaball_rank1
    }
    else if (global.golfhit <= gh[1])
    {
        s = 2
        collect = 250
        sprite_index = spr_pizzaball_rank2
    }
    else if (global.golfhit <= gh[2])
    {
        s = 1
        collect = 100
        sprite_index = spr_pizzaball_rank3
    }
    else
    {
        collect = 0
        sprite_index = spr_pizzaball_rank4
    }
    fmod_event_instance_set_parameter(global.snd_golfjingle, "state", s, 1)
    collectminus = round((collect / 10))
    notification_push((18 << 0), [sprite_index])
}
global.golfhit = 0
