extends Control

var total = 0.0;
var infected = 0.0;
var combo = 0;
func _enter_tree():
	Globals.set("bubbles_counter", self);
	
func add():
	total += 1;
	get_node("total").set_text("total bubbles: %d" % total);
	updatePercent();
	
func addInfected():
	infected += 1;
	combo += 1;
	get_node("infected").set_text("infected bubbles: %d" % infected);
	get_node("combo").set_text("combo: %dx" % combo);
	updatePercent();

func discardCombo():
	var saver = Globals.get("game_saver");
	saver.savedict.money += combo;
	combo = 0;
	get_node("combo").set_text("combo: %dx" % combo);
	pass;
	
func updatePercent():
	get_node("percent").set_text("%d%%" % (infected/total*100.0));