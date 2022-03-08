RegisterServerEvent('cmg3_animations:sync')
AddEventHandler('cmg3_animations:sync', function(target, animationLib, animationLib2, animation, animation2, distans, distans2, height, targetSrc, length, spin, controlFlagSrc, controlFlagTarget, animFlagTarget, attachFlag, token)
	local _src = tonumber(source)
	if token ~= 'seguro' then
		return TriggerEvent('Player::LEAVE', _src, 'INJECT ANIMATION')
	end
	TriggerClientEvent('cmg3_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length, spin, controlFlagTarget, animFlagTarget, attachFlag)
	TriggerClientEvent('cmg3_animations:syncMe', source, animationLib, animation, length, controlFlagSrc, animFlagTarget)
end)

RegisterServerEvent('cmg3_animations:stop')
AddEventHandler('cmg3_animations:stop', function(targetSrc, token)
	local _src = tonumber(source)
	if token ~= 'seguro' then
		return TriggerEvent('Player::LEAVE', _src, 'INJECT ANIMATION')
	end
	TriggerClientEvent('cmg3_animations:cl_stop', targetSrc)
end)
