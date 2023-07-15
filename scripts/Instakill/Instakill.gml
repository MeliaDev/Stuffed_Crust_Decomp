function Instakill() //Instakill
{
    var hx = other.baddieID.x
    var hy = other.baddieID.y
    if (other.baddieID.state == (137 << 0))
    {
        hx = other.baddieID.hitX
        hy = other.baddieID.hitY
    }
    other.baddieID.grabbedby = 1
    if (object_index == obj_player2)
        other.baddieID.grabbedby = 2
    if (state == (10 << 0))
    {
        repeat (8)
        {
            with (instance_create(other.baddieID.x, other.baddieID.y, obj_firemouthflame))
            {
                hsp = random_range(5, 10)
                vsp = random_range(5, 10)
            }
        }
    }
    if (state == (121 << 0) && sprite_index != spr_playerV_divekick && sprite_index != spr_playerV_divekickstart && fightball == 0 && sprite_index != spr_mach2jump && sprite_index != spr_superjumpcancel && sprite_index != spr_mach3hit && character != "M")
    {
        sprite_index = spr_mach3hit
        image_index = 0
    }
    if (state == (41 << 0) && sprite_index != spr_player_chainsawhit && sprite_index != spr_player_chainsawswing && sprite_index != spr_player_chainsawcrouch)
    {
        image_index = 0
        sprite_index = spr_player_chainsawhit
    }
    if (state == (142 << 0) && sprite_index != spr_player_lungehit && sprite_index != spr_playerN_spin)
    {
        state = (6 << 0)
        if ispeppino
            sprite_index = spr_player_lungehit
        else
            sprite_index = spr_playerN_spin
        image_index = 0
    }
    other.baddieID.invtime = 25
    suplexmove = 1
    if (object_index == obj_player1)
        other.baddieID.grabbedby = 1
    else
        other.baddieID.grabbedby = 2
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    var theroomname = room_get_name(room)
    if (other.baddieID.elite && other.baddieID.object_index != obj_pepperman && other.baddieID.object_index != obj_pizzafaceboss && other.baddieID.object_index != obj_vigilanteboss && other.baddieID.object_index != obj_noiseboss && other.baddieID.object_index != obj_fakepepboss && other.baddieID.object_index != obj_pf_fakepep && other.baddieID.object_index != obj_pizzafaceboss_p3)
    {
        other.baddieID.elitehit = 0
        other.baddieID.player_instakillmove = 1
    }
    with (other)
    {
        if ((!baddieID.elite) || baddieID.elitehit <= 0)
            baddieID.mach3destroy = 1
    }
    if ((!other.baddieID.killprotection) && (!global.kungfu) && ((!other.baddieID.elite) || other.baddieID.elitehit <= 0))
        other.baddieID.instakilled = 1
    if (!other.baddieID.important)
    {
        global.combotime = 60
        global.heattime = 60
    }
    global.hit += 1
    if ((!grounded) && state != (197 << 0) && state != (259 << 0) && state != (259 << 0) && state != (34 << 0) && state != (108 << 0) && (key_jump2 || input_buffer_jump > 0 || state == (254 << 0)))
    {
        input_buffer_jump = 0
        suplexmove = 0
        vsp = -11
    }
    if (state == (34 << 0))
    {
        if key_jump2
            vsp = -10
        boxxedpepjump = 10
    }
    if (character == "M" && state == (108 << 0))
    {
        vsp = -11
        state = (92 << 0)
        sprite_index = spr_jump
    }
    if (state != (61 << 0))
    {
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
    }
    if (state == (42 << 0) && (!key_slap))
    {
        image_index = random_range(0, (image_number - 1))
        if grounded
            sprite_index = spr_player_groundedattack
        else
            sprite_index = spr_player_ungroundedattack
    }
    if (state == (41 << 0) && (!global.kungfu) && sprite_index != spr_player_chainsawswing && sprite_index != spr_player_chainsawcrouch)
    {
        sprite_index = spr_player_chainsawhit
        image_index = 0
    }
    if (state == (56 << 0))
    {
        sprite_index = spr_player_chainsawpogobounce
        image_index = 0
    }
    if (other.baddieID.heavy == 1)
        var lag = 10
    else
        lag = 6
    other.baddieID.hitLag = lag
    other.baddieID.hitX = hx
    other.baddieID.hitY = hy
    other.baddieID.hp -= 1
    hitLag = lag
    hitX = x
    hitY = y
    instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
    other.baddieID.alarm[3] = 3
    other.baddieID.state = (137 << 0)
    other.baddieID.image_xscale = (-xscale)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (state != (104 << 0) && state != (5 << 0))
    {
        with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
            sprite_index = spr_kungfueffect
    }
    other.baddieID.hithsp = (xscale * (movespeed + 2))
    if (abs(other.baddieID.hithsp) < 10)
        other.baddieID.hithsp = (xscale * 10)
    other.baddieID.hitvsp = -5
    state = (61 << 0)
}

