package com.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bean.Articleinfo;
import com.bean.Articletype;
import com.bean.PageLimitNum;
import com.bean.Userinfo;
import com.mapper.ArticleMapper;
import com.util.SqlSessionFactoryUtil;

public class ArticleServiceImpl implements ArticleService {

	SqlSession sqlSession=SqlSessionFactoryUtil.getInstences().getSqlSession();
	ArticleMapper am=sqlSession.getMapper(ArticleMapper.class);
	@Override
	public List<Articletype> getArticleType() {
		// TODO Auto-generated method stub
		return am.getArticleType();
	}
	@Override
	public int addNewArticle(Articleinfo articleinfo,Userinfo userinfo) {
		UserInfoService us=new UserInfoServiceImpl();
		
		us.updateKissNum(userinfo);
		int num=am.addNewArticle(articleinfo);
		sqlSession.commit();
		return num;
	}
	@Override
	public List<Map<String, Object>> getCommentAticle() {
		
		return am.getCommentAticle();
	}
	@Override
	public List<Map<String, Object>> getGoodAticle() {
		// TODO Auto-generated method stub
		return am.getGoodAticle();
	}
	@Override
	public List<Map<String, Object>> getAllArticle(PageLimitNum pagelimitnum) {
		
		return am.getAllArticle(pagelimitnum);
	}
	@Override
	public int getArticleTotal() {
		// TODO Auto-generated method stub
		return am.getArticleTotal();
	}
	//看帖
	@Override
	public Map<String, Object> getArticleById(int id) {
		//同时更新帖子的浏览量
		am.updateArticleVisitNum(id);
		sqlSession.commit();
		return am.getArticleById(id);
	}
	@Override
	public int updateArticleRemarkNum(int artid) {
		// TODO Auto-generated method stub
		int num=am.updateArticleRemarkNum(artid);
		sqlSession.commit();
		return num;
	}
	@Override
	public List<Map<String,Object>> getMyArticleById(int userid) {
		
		return am.getMyArticleById(userid);
	}
	@Override
	public List<Map<String, Object>> getMyremarkArticleById(int userid) {
		// TODO Auto-generated method stub
		return am.getMyremarkArticleById(userid);
	}
}
