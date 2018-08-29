package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Userinfo;

public interface UserInfoService {
	//检查邮箱
	   int checkEmail(String email);
	   //注册一个用户
	   int addUserInfo(Userinfo userinfo);
	   //验证用户身份
	   Userinfo checkUserLogin(Userinfo userinfo);
	   //更新用户消耗的飞吻数
	   int updateKissNum(Userinfo userinfo);
	   //获取回帖周榜
	   List<Map<String,Object>> getUserReplyNum();
	   //激活一个用户
	   int ActiveUserinfo(String emailcode);
	   //删除一个未激活的用户
	   int DeleteOneUser(String emailcode);
	   //修改密码
	   int modifyPassword(Userinfo userinfo);
	   //修改个人信息
	   int updateUserinfo(Userinfo userinfo);
	   //通过id获得用户信息
	   Userinfo getUserinfoById(int id);
	   //签到
	   int updateSignIn(Userinfo userinfo);
}
