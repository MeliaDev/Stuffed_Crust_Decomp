image_alpha = Approach(image_alpha, 1, 0.1)
switch state
{
    case 0:
        var _found = 0
        for (var i = 0; i < array_length(hats_arr); i++)
        {
            if (hats_arr[i][0] <= 25)
                hats_arr[i][0] += grav
            hats_arr[i][1] += hats_arr[i][0]
            if (hats_arr[i][1] >= 0)
                hats_arr[i][1] = 0
            else
                _found = 1
        }
        if (!_found)
        {
            state++
            rank_scale = 2
        }
        break
    case 1:
        rank_scale = Approach(rank_scale, 1, 0.1)
        break
}

