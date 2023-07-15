index += 0.35
if (x != obj_player1.x)
    image_xscale = sign((obj_player1.x - x))
switch state
{
    case (0 << 0):
        sprite_index = idlespr
        if (!instance_exists(collectID))
        {
            state = (74 << 0)
            sprite_index = throwspr
            image_index = 0
            showtext = 1
            alarm[0] = 50
        }
        break
    case (74 << 0):
        if (floor(image_index) == (image_number - 1))
            image_index = (image_number - 1)
        if (floor(image_index) >= 3)
        {
            if (onebyoneID == noone)
            {
                global.collect -= 150
                onebyoneID = instance_create(x, (y - 30), obj_pizzasona_points)
            }
            else if (!instance_exists(onebyoneID))
            {
                state = (8 << 0)
                sprite_index = transitionspr
                image_index = 0
            }
        }
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            state = (92 << 0)
            sprite_index = idlespr
            movespeed = 4
            showtext = 0
            scr_ghostcollectible(1)
        }
        break
    case (92 << 0):
        movespeed += 0.25
        y -= movespeed
        if (y < -500)
            instance_destroy()
        break
}

