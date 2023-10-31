package com.smhrd.hari.service;

import com.smhrd.hari.dao.UserDAO;
import com.smhrd.hari.dto.RegisterUserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserServiceImpl implements UserService {
//    @Inject
//    UserDAO userDAO;

    @Autowired
    SqlSessionTemplate sql;

    @Override
    public int userInsert(RegisterUserDTO registerUserDTO) {
//        return userDao.userInsert(registerUserDTO);
        return sql.insert("User.userInsert", registerUserDTO);
    }

    @Override
    public RegisterUserDTO userSelect(RegisterUserDTO registerUserDTO) {
        return sql.selectOne("User.userSelect", registerUserDTO);
    }

    @Override
    public RegisterUserDTO userIdSearch(RegisterUserDTO registerUserDTO) {
        return sql.selectOne("User.userIdSearch", registerUserDTO);
    }

    @Override
    public RegisterUserDTO userSelectOne(String userId) {
        return sql.selectOne("User.userSelectOne", userId);
    }

    @Override
    public int userUpdate(RegisterUserDTO registerUserDTO) {
        return sql.update("User.userUpdate", registerUserDTO);
    }

}
