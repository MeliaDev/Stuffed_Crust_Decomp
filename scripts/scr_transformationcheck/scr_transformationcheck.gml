function scr_transformationcheck() //scr_transformationcheck
{
    if (state != (146 << 0) && state != (150 << 0))
    {
        for (var i = 0; i < array_length(transformation); i++)
        {
            if (state == transformation[i])
                return 0;
        }
    }
    return 1;
}

