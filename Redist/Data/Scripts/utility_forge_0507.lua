--- Best guess: Handles item interactions based on event IDs 2 or 3, triggering external calls and flag-based actions, likely related to a forge or quest trigger.
function utility_forge_0507(eventid, objectref)
    local var_0000

    -- Temporary visible feedback until U7R implements the original screen shake.
    console_log("the earth trembles beneath your feet")

    -- Event 3 is the quality-100 Forge egg: always shake once, then retain the
    -- original ten-percent repeat chance until the quest reaches flag 780.
    if eventid == 3 then
        if get_object_quality(objectref) == 100 then
            if not get_flag(767) then
                set_flag(767, true)
                var_0000 = execute_usecode_array(objectref, {1786, 8021, 20, 17447, 17452, 7715})
                utility_earthquake_0989()
            elseif not get_flag(780) then
                if get_random(100) <= 10 then
                    utility_earthquake_0989()
                end
            end
        end
    elseif eventid == 2 then
        -- Event 2 is the explicit Avatar-centered earthquake path.
        var_0000 = execute_usecode_array(get_npc_name(356), {1786, 8021, 20, 17447, 17452, 7715})
        utility_earthquake_0989()
    end
    return
end