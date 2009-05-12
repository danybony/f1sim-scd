
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
    private short currentSegment;   
    private short maxSpeed;
    private long lastT1, lastT2, lastEndLap;
    private long bestT1, bestT2, bestLap;

    public Driver(String name, short id, String team, short position, short currentSegment) {
        this.name = name;
        this.id = id;
        this.team = team;
        this.position = position;
        this.currentSegment = currentSegment;
        this.currentLap = 0;
        this.maxSpeed = 0;
        this.lastT1 = this.lastT2 = this.lastEndLap = 0;
    }

    public void setCurrentSegment(short Segment) {
        currentSegment = Segment;
    }

    public void updateMaxSpeed(short Speed) {
        if(Speed > maxSpeed){
            maxSpeed = Speed;
        }
    }

    public void setLastEndLap(long lastEndLap) {
        long timeBetween = lastEndLap - this.lastEndLap;
        if(timeBetween < bestLap){
            bestLap = timeBetween;
        }
        this.lastEndLap = lastEndLap;
    }

    public void setLastT1(long lastT1) {
        long timeBetween = lastT1 - this.lastT1;
        if(timeBetween < bestT1){
            bestT1 = timeBetween;
        }
        this.lastT1 = lastT1;
    }

    public void setLastT2(long lastT2) {
        long timeBetween = lastT2 - this.lastT2;
        if(timeBetween < bestT2){
            bestT2 = timeBetween;
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

    public short getCurrentSegment() {
        return currentSegment;
    }

    public short getId() {
        return id;
    }

    public short getMaxSpeed() {
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
        
        
}
