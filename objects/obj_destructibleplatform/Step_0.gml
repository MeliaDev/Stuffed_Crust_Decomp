if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == idlespr)
    {
        sprite_index = fallingspr
        falling = 1
        x = -100
        y = -100
    }
    else if (sprite_index == reformspr)
    {
        falling = 0
        sprite_index = idlespr
        image_index = 0
        image_speed = 0
    }
}
if (falling && sprite_index == idlespr && image_speed == 0)
    image_speed = 0.35
if (sprite_index == fallingspr && reset > 0)
    reset--
if (reset <= 0 && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_pizzaball))) && (!(place_meeting(xstart, ystart, obj_clownmato))) && (!(place_meeting(xstart, ystart, obj_monster))))
{
    reset = 100
    sprite_index = reformspr
    image_index = 0
    image_speed = 0.35
    falling = 0
    x = xstart
    y = ystart
}
