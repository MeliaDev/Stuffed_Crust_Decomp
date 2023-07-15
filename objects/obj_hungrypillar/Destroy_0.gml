if (room == rm_editor)
{
}
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    if (room == tower_finalhallway)
        global.leveltosave = "exit"
    with (obj_baddie)
    {
        if (escape == 1)
        {
            visible = true
            instance_create(x, y, obj_genericpoofeffect)
        }
    }
    fmod_event_instance_play(global.snd_johndead)
    var combototal = (10 + floor((global.combo * 0.5)))
    global.collect += combototal
    global.comboscore += combototal
    global.combo += 1
    global.enemykilled += 1
    global.combotime = 60
    global.fill = 4000
    notification_push((20 << 0), [room])
    switch room
    {
        case entrance_10:
            global.fill = 1860
            break
        case 53:
            global.fill = 2040
            break
        case 69:
            global.fill = 2040
            break
        case 88:
            global.fill = 2460
            break
        case 729:
            global.fill = 2556
            break
        case 131:
            global.fill = 2640
            break
        case 152:
            global.fill = 1920
            break
        case 697:
            global.fill = 2100
            break
        case 715:
            global.fill = 2220
            break
        case 703:
            global.fill = 2520
            break
        case 368:
            global.fill = 2220
            break
        case 237:
            global.fill = 3240
            break
        case 685:
            global.fill = 3356
            break
        case 384:
            global.fill = 2460
            var lay = layer_get_id("Backgrounds_scroll")
            layer_set_visible(lay, 1)
            break
        case 831:
            global.fill = 2760
            break
        case 459:
            global.fill = 2640
            break
        case 257:
            lay = layer_get_id("Backgrounds_stillH1")
            layer_background_sprite(layer_background_get_id(lay), 3198)
            global.fill = 2520
            break
        case 609:
            global.fill = 2460
            break
        case 739:
            global.fill = 4056
            break
        case 411:
            lay = layer_get_id("Backgrounds_H1")
            layer_background_sprite(layer_background_get_id(lay), 2360)
            var lay2 = layer_get_id("Backgrounds_zigzag2")
            layer_background_sprite(layer_background_get_id(lay2), 2369)
            global.fill = 2520
            break
    }

    instance_create_unique(0, 0, 346)
    with (obj_tv)
        chunkmax = global.fill
    global.wave = 0
    global.maxwave = global.fill
    with (obj_escapecollect)
    {
        gotowardsplayer = 0
        movespeed = 5
        image_alpha = 1
    }
    with (obj_escapecollectbig)
        image_alpha = 1
    with (obj_destroyable)
    {
        if (sprite_index == spr_towerblocksmall)
        {
            sprite_index = spr_destroyableescape
            image_speed = 0.35
        }
    }
    with (obj_destroyable2)
    {
        if (sprite_index == spr_halloweensmallblock)
            sprite_index = spr_halloweensmallblockescape
        if (sprite_index == spr_xmasblock)
            sprite_index = spr_xmasblockescape
    }
    with (obj_destroyable2_big)
    {
        if (sprite_index == spr_halloweensmallblock)
            sprite_index = spr_halloweenbigblockescape
        if (sprite_index == spr_xmasbigblock)
            sprite_index = spr_xmasbigblockescape
    }
    with (obj_destroyable3)
    {
        if (sprite_index == spr_towerblock)
        {
            debris = 1676
            sprite_index = spr_johndestructible
            image_speed = 0.35
        }
    }
    with (obj_camera)
    {
        alarm[1] = 60
        idkanymore = 0
        rotates = 0
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    with (obj_player1)
        supercharge += 1
    fmod_event_instance_play(global.snd_escaperumble)
    instance_create(x, y, obj_bangeffect)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    if (global.coop == 1)
    {
        obj_player1.x = x
        obj_player2.x = x
        obj_player1.y = y
        obj_player2.y = y
    }
    instance_destroy()
    if supertaunt
    {
        with (instance_create(x, y, obj_shakeanddie))
        {
            sprite_index = spr_hungrypillar_dead
            if (room == tower_finalhallway)
                sprite_index = spr_protojohn
        }
    }
    else
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = spr_hungrypillar_dead
            if (room == tower_finalhallway)
                sprite_index = spr_protojohn
        }
    }
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    instance_create(x, (y + 600), obj_itspizzatime)
    global.panic = 1
    with (obj_collect)
    {
        if (object_index != obj_escapecollect)
            resetmode = 1
    }
    with (obj_bigcollect)
    {
        if (object_index != obj_escapecollectbig)
            resetmode = 1
    }
    switch room
    {
        case entrance_10:
            global.minutes = 2
            global.seconds = 30
            break
        case 53:
            global.minutes = 2
            global.seconds = 15
            break
        case 69:
            global.minutes = 2
            global.seconds = 59
            break
        case 88:
            global.minutes = 4
            global.seconds = 30
            break
        case 253:
            global.minutes = 3
            global.seconds = 15
            break
        case 259:
            global.minutes = 4
            global.seconds = 0
            break
        case 90:
            global.minutes = 0
            global.seconds = 59
            break
        case 549:
            global.minutes = 2
            global.seconds = 30
            break
        case 131:
            global.minutes = 3
            global.seconds = 59
            break
        case 152:
            global.minutes = 3
            global.seconds = 59
            break
        case 227:
            global.minutes = 3
            global.seconds = 12
            break
        case 193:
            global.minutes = 3
            global.seconds = 30
            break
        case 199:
            global.minutes = 3
            global.seconds = 30
            break
        case 237:
            global.minutes = 7
            global.seconds = 30
            break
        case 368:
            global.minutes = 5
            global.seconds = 30
            break
        case 384:
            global.minutes = 5
            global.seconds = 30
            break
        case 400:
            global.minutes = 5
            global.seconds = 30
            break
        case 411:
            global.minutes = 5
            global.seconds = 30
            break
        case 433:
            global.minutes = 6
            global.seconds = 30
            break
        case 443:
            global.minutes = 5
            global.seconds = 30
            break
        case 526:
            global.minutes = 6
            global.seconds = 30
            break
        case 506:
            global.minutes = 9
            global.seconds = 59
            break
        case 499:
            global.minutes = 3
            global.seconds = 30
            break
        case 360:
            global.minutes = 2
            global.seconds = 15
            break
        default:
            global.minutes = 5
            global.seconds = 30
            break
    }

    ds_list_add(global.saveroom, id)
}
