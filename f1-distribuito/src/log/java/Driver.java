
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
    private long lastT1, lastT2, lastEndLap;
    private long bestT1= Integer.MAX_VALUE; 
    private long bestT2 = Integer.MAX_VALUE;
    private long bestLap = Integer.MAX_VALUE;
    private boolean atBox;

    public Driver(String name, short id, String team, short position, short currentSegment) {
        this.name = name;
        this.id = id;
        this.team = team;
        this.position = position;
        this.currentSegment = currentSegment;
        this.currentLap = 0;
        this.maxSpeed = 0;
        this.lastT1 = this.lastT2 = this.lastEndLap = new Date().getTime();
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
            if(timeBetween < bestLap){
                bestLap = timeBetween;
            }
        }
        this.lastEndLap = lastEndLap;
    }

    public void setLastT1(long lastT1) {
        if(this.lastT1 != 0){
            long timeBetween = lastT1 - this.lastT1;
            if(timeBetween < bestT1){
                bestT1 = timeBetween;
            }
        }
        this.lastT1 = lastT1;
    }

    public void setLastT2(long lastT2) {
        if(this.lastT1 != 0){
            long timeBetween = lastT2 - this.lastT2;
            if(timeBetween < bestT2){
                bestT2 = timeBetween;
            }
        }
        this.lastT2 = lastT2;
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

    public boolean isAtBox() {
        return atBox;
    }

    public float getMaxSpeed() {
        return maxSpeed;
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

    void setAtBox(boolean box) {
        this.atBox = box;
    }

    public float getSpeed() {
        return Speed;
    }
        
        
}
