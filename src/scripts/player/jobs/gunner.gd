extends Player

var job : Job
var stats : StatSheet

func _ready():
	job = get_node("Job")
	job.initialize(self)
	
	speed = job.stats.speed
