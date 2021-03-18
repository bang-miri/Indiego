package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.PageVO;
import com.sun.org.apache.bcel.internal.generic.Select;

public class GameDAO {

	
	public static List<Game> selectPageList(PageVO pageVO) {
		
		List<Game> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("game.selectPageList" , pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}//selectGameList end
	
	
	public static List<Game> selectPopularPageList(PageVO pageVO) {
		
		List<Game> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("game.selectPopularPageList" , pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}//selectGameList end
	
	
	
	
	
	public static List<Game> selectPopularGameList() {
		
		List<Game> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("game.selectPopularGameList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
		
	}//selectGameList end
	
	
	
	public static List<Game> selectBestGameList() {
		
		List<Game> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("game.selectBestGameList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}//selectGameList end
	
		public static int selectTotal() {
		
		int total = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectOne("game.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return total;
	}//selectGameList end
		
		
		public static List<Game> selectSearch(String title) {
			
			List<Game> list = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				list = session.selectList("game.selectSearch" , title);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

			return list;
		}//selectGameList end
		
		
		
		
	
	
	
}//GameDAO end
