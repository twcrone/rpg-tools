enum Contractor {
	AI, CONGLOM, FIXER, FRIEND, FAMILY, GANG, GOVERNMENT, HAPPENSTANCE, 	MEDIA_CELEBRITY, NGO, REBEL, RUMOR, NEWS, TYCOON
}

enum Mission {
	ESCAPE, SURVIVE, FIND_SOMETHING, HARM_SOMETHING, KILL_SOMETHING, CAPTURE_SOMETHING, MANAGE_OPERATION, PREVENT_SOMETHING, PROTECT_SOMETHING, PROTECT_SOMEONE, RECON, SURVEILLANCE, RESCUE_SOMETHING, SOLVE_MYSTERY, STEAL_SOMETHING, DESTROY_SOMETHING, TRANSPORT_SOMETHING
}

enum Location {
	DESERT, WASTELAND, FARMING_REGION, FREE_ZONE, ISLAND, MANSION, RESORT, MILITARY_BASE, NATURE_PRESERVE, OCEAN, POLAR_REGION, SPACE, SWAMP, FLOODED_REGION, UNDERGROUND, AIRPORT, RAIL_HUB, AMUSEMENT_PARK, ARCOLOGY, CONSTRUCTION_SITE, CORPORATE_HEADQUARTERS, GANG_TERRITORY, HOME, HOUSING_PROJECT, INDUSTRIAL_PLANT, MEGAMALL, POLICE_STATION, JAIL, UNIVERSITY, RESEARCH_LAB
}

enum Macguffin {
	CREDITS, DATA, ENDANGERED_SPECIES, EVIDENCE, KEY, LAND, MEDICINE, PERSON, POSSESSION, SECRET, TECHNOLOGY, TREASURE
}

enum Innocent {
	ACTIVIST, AI, UPLOAD, CHILD, CLONE, SIMULACRUM, DOCTOR, FAMILY, FRIEND, MEDIA_PERSON, POLITICIAN, JUDGE, REFUGEE, SCAVENGER, SCIENTIST, WITNESS
}

enum Antagonist {
	BOUNTY_HUNTER, DETECTIVE, CON_MAN, IMPOSTER, CORPORATE_EXECUTIVE, TYCOON, CORRUPT_BUREAUCRAT, POLITICIAN, CRIME_LORD, HACKER, MEDIA_PERSONALITY, MILITARY_OFFICER, MERCENARY, PRIEST, CULT_LEADER, REBEL, TERRORIST_GROUP, ROGUE_AI, UPLOAD, SPY
}

enum Complication {
	ALLY_WITH_ENEMY, BETRAYED_BY_CONTRACTOR, DISASTER, DIVERSION, DODGY_ALLY, FALSE_FLAG, NEW_TECHNOLOGY, OLD_ENEMY, OLD_FRIEND, THIRD_FORCE, TIME_LIMIT, TRAP
}

enum Conflict {
	DESTRUCTTION, ECONOMIC_HARM, ENVIRONMENTAL_DAMAGE, FAMILY, FRIEND, HONOR, INNOCENTS, JUSTICE, LOYALTY, REPUTATION, TRUTH, WEALTH
}

/*
def complications = list(Complication)
def conflicts = list(Conflict)
*/

def randomizeMultiple(things, count) {
	def multiple = []
	count.times { multiple << randomize(things) }
	return multiple
}

class Adventure {
	static final CONTRACTORS = list(Contractor)
	static final MISSIONS = list(Mission)
	static final LOCATIONS = list(Location)
	static final MACGUFFINS = list(Macguffin)
	static final INNOCENTS = list(Innocent)
	static final ANTANGONISTS = list(Antagonist)
	static final COMPLICATIONS = list(Complication)
	static final CONFLICTS = list(Conflict)

	def contractor = randomize(CONTRACTORS)
	def mission = randomize(MISSIONS)
 	def subMission
	def realMission
	def locations
	def macguffin = randomize(MACGUFFINS)
	def innocent = randomize(INNOCENTS)
	def antagonist = randomize(ANTANGONISTS)
	def henchmen
	def complications
	def conflicts

	Adventure() {
		randomizeMissions()
		randomizeLocations()
		randomizeHenchmen()
		randomizeComplications()
		randomizeConflicts()
	}

	def randomizeMissions() {
		def roll = roll(100)
		if(roll <= 10) {
			realMission = randomize(MISSIONS)
		}
		if(roll <= 25) {
			subMission = randomize(MISSIONS)
		}
	}

	def randomizeLocations() {
		def roll = roll(100)
		def count = 1
		
		if(roll <= 10) { count++ }
		if(roll <= 25) { count++ }
		if(roll <= 50) { count++ }
		if(roll <= 75) { count++ }

		this.locations = []
		
		count.times { i ->
			this.locations << randomize(LOCATIONS)	
		}
	}

	def randomizeHenchmen() {
		def roll = roll(100)
		def count = 1
		
		if(roll <= 25) { count++ }
		if(roll <= 50) { count++ }
		if(roll <= 75) { count++ }

		this.henchmen = []
		
		count.times { i ->
			this.henchmen << randomize(ANTANGONISTS)	
		}
	}


	def randomizeComplications() {
		def roll = roll(100)
		def count = 0
		
		if(roll <= 25) { count++ }
		if(roll <= 50) { count++ }
		if(roll <= 75) { count++ }

		this.complications = []
		
		count.times { i ->
			this.complications << randomize(COMPLICATIONS)	
		}
	}

	def randomizeConflicts() {
		def roll = roll(100)
		def count = 0
		
		if(roll <= 10) { count++ }
		if(roll <= 25) { count++ }

		this.conflicts = []
		
		count.times { i ->
			this.conflicts << randomize(CONFLICTS)	
		}
	}

	def roll(sides) {
		def random = new Random()
		return random.nextInt(sides) + 1
	}

	def randomize(things) {
		def count = things.size()
		def random = new Random()
		def index = random.nextInt(count)
		return things[index]
	}

	static def list(thing) {
		def list = []
		thing.values().each {
			list << it
		}
		return list
	}

	static def convertToBlankOrAddLabelAndNewLine(label, value) {
		if(value) {
			return "$label =  $value \n"
		}
		else {
			return ''
		}
	}

	String toString() {
		def s = """Adventure
-------------------------------------------------
Contractor                     =  ${this.contractor}
Mission                        =  ${this.mission}
"""
		s += convertToBlankOrAddLabelAndNewLine('Sub-Mission                   ', this.subMission)
		s += convertToBlankOrAddLabelAndNewLine('Real Mission                  ', this.realMission)
		s += '\n'

		this.locations.eachWithIndex { location, index ->
			s += "Location#${index + 1}                     =  ${location}\n"
		}

		s += """
Macguffin                      =  ${this.macguffin}
Innocent                       =  ${this.innocent}

Antagonist                     =  ${this.antagonist}
"""

		this.henchmen.eachWithIndex { henchman, index ->
			s += "Henchman#${index + 1}                     =  ${henchman}\n"
		}

		s += '\n'

		this.complications.eachWithIndex { complication, index ->
			s += "Complication#${index + 1}                 =  ${complication}\n"
		}

		if(this.complications) {
			s += '\n'
		}

		this.conflicts.eachWithIndex { conflict, index ->
			s += "Conflict#${index + 1}                     =  ${conflict}\n"
		}



		return s
	}
}

def adventure = new Adventure()
println adventure