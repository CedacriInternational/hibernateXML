package mypersonajes;

public class Battleargue {
   
    private int battleargueId;
    private String argument;
    private int raceId;  
    private int level;
    
    private Races race;

    public Battleargue() {
    }

    public Battleargue(String argument, int raceId, int level) {
       this.argument = argument;
       this.raceId = raceId;
       this.level = level;
    }
   
    public int getBattleargueId() {
        return this.battleargueId;
    }
    
    public void setBattleargueId(int battleargueId) {
        this.battleargueId = battleargueId;
    }
    public String getArgument() {
        return this.argument;
    }
    
    public void setArgument(String argument) {
        this.argument = argument;
    }
    public int getRaceId() {
        return this.raceId;
    }
    
    public void setRaceId(int raceId) {
        this.raceId = raceId;
    }
    public int getLevel() {
        return this.level;
    }
    
    public void setLevel(int level) {
        this.level = level;
    }

    public Races getRace() {
        return race;
    }

    public void setRace(Races race) {
        this.race = race;
    }
}
