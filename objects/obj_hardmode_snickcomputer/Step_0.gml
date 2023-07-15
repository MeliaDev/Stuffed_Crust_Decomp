showtext = place_meeting(x, y, obj_player)
if instance_exists(obj_transfotip)
    showtext = 0
if showtext
    alpha = Approach(alpha, 1, 0.1)
else
    alpha = Approach(alpha, 0, 0.1)
if global.panic
    instance_destroy()
if active
{
    if (distance_to_object(obj_player1) < 75 && obj_player1.y <= (y + sprite_height) && obj_player1.y >= y)
    {
        if (sprite_index != spr_snickchallengecomputer)
        {
            fmod_event_one_shot_3d("event:/sfx/ui/tvswitch", x, y)
            sprite_index = spr_snickchallengecomputer
        }
        image_speed = 0
        if (global.hardmode == 1)
            image_index = 0
        else
            image_index = 1
    }
    else
    {
        sprite_index = spr_snickchallengecomputer_static
        image_speed = 0.25
    }
}
