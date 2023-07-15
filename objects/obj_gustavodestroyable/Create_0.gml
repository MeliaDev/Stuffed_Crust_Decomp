hp = 2
depth = 1
noisemode = 0
solidwall = instance_create(x, y, obj_solid)
with (solidwall)
{
    image_xscale = other.image_xscale
    image_yscale = other.image_yscale
    visible = false
}
image_alpha = 1
