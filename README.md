# RP_AutoNick
Аддон позволяет ставить рандомные имена и фамилии игрокам, у которых ник
Стоит Стимовский(SteamProfile Nick).
Есть белый лист, чтобы аддон не затрагивал их, и не менял ник.

## Все функции:
1. **function RG_AddWhiteListAN(any Player/SteamID64, bool SteamID)** - Добавление игрока в исключение, ник менятся не будет
* Если SteamID true, то any должен быть SteamID64
* Если SteamID false, то any должен быть Player
2. **function RG_DelWhiteListAN(any Player/SteamID64, bool SteamID)** - Удаление игрока из исключения, ник будет менятся
* Если SteamID true, то any должен быть SteamID64
* Если SteamID false, то any должен быть Player
3. **bool function RG_GetWhiteListAN(any Player/SteamID64, bool SteamID)** - Проверка, есть ли у SteamID/Игрока исключение измение ника
* Если SteamID true, то any должен быть SteamID64
* Если SteamID false, то any должен быть Player
4. **bool function RG_SetRandomName(Entity Player, bool Reverse)** - Установка игроку рандомный ник
* Если Reverse true, то ник будет являтся: Имя Фамилия
* Если Reverse false, то ник будет являтся: Фамилия Имя

## Хуки:
1. **hook AutoNick_RolePlay** - Вызывается когда игрок зашел на сервер
