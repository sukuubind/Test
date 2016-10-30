public  class CargoOnlyPilot extends Pilot {
	// As this class is exending Pilot it must use the abstract method canAccept from the base class and write its own body
override
public boolean canAccept(Flight f){
	return true;
}
}