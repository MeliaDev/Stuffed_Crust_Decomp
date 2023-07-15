if (player < obj_bossdoor)
{
    if (start == 1)
    {
        if (other.state != (297 << 0) && other.state != (84 << 0) && other.state != (61 << 0) && other.state != (137 << 0) && other.state != (186 << 0))
        {
            with (obj_camera)
                smoothcam = 1
            fmod_event_one_shot_3d("event:/sfx/misc/teleporterstart", x, y)
            player = other.id
            player.visible = false
            storedstate = player.state
            player.tauntstoredstate = player.state
            storedmovespeed = player.movespeed
            storedgrav = player.grav
            storedimageindex = player.image_index
            storedspriteindex = player.sprite_index
            storedfreefallsmash = player.freefallsmash
            repeat (8)
                create_particle((x + random_range(50, -50)), (y + random_range(50, -50)), (11 << 0), 0)
            alarm[0] = 25
            player.hsp = 0
            player.vsp = 0
            player.movespeed = 0
            player.grav = 0
            player.alarm[8] = 100
            player.alarm[7] = 50
            player.alarm[5] = 2
            player.hurted = 1
            player.state = (297 << 0)
            with (instance_create(player.x, player.y, obj_parryeffect))
                sprite_index = spr_peppinoteleporteffect
        }
    }
}
