
CreateThread(function()
	while true do
		Wait(0)
		local blacklistedKeys = Config.Teclas
		for i = 1, #blacklistedKeys do
			local keyCombo = blacklistedKeys[i][1]
			local keyStr = blacklistedKeys[i][2]
			if #keyCombo == 1 then
				local key1 = keyCombo[1]
				if IsDisabledControlJustReleased(0, key1) then
					TriggerServerEvent('LOGKeys', keyStr)
				end
			elseif #keyCombo == 2 then
				local key1 = keyCombo[1]
				local key2 = keyCombo[2]
				if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) then
					TriggerServerEvent('LOGKeys', keyStr)
					Wait(5000)
				end
			elseif #keyCombo == 3 then
				local key1 = keyCombo[1]
				local key2 = keyCombo[2]
				local key3 = keyCombo[3]
				if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) and
				IsDisabledControlPressed(0, key3) then
					TriggerServerEvent('LOGKeys', keyStr)
					Wait(5000)
				end
			elseif #keyCombo == 4 then
				local key1 = keyCombo[1]
				local key2 = keyCombo[2]
				local key3 = keyCombo[3]
				local key4 = keyCombo[4]
				if IsDisabledControlPressed(0, key1) and IsDisabledControlPressed(0, key2) and
				IsDisabledControlPressed(0, key3) and IsDisabledControlPressed(0, key4) then
					TriggerServerEvent('LOGKeys', keyStr)
					Wait(5000)
				end
			end
		end
	end
end)
