extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -10)
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
			$technoDrums.volume_db = zeroVolume
		"bass":
			$hippieChords.volume_db = zeroVolume
			$rockBass.volume_db = zeroVolume
			$"8bitBass".volume_db = zeroVolume
			$technoBass.volume_db = zeroVolume
		"lead":
			$hippieLead.volume_db = zeroVolume
			$rockLead.volume_db = zeroVolume
			$"8bitLead".volume_db = zeroVolume
			$technoLead.volume_db = zeroVolume
func enableStem(genre,instrument):
	silenceInstrument(instrument)
	match genre:
		"hippie":
			match instrument:
				"drums":
					$hippieDrums.volume_db = 0
				"bass":
					$hippieChords.volume_db = 0
				"lead":
					$hippieLead.volume_db = 0
		"rock":
			match instrument:
				"drums":
					$rockDrums.volume_db = 0
				"bass":
					$rockBass.volume_db = 0
				"lead":
					$rockLead.volume_db = 0
		"8bit":
			match instrument:
				"drums":
					$"8bitDrums".volume_db = 0
				"bass":
					$"8bitBass".volume_db = 10
				"lead":
					$"8bitLead".volume_db = 0
		"techno":
			match instrument:
				"drums":
					$technoDrums.volume_db=0
				"bass":
					$technoBass.volume_db=0
				"lead":
					$technoLead.volume_db=0
					
