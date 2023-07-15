boss_maxhp = boss_hp
boss_prevhp = boss_maxhp
player_maxhp = player_hp
persistent = 0
if (boss_func != -4)
    self.boss_func()
boss_prevhp = boss_hp
playerx = (-sprite_get_width(playerspr))
bossx = (obj_screensizer.actual_width + sprite_get_width(bossspr))
instance_destroy(obj_pigtotal)
if (!global.bossintro)
    global.bossintro = 1
else if (room != rank_room)
{
    state = (0 << 0)
    with (obj_player1)
    {
        state = (0 << 0)
        hsp = 0
        movespeed = 0
        flash = 0
        x = roomstartx
    }
    with (obj_player2)
        visible = false
    alarm[4] = 2
    with (obj_pepperman)
        skipintro = 1
    with (obj_vigilanteboss)
        skipintro = 1
    with (obj_noiseboss)
        skipintro = 1
    with (obj_fakepepboss)
        skipintro = 1
    with (obj_pizzafaceboss)
        skipintro = 1
}
