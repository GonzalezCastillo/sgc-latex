all:
	@latex >/dev/null classes.ins
	@sh write_date.sh
	@rm *.log

debug:
	@latex classes.ins
	@sh write_date.sh
