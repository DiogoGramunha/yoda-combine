lib.callback.register('yoda-combine:Combine', function()
    if Config.UseProgressCircle then
        return exports.ox_lib:progressCircle({
            duration = 2000,
            label = 'Combining..',
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'amb@prop_human_parking_meter@male@base',
                clip = 'base'
            },
        })
    else
        return exports.ox_lib:progressBar({
            duration = 2000,
            label = 'Combining..',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'amb@prop_human_parking_meter@male@base',
                clip = 'base'
            },
        })
    end
end)