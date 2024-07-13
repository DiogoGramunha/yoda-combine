RegisterNetEvent('yoda-combine:Combine')
AddEventHandler('yoda-combine:Combine', function()
    if Config.UseProgressCircle then
        exports.ox_lib:progressCircle({
            duration = 2000,
            label = 'Combining..',
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = 'amb@prop_human_parking_meter@male@base',
                clip = 'base'
            },
        })
    else
        exports.ox_lib:progressBar({
            duration = 2000,
            label = 'Combining..',
            useWhileDead = false,
            canCancel = false,
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
