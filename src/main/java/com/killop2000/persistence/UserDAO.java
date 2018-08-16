package com.killop2000.persistence;

import com.killop2000.domain.UserVO;
import com.killop2000.dto.LoginDTO;

public interface UserDAO {
	public UserVO login(LoginDTO loginDTO) throws Exception;
}
