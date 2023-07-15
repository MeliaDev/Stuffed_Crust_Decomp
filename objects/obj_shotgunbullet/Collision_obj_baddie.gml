with (other)
{
    if (visible && object_index != obj_onewaybigblock && object_index != obj_ghostknight && object_index != obj_pizzaball && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_vigilanteboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepgianthead && object_index != obj_pf_fakepepgianthead && underground == 0 && killprotection == 0)
    {
        elitehit = 0
        instance_destroy()
    }
}
