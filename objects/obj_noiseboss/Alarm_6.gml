if (image_alpha == 1)
    image_alpha = 0.5
else
    image_alpha = 1
cooldown = 0
if (flickertime > 0)
{
    if (sprite_index == spr_pepperman_ministart)
        touchedground = 1
    if touchedground
        flickertime--
    alarm[6] = 5
}
if (flickertime == 0)
{
    alarm[6] = -1
    image_alpha = 1
}
