package com.smhrd.hari.service;

import com.smhrd.hari.dto.RegisterUserDTO;

public interface UserService {
    int userInsert(RegisterUserDTO registerUserDTO);

    RegisterUserDTO userSelect(RegisterUserDTO registerUserDTO);

    RegisterUserDTO userIdSearch(RegisterUserDTO registerUserDTO);

    RegisterUserDTO userSelectOne(String userId);

    int userUpdate(RegisterUserDTO registerUserDTO);
}
