var roomname = string_letters(room_get_name(room))
if (place_meeting(x, y, obj_player) && sprite_index == spr_pizzaboxunopen)
{
    global.combotime = 60
    fmod_event_one_shot("event:/sfx/misc/collecttoppin")
    if (content == obj_noisebomb)
    {
        with (obj_player)
        {
            state = (84 << 0)
            sprite_index = spr_player_bossintro
            image_index = 0
        }
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_noisebomb_intro
        instance_create(x, y, obj_taunteffect)
        instance_create(x, (y + 600), obj_itspizzatime)
        global.panic = 1
        switch room
        {
            case floor2_roomtreasure:
                global.minutes = 2
                global.seconds = 40
                break
            case 330:
                global.minutes = 2
                global.seconds = 30
                break
            case 314:
                global.minutes = 2
                global.seconds = 0
                break
            case 302:
                global.minutes = 2
                global.seconds = 0
                break
        }

        global.wave = 0
        global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
    }
    if (content == obj_pizzakinshroom)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        instance_create(x, y, obj_taunteffect)
        with (instance_create(x, (y - 25), content))
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                sprite_index = spr_noisebomb_intro
            else if (roomname == "strongcold")
                sprite_index = spr_xmasshroomtoppin_intro
            else
                sprite_index = spr_toppinshroom_intro
            showtext = 1
        }
        global.heattime = 60
        global.style += (10 + (global.combo / 10))
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.shroomfollow = 1
    }
    if (content == obj_pizzakincheese)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                sprite_index = spr_noisebomb_intro
            else if (roomname == "strongcold")
                sprite_index = spr_xmascheesetoppin_intro
            else
                sprite_index = spr_toppincheese_intro
            showtext = 1
        }
        instance_create(x, y, obj_taunteffect)
        global.heattime = 60
        global.style += (10 + (global.combo / 10))
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.cheesefollow = 1
    }
    if (content == obj_pizzakintomato)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                sprite_index = spr_noisebomb_intro
            else if (roomname == "strongcold")
                sprite_index = spr_xmastomatotoppin_intro
            else
                sprite_index = spr_toppintomato_intro
            showtext = 1
        }
        instance_create(x, y, obj_taunteffect)
        global.heattime = 60
        global.style += (10 + (global.combo / 10))
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.tomatofollow = 1
    }
    if (content == obj_pizzakinsausage)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                sprite_index = spr_noisebomb_intro
            else if (roomname == "strongcold")
                sprite_index = spr_xmassausagetoppin_intro
            else
                sprite_index = spr_toppinsausage_intro
            showtext = 1
        }
        instance_create(x, y, obj_taunteffect)
        global.heattime = 60
        global.style += (10 + (global.combo / 10))
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.sausagefollow = 1
    }
    if (content == obj_pizzakinpineapple)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                sprite_index = spr_noisebomb_intro
            else if (roomname == "strongcold")
                sprite_index = spr_xmaspineappletoppin_intro
            else
                sprite_index = spr_toppinpineapple_intro
            showtext = 1
        }
        instance_create(x, y, obj_taunteffect)
        global.heattime = 60
        global.style += (10 + (global.combo / 10))
        if (global.toppintotal < 5)
            obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.pineapplefollow = 1
    }
    if (content == obj_noisey)
    {
        fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
        with (instance_create(x, (y - 25), content))
        {
            image_xscale = other.image_xscale
            state = (138 << 0)
            stunned = 20
            vsp = -5
        }
    }
    instance_destroy()
}
subimg += 0.35
if (subimg > (sprite_get_number(spr_toppinhelp) - 1))
{
    subimg = frac(subimg)
    scr_fmod_soundeffect(snd, x, y)
}
