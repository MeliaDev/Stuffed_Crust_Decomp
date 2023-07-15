instance_destroy()
global.hasfarmer[pos] = 1
other.farmerpos = pos
switch object_index
{
    case obj_farmerpeasanto:
        instance_create_unique(x, y, 337)
        break
    case 74:
        instance_create_unique(x, y, 241)
        break
    case 948:
        instance_create_unique(x, y, 311)
        break
}

