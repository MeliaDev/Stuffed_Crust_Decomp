if (room == rm_editor)
{
}
if (object_index != obj_pizzaboy)
{
    if (irandom(10) >= 7)
        create_baddiegibsticks(x, y)
}
if instance_exists(obj_policebooth)
{
    with (obj_policebooth)
    {
        activate = 1
        activetimer = 200
    }
}
if (ds_list_find_index(global.baddieroom, id) == -1 && ((!elite) || (elite && elitehit <= 0)) && destroyable)
{
    if (object_index != obj_peppinoclone && object_index != obj_cheeseslime && object_index != obj_ghoul && object_index != obj_bazookabaddie && object_index != obj_snowman)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.spr_dead
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
            usepalette = other.usepalette
            image_alpha = other.image_alpha
            if (other.object_index == obj_ghostknight)
                image_alpha = 0.3
        }
    }
    else if (object_index == obj_cheeseslime)
    {
        if (obj_player1.movespeed > 12 || snotty)
        {
            with (instance_create(x, y, obj_explosioneffect))
            {
                image_speed = 0.25
                depth = other.depth
                sprite_index = spr_slimedead_ext
                spr_palette = other.spr_palette
                paletteselect = other.paletteselect
                usepalette = other.usepalette
                image_alpha = other.image_alpha
                image_xscale = (-other.image_xscale)
            }
        }
        else
        {
            with (instance_create(x, y, obj_sausageman_dead))
            {
                sprite_index = other.spr_dead
                spr_palette = other.spr_palette
                paletteselect = other.paletteselect
                usepalette = other.usepalette
                image_alpha = other.image_alpha
            }
        }
        if snotty
        {
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Game", "snotty", 1)
            obj_savesystem.ini_str = ini_close()
            gamesave_async_save()
        }
    }
    else if (object_index == obj_peppinoclone)
    {
        with (instance_create(x, y, obj_explosioneffect))
        {
            image_speed = 0.35
            depth = other.depth
            sprite_index = spr_pepclone_death
            image_xscale = other.image_xscale
        }
    }
    else if (object_index == obj_ghoul)
    {
        var i = 0
        repeat sprite_get_number(spr_ghoul_gibs)
        {
            with (create_debris(x, y, 3284))
            {
                image_index = i
                vsp = (-(irandom_range(10, 14)))
            }
            i++
        }
    }
    if (object_index == obj_sausageman && whoopass == 1)
    {
        with (instance_create(x, y, obj_whoop))
        {
            create_particle(x, y, (9 << 0))
            vsp = -11
        }
    }
    if (object_index == obj_tank)
    {
        repeat (3)
        {
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = other.spr_content_dead
        }
    }
    if (object_index == obj_bazookabaddie)
    {
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_tank_dead
        repeat (4)
        {
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_tank_wheel
        }
    }
    notification_push((2 << 0), [room, id, object_index])
}
if (ds_list_find_index(global.baddieroom, id) == -1 || madepersistent)
{
    if (important == 0)
    {
        if (global.prank_cankillenemy && (!global.prank_enemykilled))
        {
            global.prank_enemykilled = 1
            trace("P Rank started!")
        }
        if (!instance_exists(obj_bosscontroller))
        {
            if (elitehit <= 0)
            {
                with (obj_player1)
                    supercharge += 1
            }
            if (elitehit <= 0)
            {
                global.combo += 1
                global.style += (5 + (global.combo / 10))
                global.enemykilled += 1
                global.combotime = 60
            }
            if instance_exists(obj_hardmode)
                global.heatmeter_count++
            if (global.shootkeyattack == 4)
            {
                if (global.fuel < 5)
                {
                    if (irandom(100) == 7 || irandom(100) == 70 || irandom(100) == 77)
                    {
                        with (instance_create((x + 32), (y + 32), obj_ammocollect))
                            sprite_index = spr_fuelHUD
                    }
                }
            }
            if (elitehit <= 0)
            {
                var combototal = (10 + floor((global.combo * 0.5)))
                if elite
                    global.collect += (combototal * 2)
                else
                    global.collect += combototal
                global.comboscore += combototal
            }
        }
        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
        repeat (3)
        {
            with (create_debris(x, y, 1531))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
        instance_create(x, y, obj_bangeffect)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        if (object_index == obj_miniufo)
            instance_create(x, y, obj_playerexplosion)
        ds_list_add(global.baddieroom, id)
        if escape
            ds_list_add(global.escaperoom, id)
    }
    else
    {
        trace("destroy unimportant")
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        ds_list_add(global.baddieroom, id)
    }
}
