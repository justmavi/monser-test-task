CMD:takemoney(playerid, const params[])
{
	if (!IsPlayerAdmin(playerid)) return 0;

	extract params -> new iMoney; else return SendClientMessage(playerid, -1, !"Введите: /takemoney [сумма]");

	if (iMoney <= 0) {
		return SendClientMessage(playerid, -1, !"Введена неверная сумма");
	}

	aPlayerInfo[playerid][pMoney] += iMoney;
	GivePlayerMoney(playerid, iMoney);

	SendClientMessage(playerid, -1, !"Деньги начислены");

	return 1;
}
