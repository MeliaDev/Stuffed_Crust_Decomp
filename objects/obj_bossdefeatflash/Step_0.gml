fadealpha -= 0.005
if (fadealpha == 0)
    instance_destroy()
if instance_exists(obj_noiseboss)
    depth = (obj_noiseboss.depth - 100)
