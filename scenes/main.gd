extends Node

const heidi_scene = preload("res://scenes/heidi.tscn")
const orph_scene = preload("res://scenes/player.tscn")
var heidi_start
var orph_start

func _ready():
	$HUD.show_message("The Snail wants a sacrifice ")
	$HUD/MessageTimer.start()
	await $HUD/MessageTimer.timeout
	$HUD/ScoreLabel.hide()
	$HUD.show_score()
	heidi_start = $Heidi.position
	orph_start = $Orpheus.position
	print(heidi_start, orph_start)

func _on_campfire_death(character) -> void:
	$HUD.show_message("%s has died" % character)
	if character == "Heidi":
		$HUD.orph_score += 1
	else:
		$HUD.heidi_score += 1
	await $HUD/MessageTimer.timeout
	$HUD/ScoreLabel.hide()
	$HUD.show_score()
	reset_player("orpheus")
	reset_player("heidi")

func reset_player(player):
	if player == "orpheus":
		$Orpheus.global_position = orph_start
	elif player == "heidi":
		$Heidi.global_position = heidi_start
