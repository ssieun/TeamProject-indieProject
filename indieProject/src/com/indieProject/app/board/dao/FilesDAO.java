package com.indieProject.app.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.indieProject.mybatis.config.SqlMapConfig;

public class FilesDAO {

	SqlSessionFactory sessionf=SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public FilesDAO() {
			session=sessionf.openSession(true);
	}
	
	//이미지 삭제 
		public void deleteImages(int boardNum) {
			session.delete("deleteImages",boardNum);
		}
}
