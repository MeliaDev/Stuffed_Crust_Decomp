function scr_enemy_rage() //scr_enemy_rage
{
    switch object_index
    {
        case obj_forknight:
            image_speed = 0.6
            if (sprite_index == spr_forknight_ragestart)
            {
                hsp = 0
                if (image_index > (image_number - 1))
                {
                    sprite_index = spr_forknight_rageloop
                    image_index = 0
                }
            }
            else if (sprite_index == spr_forknight_rageloop)
            {
                hsp = (image_xscale * (4 + (global.baddiespeed - 1)))
                with (instance_place((x + hsp), y, obj_destructibles))
                    instance_destroy()
                if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_slope))))
                {
                    state = (138 << 0)
                    stunned = 100
                    vsp = -8
                    hsp = ((-image_xscale) * 5)
                }
            }
            break
        case 301:
            hsp = 0
            if (!hitboxcreate)
            {
                hitboxcreate = 1
                with (instance_create(x, y, obj_forkhitbox))
                {
                    image_xscale = other.image_xscale
                    ID = other.id
                }
            }
            if (floor(image_index) == (image_number - 1))
            {
                ragebuffer = 100
                state = (134 << 0)
                sprite_index = walkspr
            }
            break
        case 377:
            if (floor(image_index) == 12 && (!shot))
            {
                with (instance_create((x + (image_xscale * 70)), (y + 8), obj_parryeffect))
                {
                    sprite_index = spr_player_pistoleffect
                    image_xscale = other.image_xscale
                    image_speed = 0.4
                }
                fmod_event_one_shot_3d("event:/sfx/enemies/rancherpistol", x, y)
                shot = 1
                with (instance_create((x + (image_xscale * 15)), (y + 5), obj_slugbullet))
                    image_xscale = other.image_xscale
            }
            if (floor(image_index) == (image_number - 1))
            {
                shot = 0
                sprite_index = spr_pizzaslug_walk
                state = (134 << 0)
                ragecooldown = 100
            }
            break
        case 687:
            ragedash--
            if (ragedash == 0)
            {
                ragecooldown = 200
                ragedash = 50
                state = (134 << 0)
                sprite_index = walkspr
            }
            if ((!shot) && ragedash < 30)
            {
                fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
                shot = 1
                with (instance_create(x, y, obj_arcprojectile))
                {
                    image_xscale = other.image_xscale
                    hsp = (image_xscale * 6)
                    vsp = -11
                }
                if elite
                {
                    with (instance_create(x, y, obj_arcprojectile))
                    {
                        image_xscale = other.image_xscale
                        hsp = (image_xscale * 8)
                        vsp = -9
                    }
                }
            }
            break
        case 686:
            if (floor(image_index) == 3 && shoot == 0)
            {
                shoot = 1
                instance_create(x, y, obj_warplaserhoming)
            }
            if (floor(image_index) == (image_number - 1))
                state = (134 << 0)
            break
        case 646:
            if (floor(image_index) > 10)
            {
                hsp = (image_xscale * 8)
                with (instance_create(x, y, obj_baddieragehitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                }
            }
            else
                hsp = 0
            if (floor(image_index) == (image_number - 1))
            {
                state = (134 << 0)
                sprite_index = walkspr
            }
            break
        case 651:
            hsp = (movespeed * image_xscale)
            if (sprite_index == spr_minijohn_rage1 && floor(image_index) == (image_number - 1))
                sprite_index = spr_minijohn_rage2
            if (grounded && vsp > 0)
            {
                var targetplayer = obj_player1
                if (obj_player1.spotlight == 0)
                    targetplayer = 529
                movespeed = 4
                image_xscale = (-(sign((x - targetplayer.x))))
                state = (141 << 0)
                sprite_index = spr_minijohn_charge
            }
            break
        case 688:
            var thespeed = 0
            if (image_index > 7)
                thespeed = 12
            hsp = (image_xscale * thespeed)
            if (floor(image_index) == (image_number - 1))
            {
                with (instance_create(x, y, obj_forkhitbox))
                    ID = other.id
                charging = 1
                state = (128 << 0)
                movespeed = 5
                vsp = -7
                sprite_index = spr_fencer_chargestart
            }
            break
        case 684:
            hsp = 0
            if (sprite_index == spr_ancho_rage1)
                vsp = 0
            if (sprite_index == spr_ancho_rage2)
                vsp = 10
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage1)
                sprite_index = spr_ancho_rage2
            if (grounded && sprite_index == spr_ancho_rage2)
            {
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
                image_index = 0
                sprite_index = spr_ancho_rage3
            }
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage3)
            {
                state = (134 << 0)
                sprite_index = spr_ancho
            }
            break
        case 676:
            ragedash--
            if (ragedash <= 0)
            {
                with (instance_create(x, y, obj_bigspitcheesespike))
                {
                    other.ragedash = 50
                    hsp = (other.image_xscale * 5)
                    vsp = -7
                }
            }
            if (floor(image_index) == (image_number - 1))
            {
                state = (134 << 0)
                sprite_index = spr_spitcheese_idle
            }
            break
        case 373:
            if (sprite_index != spr_tank_chargestart)
            {
                if ((x + hsp) == xprevious)
                    slope_buffer--
                else
                    slope_buffer = 12
            }
            if (sprite_index == spr_tank_chargestart)
                hsp = 0
            if (sprite_index == spr_tank_charge)
                hsp = (image_xscale * 8)
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_tank_chargestart)
                sprite_index = spr_tank_charge
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
            if ((place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!scr_slope())) || slope_buffer <= 0)
            {
                slope_buffer = 8
                state = (138 << 0)
                hsp = ((-image_xscale) * 7)
                vsp = -6
                sprite_index = spr_tank_hitwall
                stunned = 200
                bombreset = 200
            }
            break
        case 623:
        case 647:
        case 648:
            if ((!shot) && floor(image_index) == 9)
            {
                shot = 1
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
            }
            if (floor(image_index) == (image_number - 1))
            {
                ragecooldown = 100
                state = (134 << 0)
            }
            break
    }

    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
}

