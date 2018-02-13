package com.focuson.orderwithme.dao;

import com.focuson.orderwithme.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Transactional
@Repository
public class UserSignUpDAO implements IUserSignUpDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addUser(User user) {
        entityManager.persist(user);
    }

/*    @Override
    public void updateUser(User user) {
        User oldUser = getUserById(user.getUseruuid());

        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());
        oldUser.setAddress(user.getAddress());
        oldUser.setEmail(user.getEmail());
        oldUser.setPhone(user.getPhone());
        oldUser.setPassword(user.getPassword());
        oldUser.setPasswordHash(user.getPasswordHash());
        oldUser.setIsUpdated(user.getIsUpdated());
        oldUser.setUpdatedDate(user.getUpdatedDate());
        oldUser.setIsCustomer(user.getIsCustomer());
        oldUser.setGeoLocation(user.getGeoLocation());

        entityManager.flush();
    }*/

}
