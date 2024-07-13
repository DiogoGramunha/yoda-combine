lib.callback.register('yoda-combine:Combine', function(data)
    local dict, clip, duration = 'amb@prop_human_parking_meter@male@base', 'base', 2000

    if data and type(data) == "table" then
        dict = data?.dict or dict
        clip = data?.clip or clip
        duration = data?.duration or duration
    end

    if Config.UseProgressCircle then
        return exports.ox_lib:progressCircle({
            duration = duration,
            label = 'Combining..',
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
        return exports.ox_lib:progressBar({
            duration = duration,
            label = 'Combining..',
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
end)