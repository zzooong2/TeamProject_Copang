package kr.co.copang.customerService.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.copang.common.DatabaseConnection;
import kr.co.copang.common.PageInfo;
import kr.co.copang.customerService.notice.model.dto.NoticeDTO;

public class NoticeDAO {
	
	// DB연결
	private DatabaseConnection dc;
	private Connection con;
	private PreparedStatement ps;
	
	public NoticeDAO() {
		dc = new DatabaseConnection();
		con = dc.connDB();
	}

	
	// 게시글 리스트
	public ArrayList<NoticeDTO> getList(PageInfo pi, String category, String searchText) {
		String query = "SELECT N_NO, N_TITLE, N_CONTENTS, N_INDATE, USER_NAME"
					 + " FROM NOTICE n"
					 + " JOIN MEMBER m ON m.USER_NO = n.USER_NO"
					 + " WHERE N_STATUS = 'N'"
					 + " AND " + category + " LIKE '%' || ? || '%'"
			 		 + " ORDER BY N_INDATE DESC"
			 		 + " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, searchText);
			ps.setInt(2, pi.getOffset());
			ps.setInt(3, pi.getBoardLimit());
			
			ResultSet rs =  ps.executeQuery();

			// 동적배열 객체 생성
			ArrayList<NoticeDTO> result = new ArrayList<>();
			
			while(rs.next()) {
				int noticeNo = rs.getInt("N_NO");
				String noticeTitle = rs.getString("N_TITLE");
				String noticeContents = rs.getString("N_CONTENTS");
				String noticeIndate = rs.getString("N_INDATE");
				String userName = rs.getString("USER_NAME");
				
				NoticeDTO nDTO = new NoticeDTO();
				
				nDTO.setNoticeNo(noticeNo);
				nDTO.setNoticeTitle(noticeTitle);
				nDTO.setNoticeContents(noticeContents);
				nDTO.setNoticeIndate(noticeIndate);
				nDTO.setUserName(userName);
				
				result.add(nDTO);
				
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	// 게시글 상세보기
	public NoticeDTO getDetail(int noticeNo) {
		String query = "SELECT N_NO, N_TITLE, N_CONTENTS, N_INDATE, USER_NAME"
					 + " FROM NOTICE n"
					 + " JOIN MEMBER m ON n.USER_NO = m.USER_NO"
					 + " WHERE N_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, noticeNo);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int noticeBoardNo = rs.getInt("N_NO");
				String noticeTitle = rs.getString("N_TITLE");
				String noticeContenst = rs.getString("N_CONTENTS");
				String noticeIndate = rs.getString("N_INDATE");
				String userName = rs.getString("USER_NAME");
				
				NoticeDTO result = new NoticeDTO();
						
				result.setNoticeNo(noticeBoardNo);
				result.setNoticeTitle(noticeTitle);
				result.setNoticeContents(noticeContenst);
				result.setNoticeIndate(noticeIndate);
				result.setUserName(userName);
				
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	// 게시글 수정 페이지 이동
	public NoticeDTO edit(int noticeNo) {
		String query = "SELECT N_NO, N_TITLE, N_CONTENTS, USER_NAME"
					 + " FROM NOTICE n"
					 + " JOIN MEMBER m ON n.USER_NO = m.USER_NO"
					 + " WHERE N_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, noticeNo);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int noticeBoardNo = rs.getInt("N_NO");
				String noticeTitle = rs.getString("N_TITLE");
				String noticeContents = rs.getString("N_CONTENTS");
				String userName = rs.getString("USER_NAME");
				
				NoticeDTO nDTO = new NoticeDTO();
				
				nDTO.setNoticeNo(noticeBoardNo);
				nDTO.setNoticeTitle(noticeTitle);
				nDTO.setNoticeContents(noticeContents);
				nDTO.setUserName(userName);
				
				return nDTO;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	// 게시글 수정 폼
	public int editEnroll(NoticeDTO nDTO) {
		String query = "UPDATE NOTICE SET"
					 + " N_TITLE = ?,"
					 + " N_CONTENTS = ?,"
					 + " N_UPDATE = default"
					 + " WHERE N_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, nDTO.getNoticeTitle());
			ps.setString(2, nDTO.getNoticeContents());
			ps.setInt(3, nDTO.getNoticeNo());
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	// 게시글 삭제
	public int delete(int noticeNo) {
		String query = "DELETE NOTICE WHERE N_NO = ?";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setInt(1, noticeNo);
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	// 페이지 처리
	public int getListCount(String category, String searchText) {
		String query = "SELECT COUNT(*) AS cnt"
					 + " FROM NOTICE"
					 + " WHERE N_STATUS = 'N'"
					 + " AND " + category + " LIKE '%' || ? || '%'";
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, searchText);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int result = rs.getInt("cnt");
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 게시글 작성
	public int enroll(NoticeDTO nDTO) {
		String query = "INSERT INTO NOTICE(N_NO, N_TITLE, N_CONTENTS, N_INDATE, N_STATUS, USER_NO)"
					 + " VALUES(NOTICE_SEQ.nextval, ?, ?, default, default, 1)";
		
		try {
			ps = con.prepareStatement(query);
			
			ps.setString(1, nDTO.getNoticeTitle());
			ps.setString(2, nDTO.getNoticeContents());
			
			int result = ps.executeUpdate();
			
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
