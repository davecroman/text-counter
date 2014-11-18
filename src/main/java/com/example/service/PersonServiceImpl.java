package com.example.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Person;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    @PersistenceContext
    EntityManager em;
        
    @Transactional
    public void addPerson(Person person) {
        em.persist(person);
    }

    @Transactional
    public List<Person> listPeople() {
        CriteriaQuery<Person> c = em.getCriteriaBuilder().createQuery(Person.class);
        Root<Person> from = c.from(Person.class);
        c.orderBy(em.getCriteriaBuilder().asc(from.get("lastName")));
        return em.createQuery(c).getResultList();
    }

    @Transactional
    public void removePerson(Integer id) {
        Person person = em.find(Person.class, id);
        if (null != person) {
            em.remove(person);
        }
    }
    
}
