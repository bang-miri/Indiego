package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Reply;

public class ReplyDAO {

	public static List<Reply> selectList() {
		List<Reply> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("reply.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
	
	public static List<Reply> replyListTopten(){
		List<Reply> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("reply.replyListTopten");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
}
