package com.smhrd.hari.dao;

import com.smhrd.hari.dto.RegisterUserDTO;

public interface UserDAO {
    // 일반 회원 회원가입
    int userInsert(RegisterUserDTO registerUserDTO);
}
