/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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

    public Driver(String name, short id, String team, short position, short currentSegment) {
        this.name = name;
        this.id = id;
        this.team = team;
        this.position = position;
        this.currentSegment = currentSegment;
        this.currentLap = 0;
        this.maxSpeed = 0;
    }

    public void setCurrentSegment(short Segment) {
        currentSegment = Segment;
    }

    public void updateMaxSpeed(short Speed) {
        if(Speed > maxSpeed){
            maxSpeed = Speed;
        }
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
