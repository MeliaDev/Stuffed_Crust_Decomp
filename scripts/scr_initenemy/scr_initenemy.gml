function scr_initenemy() //scr_initenemy
{
    chargesnd = fmod_event_create_instance("event:/sfx/enemies/charge")
    pizzaheadKO = -4
    pizzaheadKO_ID = -4
    pizzaheadKO_buffer = 0
    pizzahead_maxsubhp = 3
    pizzahead_subhp = pizzahead_maxsubhp
    cloudcreate = 0
    underground = 0
    camzoom = 1
    mach2 = 0
    stickygib = 0
    steppy = 0
    santaID = -4
    rattime = 0
    platformid = -4
    angryeffectid = -4
    usepalette = 0
    altangle = 0
    blur_effect = 0
    hsp_carry = 0
    vsp_carry = 0
    xscale = 1
    yscale = 1
    grav = 0.5
    hsp = 0
    vsp = 0
    stunned = 0
    alarm[0] = 150
    roaming = 1
    flying = 0
    straightthrow = 0
    stomped = 0
    escapespawnID = -4
    reset = 0
    bombreset = 0
    hp = 1
    maxhp = 1
    grounded = 1
    hit_connected = 0
    flash = 0
    birdcreated = 0
    boundbox = 0
    hitboxcreate = 0
    important = 0
    heavy = 0
    depth = 0
    grabbedby = 0
    paletteselect = 0
    spr_palette = palette_forknight
    stuntouchbuffer = 0
    scaredbuffer = 0
    movespeed = 1
    ragebuffer = 0
    ragehitbox = 0
    ragedash = 0
    ragecooldown = 0
    img_angle = image_angle
    steppy = 20
    invtime = 0
    invincible = 0
    bumpable = 1
    stompable = 1
    killbyenemy = 1
    groundpound = 1
    instantkillable = 1
    stunnable = 1
    parryable = 1
    destroyable = 1
    hittable = 1
    shakestun = 1
    supertauntable = 1
    pepperman_grab = 0
    stagger_buffer = -1
    stagger_max = 45
    stagger_jumpspeed = 4
    stagger_movespeed = 1
    stagger_dir = 1
    hitLag = 25
    hitX = x
    hitY = y
    hitvsp = 0
    hithsp = 0
    dodgebuffer = 0
    arcprojectiletimer = 0
    escape = 0
    escapestun = 1
    oggrav = 0.5
    arena = 0
    wave = 0
    rage = 0
    instakilled = 0
    killprotection = 0
    mach3destroy = 0
    provoked = 0
    is_controllable = 0
    possess_movespeed = 0
    stuntouch_yoffset = 0
    turnmax = 200
    turntimer = 0
    turnstart = 0
    timedgate = 0
    chargeID = -4
    angle = image_angle
    is_controllable = 0
    possess_movespeed = 0
    grav = 0.5
    hsp = 0
    vsp = 0
    state = (134 << 0)
    stunned = 0
    alarm[0] = 150
    roaming = 1
    collectdrop = 5
    flying = 0
    straightthrow = 0
    cigar = 0
    cigarcreate = 0
    stomped = 0
    shot = 0
    reset = 0
    flash = 0
    thrown = 0
    hp = 1
    slapped = 0
    grounded = 1
    birdcreated = 0
    boundbox = 0
    spr_dead = spr_slimedead
    important = 0
    heavy = 0
    depth = 0
    slapamt = 0
    paletteselect = 0
    spr_palette = palette_cheeseslime
    grabbedby = 0
    stuntouchbuffer = 0
    scaredbuffer = 0
    railmovespeed = 0
    use_collision = 1
    turner = 0
    elite = 0
    elitehit = 0
    if (!is_bossroom())
    {
        if (object_index != obj_pizzaboy && object_index != obj_pizzaball && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_vigilanteboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_treasureguy && object_index != obj_hamkuff && object_index != obj_fakepepgianthead && object_index != obj_pf_fakepepgianthead)
        {
            if (!global.heatmeter)
            {
                if global.panic
                {
                    if ((global.lap == 0 && irandom(100) == 7) || (global.lap != 0 && (irandom(100) == 7 || irandom(100) == 70 || irandom(100) == 77)))
                        elite = 1
                }
            }
            else if (global.heatmeter == 1)
            {
                if (global.stylethreshold > 0)
                {
                    if (global.stylethreshold == 4 || irandom(10) <= (global.stylethreshold * 2) || (global.lap == 1 && irandom(10) <= ((global.stylethreshold * 2) * (global.laps * 2))))
                        elite = 1
                }
            }
        }
    }
    elitehpinit = 0
    elitegrab = 0
    elitehurt = 1
    ventilator_vsp = -5
    linethrown = 0
    dashcloudid = 741
    player_instakillmove = 0
    stompbuffer = 0
    killbyenemybuffer = 0
    madepersistent = 0
}

