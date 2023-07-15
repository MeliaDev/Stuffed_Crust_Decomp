with (other)
{
    if (gotcha == 0)
    {
        shake = 1
        instance_destroy()
    }
}
if global.panic
{
    with (obj_hamkuff)
        instance_destroy()
}
