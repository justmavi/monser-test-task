stock GetTransferRestriction(money)
{
	if (money < 10_000) {
		return MONEY_TRANSFER_NO_DELAY;
	}
	else if (money >= 60_000) {
		return MONEY_TRANSFER_MAX_DELAY;
	}
	else {
		return (money / MONEY_TRANSFER_SEPARATOR) * MONEY_TRANSFER_MULTIPLIER;
	}
}
