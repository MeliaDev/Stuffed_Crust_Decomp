hsp = 0
vsp = 0
grav = 0.5
hsp_carry = 0
vsp_carry = 0
platformid = -4
grounded = 1
image_index = irandom(image_number)
image_speed = 0
with (instance_create(x, y, obj_genericpoofeffect))
    depth = (other.depth - 1)
afterimage = 0
