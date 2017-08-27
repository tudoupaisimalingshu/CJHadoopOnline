package com.chenjie.mapper;


import com.chenjie.pojo.User;

public interface UserMapper
{
	User findById(String id);
	User findByIdAndPsw(User user);
	int register(User user);
}
