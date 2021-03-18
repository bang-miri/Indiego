package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Attack;


public class AttackDAO {
	public static List<Attack> selectInderList(String nickName) {
		List<Attack> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("attack.selectInderList",nickName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
}
