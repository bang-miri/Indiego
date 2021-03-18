package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Users;

public class UsersDAO {
	
	public static int selectCheckId(String id) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("users.selectCheckId",id);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}//selectCheckId() end
	
	public static int insert(Users users) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("users.insert", users);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end

		return result;
	}
	
	public static int selectCheckNickName(String nickName) {
		int cnt = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("users.selectCheckNickName",nickName);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}//selectCheckNickName() end
	
	public static Users selectLogin(Users users) {
		Users loginUsers = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			loginUsers = session.selectOne("users.selectLogin",users);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return loginUsers;
	}//selectLogin() end

	public static List<Users> selectList() {
		List<Users> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("users.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	public static String selectNickName(int userNo) {
		String result = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("users.selectNickName",userNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end
	
	public static String selectProfile(int userNo) {
		String result = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("users.selectProfile",userNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end
	
	public static int updateProfile(Users user) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("users.updateProfile",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end
	
	public static List<Users> selectAttackInder() {
		List<Users> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("users.selectAttackInder");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
	public static String selectInder(int userNo) {
		String result=null;
		SqlSession session=null;
		try {
			session=SqlSessionUtil.getSession();
			result=session.selectOne("users.selectInder",userNo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
}
