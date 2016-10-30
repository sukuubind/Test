public class CargoFlight extends Flight{
	// Define variables
	Decimal maxCargoSpace = 1000.00;
	Decimal  usedCargoSpace =0;

	public void add1Package(Decimal h, Decimal w, Decimal d)
	{
		double size = h*w*d;
		if(hasCargoSpace(size)){

			usedCargoSpace += size;
			System.debug('Package of the size ' + size + 'added');
		}
			else
			handleNoSpace();


	}

	private boolean hasCargoSpace (Decimal size)
	{
		return usedCargoSpace + size <= maxCargoSpace;
	}

	private void handleNoSpace()
	{
		System.debug('Not Enough Space - Maxed Out');
	}

	public void reducePackage(Decimal h, Decimal w, Decimal d)
	{

		double size = h*w*d;

		if(size <= usedCargoSpace){
			usedCargoSpace -= size;
		System.debug('Package of the size ' + size + 'removed' + 'usedCargoSpace now is ' + usedCargoSpace);
          }
          else {
          	System.debug('Package to reduce is more than the used Space- No need to process');
          }
	}


}