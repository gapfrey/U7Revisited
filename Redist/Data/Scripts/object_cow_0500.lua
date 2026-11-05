--- Double-click makes each party member bark "Moo!" once. Event 0 is the cow's own idle bark.
function object_cow_0500(eventid, objectref)
    if eventid == 1 then
        -- One pass. delayed_execute_usecode_array returns 0, and 0 is true in Lua,
        -- so a while-true break on that return never leaves.
        local party = get_party_list2()
        if type(party) == "table" then
            for i = 1, #party do
                local member = get_npc_name(party[i]) or party[i]
                delayed_execute_usecode_array(member, {random2(10, 1), "@Moo!@", {17490, 7715}})
                delayed_execute_usecode_array(member, {random2(30, 21), "@Moo!@", {17490, 7715}})
            end
        end
    elseif eventid == 0 then
        bark(objectref, "@Moo@")
    end
end
