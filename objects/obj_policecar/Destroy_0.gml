var destroyobj = obj_sausageman_dead
if shake
    destroyobj = obj_shakeanddie
dead = instance_create(x, y, destroyobj)
with (dead)
    sprite_index = spr_policecar_dead
with (instance_create(x, y, obj_explosioneffect))
{
    sprite_index = spr_bombexplosion
    depth = (other.dead.depth + 1)
}
if (irandom(100) == 7 || (irandom(100) >= 70 && irandom(100) <= 77))
{
    with (instance_create(x, y, destroyobj))
    {
        sprite_index = spr_hamkuff_stun
        depth = (other.dead.depth - 1)
    }
}
fmod_event_one_shot_3d("event:/sfx/misc/explosion", x, y)
with (obj_policebooth)
{
    released = 0
    updatepos = 1
}
ds_queue_destroy(followqueue)
if (gotcha > 0)
{
    with (obj_player)
    {
        visible = true
        state = (0 << 0)
        cutscene = 0
    }
}
