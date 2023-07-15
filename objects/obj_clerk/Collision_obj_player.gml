if ((other.instakillmove == 1 || other.state == (42 << 0) || other.state == (104 << 0)) && (!death))
{
    death = 1
    var t = other.id
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    notification_push((2 << 0), [room, id, object_index])
    ds_list_add(global.baddieroom, id)
    global.combotime = 60
    global.combo++
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_genericpoofeffect)
    with (instance_create(x, y, obj_sausageman_dead))
    {
        image_xscale = (-t.xscale)
        sprite_index = spr_clerkdead
        hsp = (t.xscale * 10)
    }
    instance_destroy()
}
