RegisterNetEvent('yoda-combine:Combine')
AddEventHandler('yoda-combine:Combine', function(data)
    local dict, clip, duration = 'amb@prop_human_parking_meter@male@base', 'base', 2000

    if data and type(data) == "table" then
        dict = data?.dict or dict
        clip = data?.clip or clip
        duration = data?.duration or duration
    end

    local completed = false
    if Config.UseProgressCircle then
        completed = exports.ox_lib:progressCircle({
            duration = duration,
            label = Config.ProgressText,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = dict,
                clip = clip
            },
        })
    else
        completed = exports.ox_lib:progressBar({
            duration = duration,
            label = Config.ProgressText,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = dict,
                clip = clip
            },
        })
    end
    TriggerServerEvent('yoda-combine:FinishedCombine', completed)
end)