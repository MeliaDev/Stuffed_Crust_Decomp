with (instance_place((x + spd), y, obj_shotgunblock))
    instance_destroy()
with (instance_place(x, (y - spdh), obj_shotgunblock))
    instance_destroy()
with (instance_place((x + spd), y, obj_destructibles))
    instance_destroy()
var _x = x
x += (image_xscale * spd)
y += (-spdh)
if instance_exists(obj_bossplayerdeath)
    instance_destroy()
if (sprite_index == spr_peppinobulletGIANT)
    var dmg = 6
else
    dmg = 1
for (var i = 0; i < array_length(collision_list); i++)
{
    var b = collision_list[i]
    var _inst = collision_line(x, y, _x, y, b, false, true)
    if (_inst == noone)
        _inst = instance_place(x, y, b)
    with (_inst)
    {
        switch object_index
        {
            case obj_vigilanteboss:
                if (state != (137 << 0) && (state != (104 << 0) || kick) && flickertime <= 0 && vsp > 0 && (!reposition))
                {
                    flash = 1
                    alarm[2] = 3
                    if (other.sprite_index == spr_peppinobulletGIANT)
                    {
                        with (obj_camera)
                        {
                            shake_mag = 4
                            shake_mag_acc = (4 / room_speed)
                        }
                    }
                    repeat (3)
                        create_debris(other.x, other.y, 1523)
                    instance_create(other.x, other.y, obj_bangeffect)
                    if (bullethit < 8)
                        bullethit += dmg
                    if (bullethit >= 8)
                    {
                        repeat (8)
                            create_debris(other.x, other.y, 1523)
                        instance_create(other.x, other.y, obj_parryeffect)
                        scr_sleep(30)
                        state = (137 << 0)
                        linethrown = 1
                        hitX = x
                        hitY = y
                        hitLag = 10
                        thrown = 1
                        mach2 = 0
                        hithsp = (other.image_xscale * 20)
                        hitvsp = -7
                        image_xscale = (-other.image_xscale)
                        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
                        if (elitehit <= 1 && phase == 1)
                        {
                            fmod_event_one_shot("event:/sfx/misc/blackoutpunch")
                            instance_create_unique(0, 0, 121)
                            instance_create_unique(0, 0, 342)
                            state = (273 << 0)
                            sprite_index = spr_playerV_hurt
                            hsp = 0
                            vsp = 0
                            buildup = 100
                            with (obj_player)
                            {
                                hurted = 0
                                image_alpha = 1
                                alarm[5] = -1
                                alarm[6] = -1
                                alarm[8] = -1
                                event_perform(ev_alarm, 7)
                            }
                        }
                    }
                    instance_destroy(other)
                }
                break
            case 138:
                if (state != (137 << 0) && flickertime <= 0 && grounded && vsp > 0)
                {
                    flash = 1
                    alarm[2] = 3
                    if (other.sprite_index == spr_peppinobulletGIANT)
                    {
                        with (obj_camera)
                        {
                            shake_mag = 4
                            shake_mag_acc = (4 / room_speed)
                        }
                    }
                    repeat (3)
                        create_debris(other.x, other.y, 1523)
                    instance_create(other.x, other.y, obj_bangeffect)
                    if (bullethit < 22)
                        bullethit += dmg
                    if (bullethit >= 22)
                    {
                        repeat (8)
                            create_debris(other.x, other.y, 1523)
                        instance_create(other.x, other.y, obj_parryeffect)
                        scr_sleep(30)
                        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
                        if (elitehit <= 1)
                        {
                            fmod_event_one_shot("event:/sfx/misc/blackoutpunch")
                            instance_create_unique(0, 0, 342)
                            instance_create_unique(0, 0, 121)
                            state = (273 << 0)
                            sprite_index = spr_pizzahead_hurt
                            hsp = 0
                            vsp = 0
                            buildup = 100
                            hitX = x
                            hitY = y
                            with (obj_player)
                            {
                                hurted = 0
                                image_alpha = 1
                                alarm[5] = -1
                                alarm[6] = -1
                                alarm[8] = -1
                                event_perform(ev_alarm, 7)
                            }
                        }
                        else
                            elitehit--
                    }
                    instance_destroy(other)
                }
                break
            case 210:
            case 64:
            case 188:
                flash = 1
                flashbuffer = 8
                if (sprite_index == spr_peppinobulletGIANT)
                {
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = (3 / room_speed)
                    }
                }
                instance_create(other.x, other.y, obj_bangeffect)
                if (bullethit > 0)
                    bullethit -= dmg
                if (bullethit <= 0)
                {
                    instance_create(other.x, other.y, obj_parryeffect)
                    scr_sleep(30)
                    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
                    instance_destroy()
                }
                instance_destroy(other)
                break
            case 335:
                repeat (3)
                    create_debris(other.x, other.y, 1523)
                instance_create(other.x, other.y, obj_bangeffect)
                instance_create(other.x, other.y, obj_parryeffect)
                instance_destroy()
                break
        }

    }
}
if (sprite_index == spr_peppinobulletGIANT)
    mask_index = sprite_index
