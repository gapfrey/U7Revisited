--- Best guess: Hides an NPC (290) and adds items to a container, likely for an event or cleanup.
--- Hides Arcadion's mirror portrait (NPC 290) and plays the mirror fade-out:
--- frame 8, sfx 67, then previous frames down to frame 3.
--- The leading 7937 is a continue, so the repeat count 4 is not taken as a start delay.
function utility_hide_npc290_add_items_0835(eventid, objectref)
    local var_0000

    hide_npc(290) --- Guess: Hides NPC
    var_0000 = add_containerobject_s(objectref, {7937, 4, -3, 7947, 4, 17447, 17488, 7937, 67, 8024, 8, 7750})
    return
end