package com.killop2000.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.killop2000.domain.UserVO;
import com.killop2000.dto.LoginDTO;
import com.killop2000.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return dao.login(loginDTO);
	}
	
	
	
}
