event_inherited()
switch object_index
{
    case obj_pizzakincheese:
        if (!global.cheesefollow)
            instance_destroy()
        break
    case 759:
        if (!global.tomatofollow)
            instance_destroy()
        break
    case 761:
        if (!global.pineapplefollow)
            instance_destroy()
        break
    case 757:
        if (!global.shroomfollow)
            instance_destroy()
        break
    case 760:
        if (!global.sausagefollow)
            instance_destroy()
        break
}

