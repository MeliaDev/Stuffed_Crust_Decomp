function scr_playersounds() //scr_playersounds
{
    with (obj_player)
    {
        if instance_exists(obj_pizzaface)
        {
            if (!fmod_event_instance_is_playing(global.snd_pizzafacemoving))
                fmod_event_instance_play(global.snd_pizzafacemoving)
            with (obj_pizzaface)
                fmod_event_instance_set_3d_attributes(global.snd_pizzafacemoving, x, y)
        }
        else
            fmod_event_instance_stop(global.snd_pizzafacemoving, 1)
        if (state == (146 << 0) && sprite_index == spr_firemouthend)
        {
            if (image_index > 8 && (!fmod_event_instance_is_playing(burpsnd)))
            {
                fmod_event_instance_play(burpsnd)
                fmod_event_instance_set_3d_attributes(burpsnd, x, y)
            }
        }
        if fmod_event_instance_is_playing(mortslap)
            fmod_event_instance_set_3d_attributes(mortslap, x, y)
        if (state != (150 << 0) && sprite_index != spr_knightpepstart && state != (52 << 0) && state != (61 << 0) && state != (297 << 0) && state != (296 << 0) && state != (112 << 0) && state != (98 << 0) && state != (59 << 0) && state != (89 << 0) && state != (9 << 0))
        {
            if (!scr_transformationcheck())
            {
                if (!transformationsnd)
                {
                    transformationsnd = true;
                    if (irandom(100) <= 70)
                        fmod_event_instance_play(snd_voicetransfo)
                    fmod_event_one_shot_3d("event:/sfx/misc/transfo", x, y)
                }
            }
            else if transformationsnd
            {
                transformationsnd = 0
                if (irandom(100) <= 70)
                    fmod_event_instance_play(snd_voiceouttransfo)
                fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y)
            }
        }
        fmod_event_instance_set_3d_attributes(snd_voiceouttransfo, x, y)
        fmod_event_instance_set_3d_attributes(snd_voicetransfo, x, y)
        fmod_event_instance_set_3d_attributes(snd_voiceok, x, y)
        fmod_event_instance_set_3d_attributes(snd_voicehurt, x, y)
        fmod_event_instance_set_3d_attributes(snd_uppercut, x, y)
        fmod_event_instance_set_3d_attributes(snd_dive, x, y)
        fmod_event_instance_set_3d_attributes(snd_crouchslide, x, y)
        fmod_event_instance_set_3d_attributes(rollgetupsnd, x, y)
        fmod_event_instance_set_3d_attributes(animatronicsnd, x, y)
        fmod_event_instance_set_3d_attributes(snd_dashpad, x, y)
        fmod_event_instance_set_3d_attributes(gallopingsnd, x, y)
        if (state == (108 << 0) || state == (122 << 0) || state == (76 << 0) || (state == (61 << 0) && tauntstoredstate == (76 << 0)))
        {
            if (!fmod_event_instance_is_playing(freefallsnd))
                fmod_event_instance_play(freefallsnd)
            fmod_event_instance_set_paused(freefallsnd, 0)
            fmod_event_instance_set_3d_attributes(freefallsnd, x, y)
        }
        else
            fmod_event_instance_stop(freefallsnd, 1)
        if (state == (104 << 0) || state == (20 << 0) || state == (121 << 0) || state == (37 << 0) || state == (184 << 0))
        {
            fmod_event_instance_set_paused(machsnd, 0)
            if (!fmod_event_instance_is_playing(machsnd))
                fmod_event_instance_play(machsnd)
            var s = 0
            if (dropdash == 0)
            {
                if ((state == (104 << 0) && grounded && (sprite_index == spr_mach1 || (sprite_index == spr_player_machhit && movespeed < 9))) || (state == (20 << 0) && movespeed < 9))
                    s = 1
                else if ((state == (104 << 0) && (sprite_index == spr_mach || sprite_index == spr_player_machhit)) || state == (37 << 0) || (state == (20 << 0) && movespeed < 12))
                    s = 2
                else if ((state == (121 << 0) && sprite_index != spr_crazyrun) || (state == (20 << 0) && movespeed < 16))
                    s = 3
                else if (sprite_index == spr_crazyrun || state == (20 << 0))
                    s = 4
                if (state == (184 << 0))
                    s = 4
            }
            fmod_event_instance_set_3d_attributes(machsnd, x, y)
            fmod_event_instance_set_parameter(machsnd, "state", s, 1)
        }
        else
            fmod_event_instance_stop(machsnd, 1)
        if ((state == (38 << 0) && grounded && vsp > 0) || state == (78 << 0) || (state == (211 << 0) && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
        {
            if (!fmod_event_instance_is_playing(knightslidesnd))
                fmod_event_instance_play(knightslidesnd)
            fmod_event_instance_set_3d_attributes(knightslidesnd, x, y)
        }
        else if fmod_event_instance_is_playing(knightslidesnd)
            fmod_event_instance_stop(knightslidesnd, 1)
        if (state == (99 << 0))
        {
            if (!fmod_event_instance_is_playing(superjumpsnd))
            {
                fmod_event_instance_set_parameter(superjumpsnd, "state", 0, 1)
                fmod_event_instance_play(superjumpsnd)
            }
        }
        else if (state == (97 << 0))
            fmod_event_instance_set_parameter(superjumpsnd, "state", 1, 1)
        else if (state != (97 << 0))
        {
            if (fmod_event_instance_is_playing(superjumpsnd) && fmod_event_instance_get_parameter(superjumpsnd, "state") < 1)
                fmod_event_instance_stop(superjumpsnd, 1)
            else if (!fmod_event_instance_is_playing(superjumpsnd))
                fmod_event_instance_set_parameter(superjumpsnd, "state", 0, 1)
        }
        if (sprite_index == spr_superjumpcancel)
            fmod_event_instance_stop(superjumpsnd, 1)
        if fmod_event_instance_is_playing(superjumpsnd)
            fmod_event_instance_set_3d_attributes(superjumpsnd, x, y)
        if (sprite_index == spr_playerN_doublejump && sprite_index != spr_playerN_dive && (!grounded))
        {
            if (image_index == 0 && doublejump)
            {
                if (!fmod_event_instance_is_playing("event:/sfx/pep/rampjump"))
                    fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
            }
        }
        if ((!ispeppino) && sprite_index == spr_playerN_mach2jump && sprite_index != spr_playerN_dive && (!grounded))
        {
            if (image_index == 0 && doublejump == 0)
            {
                fmod_event_one_shot_3d("event:/sfx/noise/spin", x, y)
                doublejump = 1
            }
        }
        if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
        {
            if (!fmod_event_instance_is_playing(tumblesnd))
            {
                fmod_event_instance_play(tumblesnd)
                fmod_event_instance_set_parameter(tumblesnd, "state", 0, 1)
                if (sprite_index == spr_tumblestart)
                    tumbleintro = 1
            }
            if (sprite_index == spr_tumble && (!tumbleintro))
                fmod_event_instance_set_parameter(tumblesnd, "state", 1, 1)
            fmod_event_instance_set_3d_attributes(tumblesnd, x, y)
        }
        else
        {
            if fmod_event_instance_is_playing(tumblesnd)
            {
                fmod_event_instance_set_parameter(tumblesnd, "state", 2, 1)
                fmod_event_instance_set_3d_attributes(tumblesnd, x, y)
            }
            tumbleintro = 0
        }
        if ((sprite_index == spr_crouchslip || sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_player_faceplant || sprite_index == spr_playerN_suplexdash_GOLF || sprite_index == spr_gustavo_grab || sprite_index == spr_rollmach || sprite_index == spr_playerV_divekickstart || sprite_index == spr_playerV_divekick || sprite_index == spr_backslide || sprite_index == spr_backslideland || sprite_index == spr_playerN_jetpackslide || sprite_index == spr_player_breakdancesuper) && grounded)
        {
            if (!fmod_event_instance_is_playing(machrollsnd))
                fmod_event_instance_play(machrollsnd)
            fmod_event_instance_set_3d_attributes(machrollsnd, x, y)
        }
        else
            fmod_event_instance_stop(machrollsnd, 1)
        if fmod_event_instance_is_playing(suplexdashsnd)
        {
            if (state != (42 << 0))
                fmod_event_instance_stop(suplexdashsnd, 1)
            fmod_event_instance_set_3d_attributes(suplexdashsnd, x, y)
        }
        if (state == (211 << 0) && sprite_index == spr_player_corpsesurf && grounded && vsp > 0)
        {
            if (!fmod_event_instance_is_playing(gravecorpsesnd))
                fmod_event_instance_play(gravecorpsesnd)
            fmod_event_instance_set_3d_attributes(gravecorpsesnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(gravecorpsesnd, 1)
        if (state == (116 << 0) && grounded && vsp > 0)
        {
            if (!fmod_event_instance_is_playing(barrelslidesnd))
                fmod_event_instance_play(barrelslidesnd)
            fmod_event_instance_set_3d_attributes(barrelslidesnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(barrelslidesnd, 1)
        if (state == (94 << 0) && sprite_index == spr_currentplayer)
        {
            if (!fmod_event_instance_is_playing(waterslidesnd))
                fmod_event_instance_play(waterslidesnd)
            fmod_event_instance_set_3d_attributes(waterslidesnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(waterslidesnd, 1)
        if (state == (214 << 0))
        {
            if (!fmod_event_instance_is_playing(mrpinchsnd))
                fmod_event_instance_play(mrpinchsnd)
            fmod_event_instance_set_parameter(mrpinchsnd, "state", 0, 1)
            fmod_event_instance_set_3d_attributes(mrpinchsnd, (x + hsp), (y + vsp))
        }
        else if fmod_event_instance_is_playing(mrpinchsnd)
        {
            fmod_event_instance_set_parameter(mrpinchsnd, "state", 1, 1)
            fmod_event_instance_set_3d_attributes(mrpinchsnd, (x + hsp), (y + vsp))
        }
        if (hamkuffID != noone && instance_exists(hamkuffID) && (!launched))
        {
            if (!fmod_event_instance_is_playing(hamkuffsnd))
                fmod_event_instance_play(hamkuffsnd)
            if launch
                fmod_event_instance_set_parameter(hamkuffsnd, "state", 1, 1)
            else
                fmod_event_instance_set_parameter(hamkuffsnd, "state", 0, 1)
            fmod_event_instance_set_3d_attributes(hamkuffsnd, (x + hsp), (y + vsp))
        }
        else
        {
            if fmod_event_instance_is_playing(hamkuffsnd)
            {
                fmod_event_instance_set_parameter(hamkuffsnd, "state", 2, 1)
                fmod_event_instance_set_3d_attributes(hamkuffsnd, (x + hsp), (y + vsp))
            }
            hamkuffID = -4
        }
        if ((state == (191 << 0) || state == (192 << 0)) && ratmount_movespeed >= 14 && (sprite_index == spr_player_ratmountattack || sprite_index == spr_player_ratmountmach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_gustavo_grab || sprite_index == spr_lonegustavo_dash || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_lonegustavo_dashjump))
        {
            if (!fmod_event_instance_is_playing(ratmountmachsnd))
                fmod_event_instance_play(ratmountmachsnd)
            s = 0
            if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_gustavo_grab || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dashjump)
                s = 1
            fmod_event_instance_set_parameter(ratmountmachsnd, "state", s, 1)
            if grounded
                fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 1, 1)
            else
                fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 0, 1)
            fmod_event_instance_set_3d_attributes(ratmountmachsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(ratmountmachsnd, 1)
        if (state == (259 << 0))
        {
            if (!fmod_event_instance_is_playing(ratmountpunchsnd))
                fmod_event_instance_play(ratmountpunchsnd)
            fmod_event_instance_set_3d_attributes(ratmountpunchsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(ratmountpunchsnd, 1)
        if (state == (198 << 0) && sprite_index == spr_player_ratmountwalljump)
        {
            if (!fmod_event_instance_is_playing(ratmountgroundpoundsnd))
                fmod_event_instance_play(ratmountgroundpoundsnd)
            s = 0
            if instance_exists(superslameffectid)
                s = 1
            fmod_event_instance_set_parameter(ratmountgroundpoundsnd, "state", s, 1)
            fmod_event_instance_set_3d_attributes(ratmountgroundpoundsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(ratmountgroundpoundsnd, 1)
        if (state == (225 << 0))
        {
            if (!fmod_event_instance_is_playing(animatronicsnd))
                fmod_event_instance_play(animatronicsnd)
            fmod_event_instance_set_3d_attributes(animatronicsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(animatronicsnd, 1)
        if instance_exists(obj_brickball)
        {
            if (!fmod_event_instance_is_playing(ratmountballsnd))
                fmod_event_instance_play(ratmountballsnd)
            fmod_event_instance_set_3d_attributes(ratmountballsnd, (obj_brickball.x + obj_brickball.hsp), (obj_brickball.y + obj_brickball.vsp))
        }
        else
            fmod_event_instance_stop(ratmountballsnd, 1)
        if instance_exists(obj_balloongrabbableeffect)
        {
            if (!fmod_event_instance_is_playing(ratdeflatesnd))
                fmod_event_instance_play(ratdeflatesnd)
            fmod_event_instance_set_3d_attributes(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y)
        }
        else
            fmod_event_instance_stop(ratdeflatesnd, 1)
        if (state == (21 << 0) && grounded && vsp > 0)
        {
            if (!fmod_event_instance_is_playing(cheeseballsnd))
                fmod_event_instance_play(cheeseballsnd)
            fmod_event_instance_set_3d_attributes(cheeseballsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(cheeseballsnd, 1)
        if (state == (31 << 0) && abs(hsp) > 8 && grounded)
        {
            if (!fmod_event_instance_is_playing(gallopingsnd))
                fmod_event_instance_play(gallopingsnd)
        }
        else if fmod_event_instance_is_playing(gallopingsnd)
            fmod_event_instance_stop(gallopingsnd, 1)
        if (state == (34 << 0))
        {
            if (!fmod_event_instance_is_playing(boxxedspinsnd))
                fmod_event_instance_play(boxxedspinsnd)
            fmod_event_instance_set_3d_attributes(boxxedspinsnd, (x + hsp), (y + vsp))
        }
        else
            fmod_event_instance_stop(boxxedspinsnd, 1)
        if fmod_event_instance_is_playing(pizzapeppersnd)
        {
            if (state == (254 << 0))
            {
                fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, 1)
                fmod_event_instance_set_3d_attributes(pizzapeppersnd, (x + hsp), (y + vsp))
            }
            else
                fmod_event_instance_set_parameter(pizzapeppersnd, "state", 1, 1)
        }
        if (state == (16 << 0) && sprite_index != spr_ghostidle)
        {
            if (!fmod_event_instance_is_playing(ghostspeedsnd))
                fmod_event_instance_play(ghostspeedsnd)
            s = 0
            if (ghostpepper == 1)
                s = 1
            else if (ghostpepper == 2)
                s = 2
            else if (ghostpepper >= 3)
                s = 3
            fmod_event_instance_set_3d_attributes(ghostspeedsnd, x, y)
            fmod_event_instance_set_parameter(ghostspeedsnd, "state", s, 1)
        }
        else if fmod_event_instance_is_playing(ghostspeedsnd)
            fmod_event_instance_stop(ghostspeedsnd, 0)
    }
}

