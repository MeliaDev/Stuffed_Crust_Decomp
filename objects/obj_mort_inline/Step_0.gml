with (obj_player)
{
    if ((object_index != obj_player2 || global.coop) && state != (146 << 0) && (!instance_exists(obj_dialogcontroller)))
    {
        if ((other.dir > 0 && x > (other.x - 50)) || (other.dir < 0 && x < (other.x + 50)))
        {
            with (other)
            {
                scr_hurtplayer(other)
                waitforhurt = 1
            }
        }
    }
}
if (waitforhurt && (!instance_exists(obj_dialogcontroller)))
{
    var b = 0
    with (obj_player)
    {
        if (state == (107 << 0))
            b = 1
    }
    if (!b)
    {
        waitforhurt = 0
        dialog[0] = dialog_create("Becaw!")
        dialog[1] = dialog_create("You gotta wait in line sir.")
        do_dialog(dialog)
        dialog = -4
        warned = 1
    }
}
