extends RichTextLabel

@export var blabs = ["Hello!", "What a beautiful day!", "I wonder what's on TV?", "I could go for a nap.", "[i]yawn[/i]", "I wonder what's going on outside?"]
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../BlabTextBox".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Blab Rondomizer ######################
	if Input.is_action_just_pressed("Blab"):
		# Randomly Selects Blab Index #########
		index = randi_range(0, 5)
		$"../BlabTextBox".show()
		text = blabs[index]
		$"../BlabTime".start()

# Clears Out Text and Bubble ##########
func _on_blab_time_timeout() -> void:
	text = ""
	$"../BlabTextBox".hide()
