package com.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bean.Userinfo;
import com.mapper.UserInfoMapper;
import com.util.SqlSessionFactoryUtil;

public class UserInfoServiceImpl implements UserInfoService {

	SqlSession sqlSession=SqlSessionFactoryUtil.getInstences().getSqlSession();
	UserInfoMapper um=sqlSession.getMapper(UserInfoMapper.class);
	@Override
	public int checkEmail(String email) {
		
			int num=um.checkEmail(email);
			return num;
		
	}
	@Override
	public int addUserInfo(Userinfo userinfo) {
		
		System.out.println(userinfo.getNickname()+","+userinfo.getEmail());
		int num=um.addUserInfo(userinfo);
		//记得增删改要提交事务
		sqlSession.commit();
		return num;
	}
	
	@Override
	public Userinfo checkUserLogin(Userinfo userinfo) {
		
		return um.checkUserLogin(userinfo);
	}
	@Override
	public int updateKissNum(Userinfo userinfo) {
		int num=um.updateKissNum(userinfo);
		sqlSession.commit();
		return num;
	}
	@Override
	public List<Map<String,Object>> getUserReplyNum() {
		
		return um.getUserReplyNum();
	}
	@Override
	public int ActiveUserinfo(String emailcode) {
		int n=um.ActiveUserinfo(emailcode);
		sqlSession.commit();
		return n; 
	}
	@Override
	public int DeleteOneUser(String emailcode) {
		
		int n=um.DeleteOneUser(emailcode);
		sqlSession.commit();
		return n;
	}
	@Override
	public int modifyPassword(Userinfo userinfo) {
		int num=um.modifyPassword(userinfo);
		sqlSession.commit();
		return num;
	}
	@Override
	public int updateUserinfo(Userinfo userinfo) {
		int num=um.updateUserinfo(userinfo);
		sqlSession.commit();
		return num;
	}
	@Override
	public Userinfo getUserinfoById(int id) {
		
		return um.getUserinfoById(id);
	}
	@Override
	public int updateSignIn(Userinfo userinfo) {
		int num=um.updateSignIn(userinfo);
		sqlSession.commit();
		return num;
	}

}
