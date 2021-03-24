#include <a_samp>

#include "monser_test_sources\libs\timerfix.inc"
#include "monser_test_sources\libs\sscanf2.inc"
#include "monser_test_sources\libs\Pawn.CMD.inc"

#if defined MAX_PLAYERS
	#undef MAX_PLAYERS
#endif
#define 	MAX_PLAYERS (10)

#if defined MAX_PLAYER_NAME
	#undef MAX_PLAYER_NAME
#endif
#define MAX_PLAYER_NAME (20)

#define		INVALID_TIMER_ID			(0xFFFF)

#define 	MONEY_TRANSFER_NO_DELAY		(0)
#define 	MONEY_TRANSFER_MAX_DELAY	(180)

#define 	func%1(%2)	forward%1(%2);public%1(%2)

enum e_PLAYER_INFO 
{
	pName[MAX_PLAYER_NAME + 1],
	pMoney,
	pMoneyTimer,
	pLastMoneyTransferRestriction,
	pSeansTransferedMoney,
}
new aPlayerInfo[MAX_PLAYERS][e_PLAYER_INFO];

static const e_PLAYER_INFO__INIT [e_PLAYER_INFO] =
{
	EOS,
	0,
	INVALID_TIMER_ID,
	0,
	0
};

main() { }

#include "monser_test_sources\commands\commands.hxx"
#include "monser_test_sources\functions\functions.hxx"

public OnPlayerConnect(playerid) 
{
	aPlayerInfo[playerid] = e_PLAYER_INFO__INIT;
	GetPlayerName(playerid, aPlayerInfo[playerid][pName], MAX_PLAYER_NAME + 1);

	return 1;
}

func OnPlayerMoneyTimerElapsed(playerid) 
{
	aPlayerInfo[playerid][pLastMoneyTransferRestriction] = 
	aPlayerInfo[playerid][pSeansTransferedMoney] = 0;

	aPlayerInfo[playerid][pMoneyTimer] = INVALID_TIMER_ID;
}