package mypersonajes;

import java.util.Set;

public class Races {

    private Integer raceId;
    private String race;

    private Set <Personajes> personajes;
    private Set <Battleargue> battleargues;

    public Races() {
    }

    public Races(String race) {
       this.race = race;
    }
   
    public Integer getRaceId() {
        return this.raceId;
    }
    
    public void setRaceId(Integer raceId) {
        this.raceId = raceId;
    }
    public String getRace() {
        return this.race;
    }
    
    public void setRace(String race) {
        this.race = race;
    }

    public Set <Personajes> getPersonajes() {
        return personajes;
    }

    public void setPersonajes(Set <Personajes> personajes) {
        this.personajes = personajes;
    }

    public Set <Battleargue> getBattleargues() {
        return battleargues;
    }

    public void setBattleargues(Set <Battleargue> battleargues) {
        this.battleargues = battleargues;
    }
}

