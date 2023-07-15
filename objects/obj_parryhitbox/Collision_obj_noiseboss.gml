var state = other.state
var hsp = other.hsp
if (((state == (104 << 0) && hsp != 0) || (state == (244 << 0) && other.image_index > 3) || (state == (108 << 0) && (!other.grounded)) || state == (105 << 0) || state == (58 << 0) || state == (171 << 0) || state == (127 << 0)) && (!collisioned))
    event_user(0)
