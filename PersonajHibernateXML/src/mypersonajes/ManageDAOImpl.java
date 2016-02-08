package mypersonajes;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ManageDAOImpl {
    
    private static SessionFactory factory;

    public ManageDAOImpl() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (HibernateException ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public void listAll() {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List races = session.createQuery("FROM Races").list();
            System.out.printf("%-5s%-11s%-9s%-8s%-13s%-9s%-6s%n", "ID", "Name", "Race", "Health", "Weapon", "Damage", "Shield");
            for (Iterator iterator1 = races.iterator(); iterator1.hasNext();) 
            {
                Races race = (Races) iterator1.next();
                Set personajes = race.getPersonajes();
                for (Iterator iterator2 = personajes.iterator(); iterator2.hasNext();) 
                {
                    int x = 11;
                    Personajes personaj = (Personajes) iterator2.next();
                    System.out.printf("%-5s", personaj.getPersonajId());
                    System.out.printf("%-"+x+"s", personaj.getName());
                    System.out.printf("%-9s", race.getRace());
                    System.out.printf("%-8s", personaj.getHealth());
                    System.out.printf("%-13s", personaj.getWeapon());
                    System.out.printf("%-9s", personaj.getDamage());
                    System.out.printf("%-6s%n", personaj.getShield());
                }
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
    public void printPersonajes() {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List peoples = session.createQuery("FROM Personajes").list();
            for (Iterator iterator1 = peoples.iterator(); iterator1.hasNext();) 
            {
                Personajes personaj = (Personajes) iterator1.next();
                System.out.printf("%-5s", personaj.getPersonajId());
                System.out.printf("%-11s", personaj.getName());
                System.out.printf("%-9s", personaj.getRace().getRace());
                System.out.printf("%-8s", personaj.getHealth());
                System.out.printf("%-13s", personaj.getWeapon());
                System.out.printf("%-9s", personaj.getDamage());
                System.out.printf("%-6s%n", personaj.getShield());               
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
     public List listBattleargues(int raceID) {
        Session session = factory.openSession();
        Transaction tx = null;
        List battleargues = null;
        //List battleargues = new ArrayList();
        try {
            tx = session.beginTransaction();
            battleargues = session.createQuery("from Battleargue as argue where argue.raceId = " + raceID + "order by argue.raceId" ).list();
                       
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        
        return battleargues;
    }
     
     public List listPersonajes() {
        Session session = factory.openSession();
        Transaction tx = null;
        List personajes = null;
        try {
            tx = session.beginTransaction();
            personajes = session.createQuery("from Personajes").list();  
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return personajes;
    }
     
     public List listRaces() {
        Session session = factory.openSession();
        Transaction tx = null;
        List races = null;
        try {
            tx = session.beginTransaction();
            races = session.createQuery("from Races").list();  
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return races;
    }
       
    public Integer addRace(String raceVal) {

        Session session = factory.openSession();
        Transaction tx = null;
        Integer raceID = null;
        try {
            tx = session.beginTransaction();
            Races race = new Races(raceVal);

            raceID = (Integer) session.save(race);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return raceID;
    }
    
     public void updateRace(Integer RaceID, String raceVal) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Races race = (Races) session.get(Races.class, RaceID);
            race.setRace(raceVal);
            session.update(race);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    public void deleteRace(int raceID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Races race
                    = (Races) session.get(Races.class, raceID);
            session.delete(race);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
    public Integer addPersonaj(String name, int race_id, String weapon, int health, int damage, int shield) {

        Session session = factory.openSession();
        Transaction tx = null;
        Integer personajID = null;
        try {
            tx = session.beginTransaction();
            Personajes personaj = new Personajes(name, race_id, weapon, health, damage, shield);

            personajID = (Integer) session.save(personaj);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return personajID;
    }
    
    public void updatePersonaj(Integer personajID, String name, int race_id, String weapon, int health, int damage, int shield) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Personajes personaj
                    = (Personajes) session.get(Personajes.class, personajID);
            personaj.setName(name);
            personaj.setRaceId(race_id);
            personaj.setHealth(health);
            personaj.setWeapon(weapon);
            personaj.setDamage(damage);
            personaj.setShield(shield);
            session.update(personaj);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
     public void updatePersonaj(Personajes personaj) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(personaj);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
    public boolean findPersonajes(Integer personajID) {
        Session session = factory.openSession();
        Transaction tx = null;
        List personajes = null;
        try {
            tx = session.beginTransaction();
            personajes = session.createQuery("from Personajes as personaj where personaj.personajId = " + personajID).list();                     
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        
        if (personajes != null && personajes.size() == 1)
            return true;
        else 
            return false;
    }
    
    public Personajes getPersonajes(Integer personajID) {
        Session session = factory.openSession();
        Transaction tx = null;
        List personajes = null;
        try {
            tx = session.beginTransaction();
            personajes = session.createQuery("from Personajes as personaj where personaj.personajId = " + personajID).list();                     
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }       
        if (personajes != null && personajes.size() == 1)
            return (Personajes)personajes.get(0);
        else 
            return null;
    }

    public void deletePersonajes(Integer personajID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Personajes personaj
                    = (Personajes) session.get(Personajes.class, personajID);
            session.delete(personaj);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
    public Integer addBattleargue(String argument, int raceId, int level) {

        Session session = factory.openSession();
        Transaction tx = null;
        Integer battleargueID = null;
        try {
            tx = session.beginTransaction();
            Battleargue battleargue = new Battleargue(argument, raceId, level);

            battleargueID = (Integer) session.save(battleargue);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return battleargueID;
    }
    
    public void updateBattleargue(Integer battleargueID, String argument, int race_id, int level) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Battleargue battleargue
                    = (Battleargue) session.get(Battleargue.class, battleargueID);
            battleargue.setArgument(argument);
            battleargue.setRaceId(race_id);
            battleargue.setLevel(level);
            
            session.update(battleargue);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    public void deleteBattleargue(Integer battleargueID) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Battleargue battleargue
                    = (Battleargue) session.get(Battleargue.class, battleargueID);
            session.delete(battleargue);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
}
