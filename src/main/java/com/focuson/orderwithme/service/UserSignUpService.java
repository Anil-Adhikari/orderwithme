package com.focuson.orderwithme.service;

import com.focuson.orderwithme.dao.IUserSignUpDAO;
import com.focuson.orderwithme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserSignUpService implements IUserSignUpService{
    @Autowired
    private IUserSignUpDAO userSignUpDAO;

    @Override
    public boolean addUser(User user) {
        userSignUpDAO.addUser(user);
        return true;
    }

}
