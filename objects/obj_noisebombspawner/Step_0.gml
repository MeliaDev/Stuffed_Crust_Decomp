if (floor(image_index) == throwindex && canthrowbomb == 1)
{
    with (instance_create((x + (image_xscale * 10)), (y - 20), obj_pizzagoblinbomb))
    {
        hsp = (other.image_xscale * 4)
        drop = 1
        insta = 1
        vsp = -3
    }
    canthrowbomb = 0
}
if (floor(image_index) == (image_number - 1) && canthrowbomb == 0)
{
    image_speed = 0
    image_index = 0
    countdown = 1
}
else
    image_speed = 0.35
if countdown
{
    counttimer += 1
    if (counttimer >= 1000)
    {
        if obj_player1.ispeppino
        {
            noisechance = irandom(100)
            if (noisechance == 7 || noisechance == 70 || noisechance == 77)
            {
                sprite_index = spr_noise_throwbomb_new
                throwindex = 3
            }
        }
        canthrowbomb = 1
        counttimer = 0
    }
    else
    {
        image_speed = 0
        image_index = 0
    }
}
