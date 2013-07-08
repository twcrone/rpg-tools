def rollNoAce(sides) {
	def roll = new Random().nextInt(sides) + 1
	return roll
}

def roll(sides) {
	def roll = rollNoAce(sides)
	print "d$sides $roll" 
	def total = roll
	while(roll == sides) {
		roll = rollNoAce(sides)
		print ",$roll"
		total += roll
	}
	println " = $total"
	return total
}

if(args.size() == 0) {
	println "Usage: groovy rollSavageDice.groovy [4|6|8|10|12|20] ..."
	System.exit(1)
}

def dice = args
def rolls = [:]
dice.each {
	def total = roll(Integer.parseInt(it))
	rolls[it] = total	
}

println 'Done.'