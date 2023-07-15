if (activated && fade != -1)
{
    if (fade < 1)
    {
        fade += 0.025
        for (var i = 0; i < ds_list_size(deactivatedlist); i++)
        {
            var b = ds_list_find_value(deactivatedlist, i)
            with (b)
            {
                if (other.fade < 1)
                    image_alpha = other.fade
                else
                    image_alpha = 1
            }
        }
        if (fade == 1)
        {
            ds_list_clear(deactivatedlist)
            fade = -1
        }
    }
}
