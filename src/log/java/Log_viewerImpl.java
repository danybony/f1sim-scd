
import java.util.Date;
import java.util.Vector;
import org.omg.CORBA.ORB;

/**
 *
 * @author daniele
 */


public class Log_viewerImpl extends Log_viewerPOA {

    
    class InvalidDriverID extends Exception{}
    
    private ORB orb;

    private Vector<Driver> drivers;
     
    private Vector<String> teams = new Vector<String>();
      
    private short T1, T2, segmentNumber, raceLaps;
      


    public void setORB(ORB orb_val) {
      orb = orb_val;
    }

    public void endRace() {
        System.out.println("Race finished!");
        orb.shutdown(false);
    }

    public void setEnvironment(String[] Teams, String[] Drivers, short SegmentNumber, short T1, short T2, short RaceLaps) {
    /*      Begin test stampa     */   
        System.out.println("setEnvironment - Ricevuto: ");
        System.out.println("----------- Teams: ");
        for(int i=1; 1<Teams.length;i++){
            System.out.println(Teams[i]);
        }
        System.out.println("----------- Drivers: ");
        for(int i=1; 1<Drivers.length;i++){
            System.out.println(Drivers[i]);
        }
        System.out.println("----------- SegmentNumber: "+SegmentNumber);
        System.out.println("----------- T1: "+SegmentNumber);
        System.out.println("----------- T2: "+SegmentNumber);
        System.out.println("----------- RaceLaps: "+SegmentNumber);
    /*       End test stampa       */
        
        this.T1 = T1;
        this.T2 = T2;
        this.raceLaps = RaceLaps;
        this.segmentNumber = SegmentNumber;
        
        //loads teams names into vector teams
        for(int i=0; i<Teams.length; i++){
            teams.add(Teams[i]);
        } 
        
        /* extracts drivers infos from array Drivers and put them into vector
           Drivers */
        drivers = extractDriversInfos(Drivers);

        for(int i = 0; i< drivers.size(); i++){
            System.out.println();
            System.out.println("--- Driver "+i);
            System.out.println("------ Name: "+drivers.elementAt(i).getName());
            System.out.println("------ Team: "+drivers.elementAt(i).getTeam());
            System.out.println("------ ID: "+drivers.elementAt(i).getId());
            System.out.println("------ Position: "+drivers.elementAt(i).getPosition());
        }
    }

    public void updateLog(short Driver_ID, short Segment, short Speed) {
        /*Da rimuovere!!!!!!!!*/
        System.out.println("updateLog - Ricevuto: "+Driver_ID+" - "+Segment+ " - "+Speed);
        
        try {
            Driver currentDriver = driverById(Driver_ID);
            
            currentDriver.setCurrentSegment(Segment);
            
            /* Check if the current lap has finisced */
            if(Segment==0){
                currentDriver.setCurrentLap((short) (currentDriver.getCurrentLap() - 1));
                currentDriver.setLastEndLap(new Date().getTime());
            }
            else if(Segment == T1){
                currentDriver.setLastT1(new Date().getTime());
            }
            else if(Segment == T2){
                currentDriver.setLastT2(new Date().getTime());
            }

            currentDriver.updateMaxSpeed(Speed);
            
            /* Check if the current driver is not the first*/
            if(currentDriver.getPosition() != 1){
                
                /* If so check if it overlap other drivers */
                Driver previousDriver = drivers.elementAt(currentDriver.getPosition() - 2);

                //-------------------------ATTENZIONE NEL CASO DI PIMO SEGMENTO ALL'INIZIO GIRO!!
                while(currentDriver.getPosition() != 1 && previousDriver.getCurrentSegment() == (Segment-1)){
                    System.out.println(currentDriver.getName() + " ha sorpassato "
                            + previousDriver.getName() +
                            " nel segmento " + Segment);

                    /* Updates the positions */
                    previousDriver.setPosition((short) (previousDriver.getPosition() + 1));
                    currentDriver.setPosition((short) (currentDriver.getPosition() - 1));
                    Driver temp = drivers.remove(currentDriver.getPosition() - 1);
                    drivers.add(previousDriver.getPosition()-1, temp);
                    previousDriver = drivers.elementAt(currentDriver.getPosition() - 2);
                }
                
            }
            
            
        } catch (InvalidDriverID ex) {
            System.err.println("Invalid driver ID: "+Driver_ID);
        }
    }
    
    private Driver driverById(short Driver_ID) throws InvalidDriverID {
        for(int i=0; i<drivers.size(); i++){
            if(drivers.elementAt(i).getId() == Driver_ID){
                return drivers.elementAt(i);
            }
        }
        throw new InvalidDriverID();
    }
    
    
    private Vector<Driver> extractDriversInfos(String[] Drivers) {
        int numDrivers = Drivers.length / 7;
        Vector<Driver> driversTemp = new Vector<Driver>();
        for(int i=0; i<numDrivers; i++){
            String name = Drivers[i*7];
            String team = Drivers[i*7+1];
            short id = (short)Integer.parseInt(Drivers[i*7+2]);
            //da aggiornare il numero del segmento di partenza!!!!
            driversTemp.add(new Driver(name, id, team,(short) i, (short)3));
        }
        return driversTemp;
    }
}
