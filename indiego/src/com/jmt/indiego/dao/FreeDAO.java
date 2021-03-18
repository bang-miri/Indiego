package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.util.SqlSessionUtil;
import com.jmt.indiego.vo.Free;

public class FreeDAO {

	public static List<Free> selectList() {
		List<Free> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("free.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
	
	
 public static List<Free> selectIndexFree(){
		 
		 List<Free> list = null;
		 SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				list = session.selectList("free.selectIndexFree");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
		 return list;
		 
	 }//selectIndexFree end
	 
	 
	
	
	
	
	
	
}
