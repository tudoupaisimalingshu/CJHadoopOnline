package com.chenjie.pojo;


public class User
{
	/**
	 * 用户名，主键
	 */
	String u_username;
	
	/**
	 * 昵称
	 */
	String u_nickname;
	
	/**
	 * 密码
	 */
	String u_password;
	
	/**
	 * 是否活跃状态，1为活跃状态，0为冻结状态
	 */
	int u_alive;
	
	/**
	 * 用户身份，1为管理员，0为一般用户
	 */
	int u_role;
	

	public String getU_username()
	{
		return u_username;
	}

	public void setU_username(String u_username)
	{
		this.u_username = u_username;
	}

	public String getU_nickname()
	{
		return u_nickname;
	}

	public void setU_nickname(String u_nickname)
	{
		this.u_nickname = u_nickname;
	}

	public String getU_password()
	{
		return u_password;
	}

	public void setU_password(String u_password)
	{
		this.u_password = u_password;
	}

	public int getU_alive()
	{
		return u_alive;
	}

	public void setU_alive(int u_alive)
	{
		this.u_alive = u_alive;
	}

	public int getU_role()
	{
		return u_role;
	}

	public void setU_role(int u_role)
	{
		this.u_role = u_role;
	}

	@Override
	public String toString()
	{
		return "User [u_username=" + u_username + ", u_nickname=" + u_nickname + ", u_password=" + u_password
				+ ", u_alive=" + u_alive + ", u_role=" + u_role + "]";
	}
	
	
	
}
