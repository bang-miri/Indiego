package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Users;
import com.jmt.indiego.vo.UserBadge;


public class UserBadgeDAO {

	public static int selectMainBadge (int userNo) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("userBadge.selectMainBadge",userNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end
	

	public static int updateMainBadge(UserBadge userBadge) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("userBadge.updateMainBadge",userBadge);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end
	
	public static int insertBadge() {
		
		int result = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.insert("userBadge.insertBadge");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			} // try~catch~finally end

			return result;
		}
}
