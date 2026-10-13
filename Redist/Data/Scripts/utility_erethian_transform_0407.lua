--- Best guess: Manages Erethian's failed transformations (rodent, cow) with sound effects and visual effects.
--- Implements the fn_0697 transformation stages for Erethian's gargoyle, dragon, rodent, and cow forms.
function utility_erethian_transform_0407(eventid, objectref)
    local var_0000, var_0001, var_0002, var_0003, var_0004, var_0005, var_0006, var_0007, var_0008, var_0009, var_000A, var_000B, var_000C, var_000D, var_000E

    var_0000 = get_object_position(objectref)
    if get_flag(3) then
        -- With stable ether, replace Erethian first with a gargoyle and then
        -- a dragon. A third callback removes the dragon and restores the mage.
        if not get_flag(811) then
            set_flag(811, true)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2] - 2, var_0000[1] - 2, 13)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2] - 2, var_0000[1] - 2, 7)
            play_sound_effect(67)
            set_object_frame(objectref, 4)
            var_0001 = create_new_object(274)
            set_object_frame(var_0001, 28)
            var_0002 = update_last_created(var_0000)
            var_0003 = add_containerobject_s(objectref, {16, 7719})
            var_0004 = add_containerobject_s(var_0001, {8035, 2, 17447, 8044, 3, 17447, 8045, 4, 17447, 7769})
            npc_erethian_transform_0406(objectref)
        elseif not get_flag(812) then
            set_flag(812, true)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 17)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2] - 2, var_0000[1] - 2, 4)
            play_sound_effect(9)
            var_0001 = find_nearest(objectref, 274, 1)
            if var_0001 then
                remove_item(var_0001)
            end
            var_0005 = create_new_object(504)
            set_object_frame(var_0005, 19)
            var_0002 = update_last_created(var_0000)
            var_0006 = find_nearest(var_0005, 154, 1)
            if var_0006 then
                var_0003 = add_containerobject_s(var_0006, {14, 7719})
                set_schedule_type(29, var_0006)
            end
            var_0007 = add_containerobject_s(var_0005, {8033, 4, 17447, 8044, 5, 17447, 7789})
            clear_item_flag(16, 356)
            var_0008 = get_conversation_target()
            var_0009 = add_containerobject_s(var_0008, {13, 17453, 7724})
            var_000A = add_containerobject_s(356, {1693, 8021, 11, 7719})
            if var_0006 then
                npc_erethian_transform_0406(var_0006)
            end
        else
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 17)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 7)
            play_sound_effect(8)
            var_0006 = find_nearest(objectref, 154, 1)
            remove_item(objectref)
            if var_0006 then
                set_object_frame(var_0006, 28)
                var_0003 = add_containerobject_s(var_0006, {8033, 4, 17447, 8044, 5, 17447, 8045})
                set_schedule_type(29, var_0006)
            end
            clear_item_flag(16, 356)
            var_0008 = get_conversation_target()
            var_0009 = add_containerobject_s(var_0008, {13, 17453, 7724})
            var_000A = add_containerobject_s(356, {1693, 8021, 11, 7719})
        end
    else
        -- With unstable ether, the same spell creates a temporary rodent and
        -- then a cow; fn_0698 handles each proxy's visual restoration.
        if not get_flag(811) then
            set_flag(811, true)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 13)
            play_sound_effect(67)
            set_object_frame(objectref, 4)
            var_000B = create_new_object(521)
            set_object_frame(var_000B, 16)
            var_0002 = update_last_created(var_0000)
            var_0003 = add_containerobject_s(objectref, {7, 7463, "@Squeak!@", 8018, 11, 7719})
            var_000C = add_containerobject_s(var_000B, {8036, 2, 17447, 8034, 1, 17447, 8036, 1, 17447, 8035, 2, 17447, 8036, 1, 17447, 8035, 1, 17447, 8034, 4, 7975, 4, 7769})
            bark(objectref, "@Squeak!@")
            utility_erethian_transform_fx_0408(objectref)
        elseif not get_flag(812) then
            set_flag(812, true)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2], var_0000[1], 17)
            apply_sprite_effect(-1, 0, 0, 0, var_0000[2] - 2, var_0000[1] - 2, 7)
            play_sound_effect(62)
            set_object_frame(objectref, 4)
            var_000D = create_new_object(500)
            set_object_frame(var_000D, 23)
            var_0002 = update_last_created(var_0000)
            var_0003 = add_containerobject_s(objectref, {7, 7463, "@MOO?!@", 8018, 11, 7719})
            var_000E = add_containerobject_s(var_000D, {8040, 1, 17447, 8041, 1, 17447, 8042, 2, 17447, 8041, 2, 17447, 8042, 1, 17447, 8041, 1, 17447, 8040, 4, 7975, 4, 7769})
            bark(objectref, "@MOO?!@")
            utility_erethian_transform_fx_0408(objectref)
        end
    end
end