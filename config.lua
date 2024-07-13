Config = {

    UseProgressCircle = true,

    Combinations = {

    --[[ --------------- Template ----------------------

        ['itemname'] = {
            needs = 'the other itemname',
            result = {
                {name = 'the result', amount = 1},  -- First Item Created
                {name = 'other result', amount = 5},-- Second created Item (Optionnal)
            },
            -- parameters are optionnal, if not set the default will apply
            parameters = {
                time = 2000, -- In milliseconds
                anim = {
                    dict = "amb@prop_human_parking_meter@male@base",
                    clip = "main"
                }
            }
            removeItemA = true, -- Remove the first Item (here: "itemname")
            removeItemB = true, -- Remove the second Item (here: "the other itemname")
        },

    ]] -------------------------------------------------
    }
}