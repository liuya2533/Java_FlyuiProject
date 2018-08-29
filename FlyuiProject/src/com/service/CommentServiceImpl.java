package com.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bean.Articleinfo;
import com.bean.Articletype;
import com.bean.Commentinfo;
import com.bean.PageLimitNum;
import com.bean.Userinfo;
import com.mapper.CommentMapper;
import com.util.SqlSessionFactoryUtil;

public class CommentServiceImpl  implements CommentService {

	SqlSession sqlSession=SqlSessionFactoryUtil.getInstences().getSqlSession();
	CommentMapper cm=sqlSession.getMapper(CommentMapper.class);
	
	ArticleService as=new ArticleServiceImpl();
	@Override
	public int addNewReply(Commentinfo commentinfo) {
		int num=cm.addNewReply(commentinfo);
		sqlSession.commit();
		//同时更新帖子回复数
		as.updateArticleRemarkNum(commentinfo.getArtorcommid());
		return num;
	}
	@Override
	public List<Map<String, Object>> getCommentById(int id) {
		// TODO Auto-generated method stub
		return cm.getCommentById(id);
	}
	@Override
	public List<Map<String, Object>> getThisWeekComment() {
		// TODO Auto-generated method stub
		return cm.getThisWeekComment();
	}
	
}
