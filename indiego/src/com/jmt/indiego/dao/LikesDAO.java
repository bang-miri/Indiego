package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Likes;

public class LikesDAO {

	public static List<Likes> selectList() {
		List<Likes> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("likes.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
}
