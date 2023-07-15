y += (vsp * (-yscale))
x += hsp
hsp = Approach(hsp, 0, 0.1)
vsp -= 0.5
if fade
{
    image_alpha = Approach(image_alpha, 0, 0.05)
    if (image_alpha <= 0)
        instance_destroy()
}
