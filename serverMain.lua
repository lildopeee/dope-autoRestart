ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(700)--6000*750
         local utcTime = os.date('%X')
        if utcTime == RestartTimes.Times1 then

            print('^5[ lil.dopeee Otomatik Restart Sistemi ] ^3Sunucu Yeniden Baslatilacaktir. \nIslemi Paslamak Icin Konsola "^0 stop dope-autoRestart" ^3Yazin.')
            Citizen.Wait(10000)
            restartServer ()

        elseif utcTime == RestartTimes.Times2 then

            print('^5[ lil.dopeee Otomatik Restart Sistemi ] ^3Sunucu Yeniden Baslatilacaktir. \nIslemi Paslamak Icin Konsola "^0 stop dope-autoRestart" ^3Yazin.')
            Citizen.Wait(10000)
            restartServer ()

        elseif utcTime == RestartTimes.Times3 then

            print('^5[ lil.dopeee Otomatik Restart Sistemi ] ^3Sunucu Yeniden Baslatilacaktir. \nIslemi Paslamak Icin Konsola "^0 stop dope-autoRestart" ^3Yazin.')
            Citizen.Wait(10000)
            restartServer ()

        elseif utcTime == RestartTimes.Times4 then

            print('^5[ lil.dopeee Otomatik Restart Sistemi ] ^3Sunucu Yeniden Baslatilacaktir. \nIslemi Paslamak Icin Konsola "^0 stop dope-autoRestart" ^3Yazin.')
            Citizen.Wait(10000)
            sendDiscordAnnouncment("https://discordapp.com/api/webhooks/xyz", "lil.dopeee", "Sunucu Yeniden Başlatılıyor", 65518)
            Citizen.Wait(1000)
            restartServer ()

        end
    end
end)

function restartServer ()
    kickAllPlayers()
    Citizen.Wait(1000)
    io.popen(Dope.RestartApplication)
    Citizen.Wait(100)
    os.exit()
end


function kickAllPlayers ()
     local xPlayers = ESX.GetPlayers()
     for i=1, #xPlayers, 1 do
         local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         xPlayer.kick("🌙 lil.dopeee : Sunucu Yeniden Başlatılıyor. Lütfen Kısa Süre İçerisinde Tekrar Giriş Yapın.")
    end
end

function sendDiscordAnnouncment (canal, name, message, color)
    local DiscordWebHook = canal
    local embeds = {
        {
            ["title"]= "*lil.dopeee - Otomatik Restart Sistemi*",
            ["type"]= "rich",
            ["color"] = color,
            ["description"]= message,
            ["footer"]= {
            ["text"]= "📢 Sunucu Yeniden Başlatılıyor. Kısa Bir Süre İçerisinde Aktif Olacaktır.\n\n upV Gururla Sunar",
            ["icon_url"]= "https://forum.fivem.net/uploads/default/original/3X/f/3/f39849c511fa123c3346b7afef26971f1f8a740d.png",
           },
        }
    }
    
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(Dope.DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end