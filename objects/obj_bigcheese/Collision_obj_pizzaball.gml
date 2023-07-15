if (state != (74 << 0) && (other.hsp != 0 || other.thrown || other.state == (5 << 0)))
{
    pizzaball = 1
    golfid = other.id
    shot = 0
    state = (74 << 0)
    other.bigcheeseID = id
    other.sprite_index = spr_pizzaball_roll
    sprite_index = spr_bigcheese_throw
    image_index = 0
    depth = -10
}
