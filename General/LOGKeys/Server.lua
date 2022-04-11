license,steamid,liveid,xbl,ipP,discord = '','','','','',''

GetLicensesPlayer = function(src)
	local license,steamid,liveid,xbl,ipP,discord = '','','','','',''
	for _,v in pairs(GetPlayerIdentifiers(src)) do
		if string.sub(v, 1, string.len('license:')) == 'license:' then
			license = v
		elseif string.sub(v, 1, string.len('steam:')) == 'steam:' then
			steamid = v
		elseif string.sub(v, 1, string.len('live:')) == 'live:' then
			liveid = v
		elseif string.sub(v, 1, string.len('xbl:')) == 'xbl:' then
			xbl = v
		elseif string.sub(v, 1, string.len('ip:')) == 'ip:' then
			ipP = v
		elseif string.sub(v, 1, string.len('discord:')) == 'discord:' then
			discord = v
		end
	end
	return license,steamid,liveid,xbl,ipP,discord
end

SendTODiscord = function(link, mensagem)
	local embeds = {{
		['type'] = 'rich',
		['description'] = mensagem,
		['color'] = 9807270,
		['thumbnail'] = { ['url'] = Config.LINKLogo },
		['footer'] = {
			['text'] = os.date('%d/%m/%Y - %H:%M'),
		},
	}}
	PerformHttpRequest(link, function(status) end, 'POST', json.encode({ username = 'LOG Teclas', avatar_url = imgPNG, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('LOGKeys', function(keyStr)
	local _src = tonumber(source)
	local license,steamid,liveid,xbl,ipP,discord = GetLicensesPlayer(_src)
	local nomeJogador = GetPlayerName(_src)
	local idJogador = _src
	SendTODiscord(Config.Webhook, '**UM JOGADOR PRESSIONOU UMA TECLA**\n\n**TECLA PRESSIONADA**: '..keyStr..'\n\n**NOME**: '..nomeJogador..'\n**ID**: '..idJogador..'\n\n**IDENTIFICADORES**: ```'..steamid..'\n'..license..'\n'..ipP..'\n'..xbl..'\n'..discord..'\n'..liveid..'```')
end)
