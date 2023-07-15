targetplayer = obj_player1.id
mask_index = spr_player_mask
switch state
{
    case (8 << 0):
        scr_fakepepclone_transitioncutscene()
        break
    case (134 << 0):
        scr_fakepepclone_walk()
        break
    case (276 << 0):
        scr_fakepepboss_grabdash()
        break
    case (277 << 0):
        scr_fakepepboss_grabthrow()
        break
    case (92 << 0):
        scr_fakepepboss_jump()
        break
    case (108 << 0):
        scr_fakepepboss_freefall()
        break
    case (104 << 0):
        scr_fakepepboss_mach2()
        break
    case (99 << 0):
        scr_fakepepclone_Sjumpprep()
        break
    case (97 << 0):
        scr_fakepepclone_Sjump()
        break
    case (74 << 0):
        scr_fakepepclone_throwing()
        break
    case (84 << 0):
        scr_fakepepboss_backbreaker()
        break
}

if (state == (97 << 0))
{
    if (!instance_exists(hitboxID))
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id
            other.hitboxID = id
            sprite_index = other.sprite_index
        }
    }
}
if ((state == (276 << 0) || (state == (104 << 0) && attackspeed >= 10) || (state == (74 << 0) && sprite_index == spr_fakepeppino_flailing) || state == (108 << 0)) && alarm[0] == -1)
{
    alarm[0] = 10
    if (state == (108 << 0))
        alarm[0] = 5
}
if (state == (92 << 0))
    grav = 0.4
else
    grav = 0.5
scr_collide()
scr_fakepep_update_sounds()
