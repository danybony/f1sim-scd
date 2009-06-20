import java.util.Date;
import java.util.Vector;
import org.omg.CORBA.ORB;
import RI.*;

/**
 *
 * @author daniele
 */


public class Log_viewerImpl extends Log_viewerPOA {
    

    class InvalidDriverID extends Exception{}
    
    private ORB orb;

    private Vector<Driver> drivers = new Vector<Driver>();
     
    private short T1, T2, raceLaps;

    private int segmentsNumber;

    private LogFrame frame;

    public void setORB(ORB orb_val) {
      orb = orb_val;
    }

    public void endRace() {
        System.out.println("Race finished!");
        frame.println("Race finished!");
        orb.shutdown(false);
        frame.setVisible(false);
    }

    public void setEnvironment(String[] Drivers, int segmentsNumber, short T1, short T2, short RaceLaps) {
    /*      Begin test stampa     */   
        System.out.println("setEnvironment - Ricevuto: ");
        
        System.out.println("----------- Drivers: "+ Drivers.length);
        for(int i=0; i<Drivers.length;i++){
            System.out.println(Drivers[i]);
        }
        System.out.println("----------- T1: "+T1);
        System.out.println("----------- T2: "+T2);
        System.out.println("----------- RaceLaps: "+RaceLaps);
        System.out.println("----------- Segments: "+segmentsNumber);
    /*       End test stampa       */
        
        this.T1 = T1;
        this.T2 = T2;
        this.raceLaps = RaceLaps;
        
        this.segmentsNumber = segmentsNumber;
        
        /* extracts drivers infos from array Drivers and put them into vector
           Drivers */
        extractDriversInfos(Drivers);

        for(int i = 0; i< drivers.size(); i++){
            System.out.println();
            System.out.println("--- Driver "+i);
            System.out.println("------ Name: "+drivers.elementAt(i).getName());
            System.out.println("------ Team: "+drivers.elementAt(i).getTeam());
            System.out.println("------ ID: "+drivers.elementAt(i).getId());
            System.out.println("------ Position: "+drivers.elementAt(i).getPosition());
        }
        frame.updateTable();
    }

    public void updateLog(short Driver_ID, int Segment, float Speed, boolean box) {        
        
        try {
            Driver currentDriver = driverById(Driver_ID);

            if(box){
                currentDriver.setAtBox(true);
                return;
            }

            currentDriver.setAtBox(false);
            currentDriver.setCurrentSegment(Segment);
            
            /* Check if the current lap has finisced */
            if(Segment == segmentsNumber){
                currentDriver.setCurrentLap((short) (currentDriver.getCurrentLap() + 1));
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
            if(currentDriver.getPosition() != 0){
                
                /* If so check if it overlap other drivers */
                Driver previousDriver = drivers.elementAt(currentDriver.getPosition() - 1);

                //-------------------------ATTENZIONE NEL CASO DI PIMO SEGMENTO ALL'INIZIO GIRO!!
                while(currentDriver.getPosition() != 0 && previousDriver.getCurrentSegment() == (Segment-1)){
                    frame.println(currentDriver.getName() + " ha sorpassato "
                            + previousDriver.getName() +
                            " nel segmento " + Segment +
                            " al giro "+ currentDriver.getCurrentLap());

                    /*Updates the table*/
                    //frame.updateTable(currentDriver.getPosition()-1, currentDriver.getPosition());

                    /* Updates the positions */
                    previousDriver.setPosition((short) (previousDriver.getPosition() + 1));
                    currentDriver.setPosition((short) (currentDriver.getPosition() - 1));
                    Driver temp = drivers.remove(currentDriver.getPosition());
                    drivers.add(previousDriver.getPosition(), temp);
                    previousDriver = drivers.elementAt(currentDriver.getPosition() - 1);

                    
                }
                
            }
            /*Updates the table*/
            frame.updateTable();
            
        } catch (InvalidDriverID ex) {
            System.err.println("Invalid driver ID: "+Driver_ID);
            frame.println("Invalid driver ID: "+Driver_ID);
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
    
    
    private void extractDriversInfos(String[] Drivers) {
        int numDrivers = Drivers.length / 7;
        for(int i=0; i<numDrivers; i++){
            String name = Drivers[i*7];
            String team = Drivers[i*7+1];
            short id = (short)Integer.parseInt(Drivers[i*7+2]);
            //da aggiornare il numero del segmento di partenza!!!!
            drivers.add(new Driver(name, id, team,(short) i, (short)0));
        }
    }

    public int getNumDrivers(){
        return drivers.size();
    }

    public Driver getDriver(int position){
        return drivers.elementAt(position);
    }

    void setFrame(LogFrame frame) {
        this.frame = frame;
    }

}
