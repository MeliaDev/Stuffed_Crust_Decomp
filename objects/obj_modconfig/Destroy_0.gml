var options = options_array
var data_arr = ["saves/saveData1.ini", "saves/saveData2.ini", "saves/saveData3.ini"]
for (var i = 0; i < array_length(options); i++)
{
    if (options[i][1] != "c")
    {
        for (var j = 0; j < array_length(data_arr); j++)
        {
            ini_open(data_arr[j])
            ini_write_real("Mod", options[i][1], variable_global_get(options[i][1]))
            ini_close()
        }
    }
}
create_transformation_tip("{s}Options Saved!/")
