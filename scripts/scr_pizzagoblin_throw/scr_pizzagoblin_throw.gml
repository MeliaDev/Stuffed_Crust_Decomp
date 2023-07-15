function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = (134 << 0)
        sprite_index = walkspr
    }
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        switch object_index
        {
            case obj_rancher:
                fmod_event_one_shot_3d("event:/sfx/enemies/rancherpistol", x, y)
                break
            default:
                fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
                break
        }

        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    baddie = 1
                    defused = 1
                    trace("pizzagoblinbomb create: ", baddie)
                    image_xscale = other.image_xscale
                    if other.altangle
                    {
                        countdown = 10
                        movespeed = 7
                        vsp = -12
                    }
                    else
                    {
                        countdown = 80
                        movespeed = 5
                        vsp = -10
                    }
                }
                break
            case 661:
                repeat (5)
                {
                    with (instance_create((x + (image_xscale * 35)), y, obj_firemouthflame))
                    {
                        image_speed = 0.35
                        sprite_index = spr_cloudeffect
                        depth = (other.depth - 1)
                    }
                }
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case 660:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                    elite = other.elite
                break
            case 655:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case 676:
                if (spitcheesespr == spr_spitcheese_spit)
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                else
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                break
            case 38:
            case 678:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case 657:
                with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
                {
                    grav = 0
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 658:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case 114:
                with (instance_create((x + (other.image_xscale * 8)), y, obj_kentukylenny_projectile))
                {
                    repeat (3)
                        instance_create(x, y, obj_firemouthflame)
                    image_xscale = other.image_xscale
                }
                break
            case 665:
                with (instance_create(x, y, obj_pizzard_bolt))
                {
                    fmod_event_one_shot_3d("event:/sfx/enemies/pizzardelectricity", x, y)
                    image_xscale = other.image_xscale
                }
                break
            case 668:
                if elite
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break
            case 670:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case 1020:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case 666:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case 373:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 647:
            case 623:
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 667:
                with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case 377:
                substate = choose((134 << 0), (126 << 0), (126 << 0))
                substate_buffer = substate_max
                fmod_event_one_shot_3d("event:/sfx/enemies/coughing", x, y)
                with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case 648:
                with (instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break
            case 686:
                instance_create(x, y, obj_warplaser)
                break
            case 476:
                with (instance_create((x + (8 * image_xscale)), y, obj_ufobullet))
                {
                    fmod_event_one_shot_3d("event:/sfx/enemies/ufolivelaser", x, y)
                    image_xscale = other.image_xscale
                }
                break
            case 1053:
                instance_create(x, (y + 70), obj_kentukybomb)
                break
            case 333:
                var xx = (x + (72 * image_xscale))
                with (instance_create(xx, y, obj_bazooka))
                {
                    other.bazookaID = id
                    baddieID = other.id
                }
                create_particle(xx, y, (6 << 0))
                break
            case 32:
                var s = 2
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = 0
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = (-s)
                with (instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = s
                break
            case 303:
                with (instance_create(x, (y - 64), obj_farmerbaddie3_projectile))
                {
                    hsp = 0
                    vsp = -16
                }
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
    if altangle
        altangle = 0
}

