extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	silenceInstrument("drums")
	silenceInstrument("lead")
	silenceInstrument("bass")
	
var zeroVolume = -80
func silenceInstrument(instrument):
	match instrument:
		"drums":
			$hippieDrums.volume_db = zeroVolume
			$rockDrums.volume_db = zeroVolume
			$"8bitDrums".volume_db = zeroVolume
		"bass":
			$hippieChords.volume_db = zeroVolume
			$rockBass.volume_db = zeroVolume
			$"8bitBass".volume_db = zeroVolume
		"lead":
			$hippieLead.volume_db = zeroVolume
			$rockLead.volume_db = zeroVolume
			$"8bitLead".volume_db = zeroVolume
func enableStem(genre,instrument):
	match genre:
		"hippie":
			match instrument:
				"drums":
					silenceInstrument("drums")
					$hippieDrums.volume_db = 0
				"bass":
					silenceInstrument("bass")
					$hippieChords.volume_db = 0
				"lead":
					silenceInstrument("lead")
					$hippieLead.volume_db = 0
		"rock":
			match instrument:
				"drums":
					silenceInstrument("drums")
					$rockDrums.volume_db = 0
				"bass":
					silenceInstrument("bass")
					$rockBass.volume_db = 0
				"lead":
					silenceInstrument("lead")
					$rockLead.volume_db = 0
