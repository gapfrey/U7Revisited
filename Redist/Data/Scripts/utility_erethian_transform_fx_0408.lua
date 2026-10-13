--- Best guess: Spawns items and applies sprite effects, likely for transformation visuals tied to Erethian's shape-shifting.
--- Restores Erethian after the temporary rodent or cow transformation created by fn_0697.
function utility_erethian_transform_fx_0408(objectref)
    local var_0000, var_0001, var_0002, var_0003

    var_0000 = get_object_position(objectref)
    var_0001 = find_nearby(objectref, 521, 1, 4)
    var_0002 = find_nearby(objectref, 500, 1, 4)
    local rodent = type(var_0001) == "table" and var_0001[1] or nil
    local cow = type(var_0002) == "table" and var_0002[1] or nil
    -- The temporary proxy identifies which failed spell just ran. Remove it,
    -- restore Erethian's frame, then continue the next dialogue stage.
    if rodent then
        apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 13)
        play_sound_effect(67)
        destroy_object_silent(rodent)
        set_object_frame(objectref, 28)
        var_0003 = add_containerobject_s(objectref, {3, 17447, 8033, 4, 17447, 8044, 5, 17447, 7789})
        npc_erethian_transform_0406(objectref)
        return
    end
    if cow then
        apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 17)
        apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 7)
        play_sound_effect(62)
        destroy_object_silent(cow)
        set_object_frame(objectref, 30)
        var_0003 = add_containerobject_s(objectref, {3, 17447, 8033, 4, 17447, 8048, 5, 17447, 7791})
        npc_erethian_transform_0406(objectref)
        return
    end
end