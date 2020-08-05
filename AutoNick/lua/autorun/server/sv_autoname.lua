print("[ RP ][ AutoNick ] Запуск аддона!")

local TName 	= {"Алан","Александр","Алексей","Альберт","Анатолий","Андрей","Антон","Арсен","Арсений","Артем","Артемий","Артур","Богдан","Борис","Вадим","Валентин","Валерий","Василий","Виктор","Виталий","Владимир","Владислав","Всеволод","Вячеслав","Геннадий","Георгий","Герман","Глеб","Гордей","Григорий","Давид","Дамир","Даниил","Демид","Демьян","Денис","Дмитрий","Евгений","Егор","Елисей","Захар","Иван","Игнат","Игорь","Илья","Ильяс","Камиль","Карим","Кирилл","Клим","Константин","Лев","Леонид","Макар","Максим","Марат","Марк","Марсель","Матвей","Мирон","Мирослав","Михаил","Назар","Никита","Николай","Олег","Павел","Петр","Платон","Прохор","Рамиль","Ратмир","Ринат","Роберт","Родион","Роман","Ростислав","Руслан","Рустам","Савва","Савелий","Святослав","Семен","Сергей","Станислав","Степан","Тамерлан","Тимофей","Тимур","Тихон","Федор","Филипп","Шамиль","Эдуард","Эльдар","Эмиль","Эрик","Юрий","Ян","Ярослав"}
local TSName 	= {"Смирнов","Иванов","Кузнецов","Соколов","Попов","Лебедев","Козлов","Новиков","Морозов","Петров","Волков","Соловьёв","Васильев","Зайцев","Павлов","Семёнов","Голубев","Виноградов","Богданов","Воробьёв","Фёдоров","Михайлов","Беляев","Тарасов","Белов","Иванов","Смирнов","Кузнецов","Попов","Васильев","Петров","Соколов","Михайлов","Новиков","Фёдоров","Морозов","Волков","Алексеев","Лебедев","Семёнов","Егоров","Павлов","Козлов","Степанов","Николаев","Орлов","Андреев","Макаров","Никитин","Захаров","Серов"}

// TName 	- Имена
// TSName 	- Фамилии

if not (file.Exists("rp", "DATA")) then file.CreateDir("rp") print("[ RP ][ AutoNick ] Каталог: [ data/rp/ ] создан!") end

hook.Add("PlayerInitialSpawn", "AutoNick_RolePlay", function(Player)
	timer.Simple(5, function()
		if (Player:SteamName() == Player:Nick()) then
			RG_SetRandomName(Player, true)
		end
	end)
end)

function RG_GetWhiteListAN(Any, bSteamID64)
	if (bSteamID64) then
		return file.Exists("rp/"..Any, "DATA")
	else
		return file.Exists("rp/"..Any:SteamID64(), "DATA")
	end
end

function RG_AddWhiteListAN(Any, bSteamID64)
	if (bSteamID64) then
		file.Write("rp/"..Any..".dat")
	else
		file.Write("rp/"..Any:SteamID64()..".dat")
	end
end

function RG_DelWhiteListAN(Any, bSteamID64)
	if (bSteamID64) then
		file.Delete("rp/"..Any..".dat")
	else
		file.Delete("rp/"..Any:SteamID64()..".dat")
	end
end

function RG_SetRandomName(Player, Reverse)
	if not (RG_GetWhiteListAN) then
		if (Reverse) then
			DarkRP.storeRPName(Player, TName[math.random(1,#TName)].." "..TSName[math.random(1, #TSName)])
			Player:setDarkRPVar("rpname", TName[math.random(1,#TName)].." "..TSName[math.random(1, #TSName)])
		else
			DarkRP.storeRPName(Player, TSName[math.random(1, #TSName)].." "..TName[math.random(1,#TName)])
			Player:setDarkRPVar("rpname", TSName[math.random(1, #TSName)].." "..TName[math.random(1,#TName)])
		end
	end
end

print("[ RP ][ AutoNick ] Запуск аддона прошел успешно!")
