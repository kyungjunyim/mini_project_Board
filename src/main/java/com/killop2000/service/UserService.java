package com.killop2000.service;

import com.killop2000.domain.UserVO;
import com.killop2000.dto.LoginDTO;

public interface UserService {
	public UserVO login(LoginDTO loginDTO) throws Exception;
}
