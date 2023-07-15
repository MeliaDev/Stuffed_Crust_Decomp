var _transfo = 0
var _state = other.state
with (other)
{
    if (((!scr_transformationcheck()) && state != (95 << 0) && state != (112 << 0)) || skateboarding)
    {
        if (state == (16 << 0))
            notification_push((41 << 0), [ghosttimer, room])
        if (state == (11 << 0) || state == (12 << 0) || state == (14 << 0) || state == (13 << 0) || state == (12 << 0) || state == (33 << 0) || state == (35 << 0) || state == (34 << 0) || state == (16 << 0) || state == (116 << 0) || state == (113 << 0) || state == (114 << 0))
        {
            if (hsp != 0)
                xscale = sign(hsp)
            movespeed = abs(hsp)
        }
        transformationsnd = 0
        skateboarding = 0
        state = (0 << 0)
        sprite_index = spr_idle
        dir = xscale
        ghostdash = 0
        ghostpepper = 0
        _transfo = 1
        instance_create(x, y, obj_genericpoofeffect)
    }
}
if _transfo
{
    fmod_event_one_shot("event:/sfx/pep/pray")
    var p = other.id
    with (instance_create((other.x - 540), (camera_get_view_y(view_camera[0]) - 100), obj_priestangel))
    {
        priestID = other.id
        playerid = p
    }
    with (other)
    {
        if (state == (11 << 0) || state == (14 << 0) || state == (12 << 0) || state == (13 << 0))
            create_debris(x, (y - 40), 2244)
    }
    if (sprite_index != spr_angelpriest && sprite_index != spr_angelpriest2)
        sprite_index = spr_priest_pray
    if (collect && ds_list_find_index(global.saveroom, id) == -1)
    {
        notification_push((25 << 0), [room, id, _state])
        ds_list_add(global.saveroom, id)
        var val = 500
        global.collect += val
        global.combotime = 60
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        scr_sound_multiple("event:/sfx/misc/collect", x, y)
        if escape
            ds_list_add(global.escaperoom, id)
        var d = round((val / 16))
        for (var i = 0; i < val; i += d)
        {
            if obj_player1.isgustavo
                create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), choose(2092, 3232, 2567, 3854, 3887, 2094), d)
            else if (obj_player1.character == "S")
                create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), 62, d)
            else if (obj_player1.character == "N" || (obj_player1.character == "P" && (!obj_player1.ispeppino)))
                create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), choose(2750, 2752, 2756, 2757, 2758, 2864, 2866, 2868, 2870, 2872), d)
            else
                create_collect((other.x + irandom_range(-60, 60)), (other.y + irandom_range(-60, 60)), choose(2089, 2091, 2092, 2094, 2090), d)
        }
    }
}
