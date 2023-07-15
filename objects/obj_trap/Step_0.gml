with (obj_trapghost)
{
    if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold && (state == (0 << 0) || trapid == noone || ((point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y) || (other.object_index == obj_anchortrap && state == (0 << 0) && trapid.object_index == obj_anchortrap)) && trapid.object_index != obj_tvtrap)))
    {
        state = (8 << 0)
        trapid = other.id
        fmod_event_instance_play(snd_move)
    }
}
