package com.smhrd.hari.dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterUserDTO {
    private String userId;
    private String userPwd;
    private String userName;
    private String nickName;
    private String phone;
    private String email;
    private LocalDateTime createAt;
    private String userType;
}
