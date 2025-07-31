extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switchDrums("rock")
	switchBass("hippie")
	switchLead("hippie")
	
	pass
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("one"):
		switchLead("hippie")
	if Input.is_action_just_pressed("two"):
		switchLead("rock")


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
	clearRecords("drums")
	$MusicManager.enableStem(genre,"drums")
	match genre:
		"rock":
			$drums/rock.visible=true
		"hippie":
			$drums/hippie.visible=true
func switchBass(genre):
	clearRecords("bass")
	$MusicManager.enableStem(genre,"bass")
	for child in $bass.get_children():
		child.visible = false
	match genre:
		"rock":
			$bass/rock.visible=true
		"hippie":
			$bass/hippie.visible=true
func switchLead(genre):
	clearRecords("lead")
	$MusicManager.enableStem(genre,"lead")
	for child in $lead.get_children():
		child.visible = false
	match genre:
		"rock":
			$lead/rock.visible=true
		"hippie":
			$lead/hippie.visible=true
