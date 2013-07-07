class Tests extends GroovyTestCase {

	void test_bountry_attribute_constructor() {
		def attr = new BountyAttribute('name', 100)
		assert attr.name == 'name'
		assert attr.credits == 100
		assert attr.toString() == 'name (100)'
	}

	void test_bounty_amount() {
		def bounty = new Bounty()
		bounty.person = new BountyAttribute("Person", 100)
		bounty.crime = new BountyAttribute('Crime', 200)
		assert bounty.amount == 300
	}
}

class BountyAttribute {

	String name
	Integer credits

	BountyAttribute(name, credits) {
		this.name = name
		this.credits = credits
	}

	String toString() {
		"$name ($credits)"
	}
}

class Bounty {

	static final PERSON = 
	[ 	
					new BountyAttribute('Agent', 500),
					new BountyAttribute('Body Guard', 650),
					new BountyAttribute('Bounty Hunter', 650),
					new BountyAttribute('Fence', 300),
					new BountyAttribute('Gear Head', 300),
					new BountyAttribute('Golem Mech Pilot', 1500),
					new BountyAttribute('Hacker', 1000),
					new BountyAttribute('Smuggler', 500)
	]

	static final CRIME =
	[
					new BountyAttribute('Public nuisance', 100),
					new BountyAttribute('Vehicular manslaught', 3500),
					new BountyAttribute('Theft', 1500),
					new BountyAttribute('Assault', 1750),
					new BountyAttribute('Forgery', 1250),
					new BountyAttribute('Murder', 10000),
					new BountyAttribute('Malicious mischief', 750),
					new BountyAttribute('Sexual assault', 2500),
					new BountyAttribute('Embezzlement', 5000),
					new BountyAttribute('Manslaughter', 3500),
					new BountyAttribute('Assault with a deadly weapon', 2500),
					new BountyAttribute('Hacking', 4000),
					new BountyAttribute('Grand theft', 4000),
					new BountyAttribute('Detonation of an explosive device', 7500),
					new BountyAttribute('Breaking and entering', 1250),
					new BountyAttribute('Destruction of property', 1000),
					new BountyAttribute('Assaulting a security officer', 2500),
					new BountyAttribute('Extreme traffic violation', 500),
					new BountyAttribute('Kindnapping', 3000),
					new BountyAttribute('Extortion', 4000)
	]

	def person = chooseOne(PERSON)
	def crime =  chooseOne(CRIME)

	int getAmount() {
		int amount = person.credits + crime.credits
		return amount
	}

	def chooseOne(attrs) {
		def count = attrs.size()
		def index = new Random().nextInt(count)
		return attrs[index]
	}	

	String toString() {
		def s = """
Bounty
---------------------
Person = $person
Crime  = $crime 

Amount = $amount
		"""
	}
}

def bounty = new Bounty()
println bounty