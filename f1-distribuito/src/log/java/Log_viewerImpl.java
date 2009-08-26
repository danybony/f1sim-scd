import java.util.Date;
import java.util.Vector;
import org.omg.CORBA.ORB;
import RI.*;
import org.omg.CosNaming.NameComponent;
import org.omg.CosNaming.NamingContext;

/**
 *
 * @author daniele
 */


public class Log_viewerImpl extends Log_viewerPOA {

    private NamingContext rootNC;

    void serRootNC(NamingContext rootNC) {
        this.rootNC = rootNC;
    }
    
    class InvalidDriverID extends Exception{}

    boolean raceIsRunning;
    
    private ORB orb;

    private Vector<Driver> drivers = new Vector<Driver>();
     
    private short raceLaps;

    private int segmentsNumber;

    private LogFrame frame;

    public void setORB(ORB orb_val) {
      orb = orb_val;
    }

    public void endRace(short Driver_ID, short reason) {
        try {
        switch (reason){

            case 1 :
                frame.println(driverById(Driver_ID).getName() + " break his engine! His race is finished.");
                driverById(Driver_ID).setOut(true);
                break;

            case 2 :
                frame.println(driverById(Driver_ID).getName() + " break a tire! His race is finished.");
                driverById(Driver_ID).setOut(true);
                break;

            case 3 :
                frame.println(driverById(Driver_ID).getName() + " had problems at box! His race is finished.");
                driverById(Driver_ID).setOut(true);
                break;

            case 4 :
                frame.println(driverById(Driver_ID).getName() + " crashed into an other car! His race is finished.");
                driverById(Driver_ID).setOut(true);
                break;

            case 5 :
                frame.println("Circuit down.");
                break;

            default :
                if(raceIsRunning){
                    System.out.println("Race finished!");
                    frame.println("Race finished!");
                    raceIsRunning = false;

                    System.out.println("Unbinding from Naming Service..");
                    frame.println("Unbinding from Naming Service..");
                    NameComponent[] name = new NameComponent[1];
                    name[0] = new NameComponent("Logger","");
                    try {

                        rootNC.unbind(name);

                    } catch (Exception ex) { }
                    for(int i =0; i<drivers.size(); i++){
                        drivers.elementAt(i).updateMaxSpeed(0);
                    }
                    frame.updateTable();

                    if(drivers.size()>0){

                        int driverIndex = 0;
                        double topSpeed = 0;
                        for(int i=0; i<drivers.size(); i++){
                            if(drivers.elementAt(i).getTopSpeed() > topSpeed){
                                topSpeed = drivers.elementAt(i).getTopSpeed();
                                driverIndex = i;
                            }
                        }
                        frame.println("Top Speed: " + topSpeed + " km/h by " + drivers.elementAt(driverIndex).getName());

                        long bestLap = Integer.MAX_VALUE;
                        for(int i=0; i<drivers.size(); i++){
                            if(drivers.elementAt(i).getBestLap() < bestLap){
                                bestLap = drivers.elementAt(i).getBestLap();
                                driverIndex = i;
                            }
                        }
                        if(bestLap != Integer.MAX_VALUE){
                            int min = (int) (bestLap / 60000);
                            int sec = (int) ((bestLap / 1000) % 60);
                            int ms  = (int) (bestLap % 1000);
                            if(min != 0){
                                frame.println("Best Lap: " + min + ":" + sec + ":" + ms + " by " + drivers.elementAt(driverIndex).getName());
                            }
                            else{
                                frame.println("Best Lap: " + sec + ":" + ms + " by " + drivers.elementAt(driverIndex).getName());
                            }
                        }
                    }
                }
        }
        

        } catch (InvalidDriverID ex) {}
        
    }

    public void setEnvironment(String[] Drivers, int segmentsNumber, short RaceLaps) {
        
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
                currentDriver.updateDifference(drivers.elementAt(0).getLastEndLap());
            }

            currentDriver.updateMaxSpeed(Speed);
            
            /* Check if the current driver is not the first*/
            if(currentDriver.getPosition() != 0){
                
                /* If so check if it overlap other drivers */
                Driver previousDriver = drivers.elementAt(currentDriver.getPosition() - 1);

                //-------------------------ATTENZIONE NEL CASO DI PIMO SEGMENTO ALL'INIZIO GIRO!!
                while(currentDriver.getPosition() != 0 && previousDriver.getCurrentSegment() == (Segment-1)){
                    frame.println(currentDriver.getName() + " overtake "
                            + previousDriver.getName() +
                            " in segment " + Segment +
                            " at lap "+ currentDriver.getCurrentLap());

                    /*Updates the table*/
                    //frame.updateTable(currentDriver.getPosition()-1, currentDriver.getPosition());

                    /* Updates the positions */
                    previousDriver.setPosition((short) (previousDriver.getPosition() + 1));
                    currentDriver.setPosition((short) (currentDriver.getPosition() - 1));
                    Driver temp = drivers.remove(currentDriver.getPosition());
                    drivers.add(previousDriver.getPosition(), temp);
                    if(currentDriver.getPosition()>0){
                        previousDriver = drivers.elementAt(currentDriver.getPosition() - 1);
                    }
                    
                    
                }
                
            }
            /*Updates the table*/
            frame.updateTable();
            
        } catch (InvalidDriverID ex) {
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
            drivers.add(new Driver(name, id, team,(short)i, (short)1));
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
