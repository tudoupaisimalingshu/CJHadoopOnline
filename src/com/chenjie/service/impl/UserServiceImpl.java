package com.chenjie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.chenjie.mapper.UserMapper;
import com.chenjie.pojo.User;
import com.chenjie.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(User user)
	{
		return userMapper.findByIdAndPsw(user);
	}

	@Override
	public int register(User user)
	{
		return userMapper.register(user);
	}

}
