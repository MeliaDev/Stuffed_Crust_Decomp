instance_destroy()
var follower = instance_create(x, y, obj_deliveryfollower)
instance_destroy(obj_clock, false)
with (instance_create_unique(x, y, 1030))
{
    objectID = follower.id
    timedgate = 0
}
