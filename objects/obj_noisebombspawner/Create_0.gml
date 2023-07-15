image_speed = 0.35
canthrowbomb = 1
sprite_index = spr_pizzagoblin_throwbomb_wall
throwindex = 8
noisechance = 0
if obj_player1.ispeppino
{
    noisechance = irandom(100)
    if (noisechance == 7 || noisechance == 70 || noisechance == 77)
    {
        sprite_index = spr_noise_throwbomb_new
        throwindex = 3
    }
}
countdown = 0
counttimer = 0
