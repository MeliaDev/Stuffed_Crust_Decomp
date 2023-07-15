function scr_fakepepclone_transitioncutscene() //scr_fakepepclone_transitioncutscene
{
    hsp = 0
    vsp = 0
    if ((floor(image_index) div 5) == 0)
    {
        if (sprite_index != spr_fakepeppino_deformdown)
            create_debris((x + irandom_range(-20, 20)), (y + 43), 3226)
        else
            create_debris((x + irandom_range(-20, 20)), y, 3226)
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_fakepeppino_reform)
        {
            attacked = 0
            state = (134 << 0)
            cooldown = 15
            if (attack.attack == (2 << 0) || attack.attack == (4 << 0) || attack.attack == (5 << 0))
                cooldown = 0
            if (attack.attack == (3 << 0))
            {
                state = (99 << 0)
                hsp = 0
                sprite_index = spr_fakepeppino_superjumpstart
                image_index = 0
                image_speed = 0
            }
            else if (attack.attack == (5 << 0))
            {
                fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
                create_particle(x, y, (4 << 0))
                attacked = 1
                taunted = 0
                state = (84 << 0)
                sprite_index = spr_fakepeppino_jump
                image_index = 0
                hsp = 0
                if (image_xscale > 0)
                    vsp = attack.vsp1
                else
                    vsp = attack.vsp2
            }
        }
        else
            instance_destroy()
    }
}

function scr_fakepepclone_walk() //scr_fakepepclone_walk
{
    image_speed = 0.35
    var ix = sign((targetplayer.x - x))
    hsp = Approach(hsp, (ix * 8), 0.3)
    if (hsp != 0)
    {
        image_xscale = sign(hsp)
        sprite_index = spr_fakepeppino_walk
    }
    else
        sprite_index = spr_fakepeppino_idle
    if (!attacked)
    {
        if (cooldown > 0)
            cooldown--
        else
        {
            switch attack.attack
            {
                case (0 << 0):
                    if (abs((x - targetplayer.x)) <= 150)
                    {
                        fmod_event_instance_play(snd_grab)
                        attacked = 1
                        state = (276 << 0)
                        grabstart = 10
                        if (ix != 0)
                            image_xscale = ix
                        sprite_index = spr_fakepeppino_grabdashstart
                        image_index = 0
                        attackspeed = 12
                    }
                    break
                case (1 << 0):
                    attacked = 1
                    if (x != targetplayer.x)
                        image_xscale = sign((targetplayer.x - x))
                    sprite_index = spr_fakepeppino_bodyslamstart
                    image_index = 0
                    state = (92 << 0)
                    break
                case (2 << 0):
                    attacked = 1
                    image_xscale = (x > (room_width / 2) ? 1 : -1)
                    attackspeed = 4
                    state = (104 << 0)
                    machdir = 0
                    bodyslam = attack.bodyslam
                    if bodyslam
                        machcooldown = 10000
                    else
                        machcooldown = 330
                    cooldown = attack.cooldown
                    break
                case (4 << 0):
                    state = (74 << 0)
                    hsp = 0
                    if (!throwing)
                    {
                        with (instance_create(x, y, obj_fakepepheaddebris))
                            image_speed = 0.35
                        sprite_index = spr_fakepeppino_flailing
                    }
                    else
                        sprite_index = spr_fakepeppino_throwhead
                    image_index = 0
                    break
            }

        }
    }
    else
    {
        fmod_event_one_shot_3d("event:/sfx/fakepep/deform", x, y)
        state = (8 << 0)
        sprite_index = spr_fakepeppino_deform
        image_index = 0
        if (attack.attack == (3 << 0))
            sprite_index = spr_fakepeppino_deformdown
    }
}

function scr_fakepepclone_Sjumpprep() //scr_fakepepclone_Sjumpprep
{
    hsp = 0
    vsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        steppybuffer = 0
        piledrivereffect = 0
        sjumpbuffer = 0
        state = (97 << 0)
        sprite_index = spr_fakepeppino_superjump
        fmod_event_one_shot_3d("event:/sfx/fakepep/superjumpclonerelease", x, y)
    }
}

function scr_fakepepclone_Sjump() //scr_fakepepclone_Sjump
{
    hsp = 0
    vsp = -18
    if (steppybuffer > 0)
        steppybuffer--
    else
    {
        create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
        steppybuffer = 8
    }
    if (sjumpbuffer > 0)
        sjumpbuffer--
    else
    {
        sjumpbuffer = 8
        with (create_red_afterimage(x, y, sprite_index, image_index, image_xscale))
            alpha = 1
    }
    if (piledrivereffect > 0)
        piledrivereffect--
    else
    {
        with (instance_create(x, y, obj_parryeffect))
        {
            sprite_index = spr_piledrivereffect
            image_yscale = -1
        }
        piledrivereffect = 15
    }
    if place_meeting(x, (y - 1), obj_solid)
    {
        state = (134 << 0)
        attacked = 1
        with (instance_create(x, (y + 20), obj_explosioneffect))
        {
            sprite_index = spr_fakepepsplasheffect
            image_speed = 0.35
            image_yscale = -1
            depth = -20
        }
    }
}

function scr_fakepepclone_throwing() //scr_fakepepclone_throwing
{
    if (sprite_index == spr_fakepeppino_throwhead)
    {
        if (x != targetplayer.x)
            image_xscale = sign((targetplayer.x - x))
        if (floor(image_index) == (image_number - 1))
        {
            state = (134 << 0)
            attacked = 1
        }
        if (floor(image_index) >= 32 && (!instance_exists(headID)))
        {
            fmod_event_one_shot_3d("event:/sfx/fakepep/headthrow", x, y)
            with (instance_create(x, (y - 20), obj_fakepephead))
            {
                clone = 1
                other.headID = id
                thrown = 1
                image_xscale = other.image_xscale
                hithsp = (image_xscale * 15)
                destroy = 1
            }
        }
    }
    else if (sprite_index == spr_fakepeppino_flailing)
    {
        if (attackspeed < 14)
            attackspeed += 0.1
        hsp = (image_xscale * attackspeed)
        if place_meeting((x + sign(hsp)), y, obj_solid)
        {
            state = (134 << 0)
            attacked = 1
        }
    }
}

