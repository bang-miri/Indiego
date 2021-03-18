package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Idea;

public class IdeaDAO {

	public static List<Idea> selctBestTenIdea(){
		List<Idea> list = null;
	
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("idea.selctBestTenIdea");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	
	
	
}
