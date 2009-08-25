
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
    private boolean atBox;

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
