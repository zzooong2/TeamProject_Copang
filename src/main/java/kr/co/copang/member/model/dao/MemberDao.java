package kr.co.copang.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.copang.common.DatabaseConnection;

public class MemberDao {
	private Connection con;
	private DatabaseConnection dc;
	private PreparedStatement pstmt;
	
	public MemberDao() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}
	
	
	
	
}
