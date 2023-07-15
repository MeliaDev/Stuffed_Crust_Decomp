function scr_random_granny() //scr_random_granny
{
    var count = instance_number(obj_tutorialbook)
    var n = irandom((count - 1))
    var b = -4
    var found = 0
    while (!found)
    {
        with (instance_find(obj_tutorialbook, n))
        {
            if showgranny
            {
                found = 1
                b = id
            }
        }
        n = irandom((count - 1))
    }
    with (obj_tutorialbook)
    {
        if (id != b && showgranny)
            instance_destroy()
    }
}

