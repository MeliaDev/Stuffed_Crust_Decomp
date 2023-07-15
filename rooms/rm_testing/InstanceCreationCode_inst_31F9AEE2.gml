dialog[0] = dialog_create("This is a test for dialog", 3369)
dialog[1] = dialog_create("This is a really long text to test out how well it separates the text in chunks for it to be readable", 3369, function() //anon_gml_RoomCC_rm_testing_21_Create_224_gml_RoomCC_rm_testing_21_Create
{
    dialog = -4
    dialog[0] = dialog_create("This is a test for new conversation after the end of one")
}
)
