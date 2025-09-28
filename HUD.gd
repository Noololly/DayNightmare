extends CanvasLayer

@export var heidi_score = 0
@export var orph_score = 0

func show_message(text):
	$ScoreLabel.text = text
	$ScoreLabel.show()
	

func show_win(winner):
	show_message("Player %s won!!" % [winner])
	$WinTimer.start()
	await $WinTimer.timeout
	$ScoreLabel.hide()

func show_score():
	show_message("Heidi: %d Orpheus: %d" % [heidi_score, orph_score])
