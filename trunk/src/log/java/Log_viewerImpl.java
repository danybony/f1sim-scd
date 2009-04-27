
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.omg.CORBA.ORB;

/**
 *
 * @author daniele
 */


public class Log_viewerImpl extends Log_viewerPOA {

    
    class InvalidDriverID extends Exception{} 
    class InvalidDriverPosition extends Exception{}
    
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
            }

            currentDriver.updateMaxSpeed(Speed);
            
            /* Check if the current driver is not the first*/
            if(currentDriver.getPosition() != 1){
                try {
                    /* If so check if it overlap other drivers */
                    Driver previousDriver = driverByPosition(currentDriver.getPosition() - 1);
                    
                    //-------------------------ATTENZIONE NEL CASO DI PIMO SEGMENTO ALL'INIZIO GIRO!!
                    while(currentDriver.getPosition() != 1 && previousDriver.getCurrentSegment() == (Segment-1)){
                        System.out.println(currentDriver.getName() + " ha sorpassato " 
                                + driverByPosition(currentDriver.getPosition() - 1).getName() + 
                                " nel segmento " + Segment);
                        
                        /* Updates the positions */
                        previousDriver.setPosition((short) (previousDriver.getPosition() + 1));
                        currentDriver.setPosition((short) (currentDriver.getPosition() - 1));
                        previousDriver = driverByPosition(currentDriver.getPosition() - 1);
                    }
                } catch (InvalidDriverPosition ex) {
                    System.err.println("Invalid driver position: "+ (currentDriver.getPosition() - 1));
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
    
    
    private Driver driverByPosition(int position) throws InvalidDriverPosition {
        for(int i=0; i<drivers.size(); i++){
            if(drivers.elementAt(i).getPosition() == position){
                return drivers.elementAt(i);
            }
        }
        throw new InvalidDriverPosition();
    }
    
    private Vector<Driver> extractDriversInfos(String[] Drivers) {
        throw new UnsupportedOperationException("Not yet implemented");
    }
}
