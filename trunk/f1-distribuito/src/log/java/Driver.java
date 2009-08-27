
import java.util.Date;


/**
 *
 * @author daniele
 */
public class Driver{

    private String name;
    private short id;
    private String team;
    private short position;
    private short currentLap;
    private int currentSegment;
    private float maxSpeed;
    private float Speed = 0;
    private long lastEndLap;
    private long bestLap = Integer.MAX_VALUE;

    /* Possible states:
     * 0: running
     * 1: at box
     * 2: race finished
     * -1: out
     */
    private short state = 0;
    private long difference = 0;
    private long totalTime = 0;


    public Driver(String name, short id, String team, short position, short currentSegment) {
        this.name = name;
        this.id = id;
        this.team = team;
        this.position = position;
        this.currentSegment = currentSegment;
        this.currentLap = 0;
        this.maxSpeed = 0;
        this.lastEndLap = new Date().getTime();
    }

    public void setCurrentSegment(int Segment) {
        currentSegment = Segment;
    }

    public void updateMaxSpeed(float Speed) {
        this.Speed = Speed;
        if(Speed > maxSpeed){
            maxSpeed = Speed;
        }
    }

    public void setLastEndLap(long lastEndLap) {
        if(this.lastEndLap != 0){
            long timeBetween = lastEndLap - this.lastEndLap;
            totalTime = totalTime + timeBetween;
            if(timeBetween < bestLap){
                bestLap = timeBetween;
            }
        }
        this.lastEndLap = lastEndLap;
    }

    public void setCurrentLap(short currentLap) {
        this.currentLap = currentLap;
    }

    public void setPosition(short position) {
        this.position = position;
    }

    public short getCurrentLap() {
        return currentLap;
    }

    public long getBestLap() {
        return bestLap;
    }

    public long getCurrentSegment() {
        return currentSegment;
    }

    public short getId() {
        return id;
    }

    public short getState() {
        return state;
    }

    public float getTopSpeed() {
        return Math.round(maxSpeed*100)/100;
    }

    public String getName() {
        return name;
    }

    public short getPosition() {
        return position;
    }

    public String getTeam() {
        return team;
    }

    long getDifference() {
        return difference;
    }

    long getTotalTime() {
        return totalTime;
    }


    public float getSpeed() {
        return Math.round(Speed*100)/100;
    }

    public long getLastEndLap() {
        return lastEndLap;
    }

    public void setState(short s) {
        state = s;

        //out
        if(state == -1){
            this.Speed = (float) 0.0;
            totalTime = new Date().getTime() - lastEndLap + totalTime;
        }

        //race finished
        if(state == 2){
            updateMaxSpeed((float) 0.0);
        }
    }

    void updateDifference(long firstDriversTime) {
        this.difference = this.lastEndLap - firstDriversTime;     
    }
        
        
}
