package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Commentinfo;

public interface CommentService {

	//增加一条评论
	int addNewReply(Commentinfo commentinfo);
	//获取这条id帖子的的全部评论
	List<Map<String,Object>> getCommentById(int id); 
	//获取本周一到现在评论数最多的前5个帖子
	List<Map<String,Object>> getThisWeekComment();
}
