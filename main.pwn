#include <a_samp>

#include "../monser_test_sources/Pawn.CMD.inc"
#include "../monser_test_sources/sscanf2.inc"
#include "../monser_test_sources/timerfix.inc"

#define		INVALID_TIMER_ID	(0xFFFF)

enum e_PLAYER_INFO 
{
	pMoney,
	pMoneyTimer
}
new aPlayerInfo[MAX_PLAYERS][E_PLAYER_INFO];

static const e_PLAYER_INFO__INIT [e_PLAYER_INFO] =
{
	0,
	INVALID_TIMER_ID
};

main() { }

public OnGameModeInit() 
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		ePlayerInfo[i] = e_PLAYER_INFO__INIT;
	}
}
