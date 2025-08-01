extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switchDrums("rock")
	switchBass("rock")
	switchLead("hippie")
	
	pass

var bassGenre
var leadGenre
var drumsGenre

func getGenreAmount(genre):
	
	var count = 0
	if bassGenre==genre:
		count+=1
	if leadGenre==genre:
		count+=1
	if drumsGenre==genre:
		count+=1
	return count
	
func clearRecords(instrument):
	match instrument:
		"drums":
			for child in $drums.get_children():
				child.visible = false
		"bass":
			for child in $bass.get_children():
				child.visible = false
		"lead":
			for child in $lead.get_children():
				child.visible = false
		"all":
			clearRecords("drums")
			clearRecords("bass")
			clearRecords("lead")
			
func switchDrums(genre):
	drumsGenre=genre
	clearRecords("drums")
	$MusicManager.enableStem(genre,"drums")
	match genre:
		"rock":
			$drums/rock.visible=true
		"hippie":
			$drums/hippie.visible=true
		"8bit":
			$"drums/8bit".visible=true
		"techno":
			$drums/techno.visible=true
func switchBass(genre):
	bassGenre=genre
	clearRecords("bass")
	$MusicManager.enableStem(genre,"bass")
	for child in $bass.get_children():
		child.visible = false
	match genre:
		"rock":
			$bass/rock.visible=true
		"hippie":
			$bass/hippie.visible=true
		"8bit":
			$bass/"8bit".visible=true
		"techno":
			$bass/techno.visible=true
func switchLead(genre):
	leadGenre=genre
	clearRecords("lead")
	$MusicManager.enableStem(genre,"lead")
	for child in $lead.get_children():
		child.visible = false
	match genre:
		"rock":
			$lead/rock.visible=true
		"hippie":
			$lead/hippie.visible=true
		"8bit":
			$lead/"8bit".visible=true
		"techno":
			$lead/techno.visible=true
