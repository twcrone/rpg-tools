class Tests extends GroovyTestCase {

	void testSomething() {
		def attr = new BountyAttribute('name', 100)
		assert attr.name == 'name'
		assert attr.credits == 100
		assert attr.toString() == 'name (100)'
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