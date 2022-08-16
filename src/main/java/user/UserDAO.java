package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DB;

public class UserDAO {
	
	//로그인 체크 메스도
	public String loginCheck(UserDTO dto) {
		String name = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String SQL = "SELECT * FROM userdb WHERE userid=? AND passwd=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");			
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return name;
	}//end loginCheck()

	//아이디 조회 메소드
	public String remindIdCheck(UserDTO dto) {
		String result = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String SQL = "SELECT userid FROM userdb WHERE email=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()) {//조회가 된다면
				result = "가입한 아이디는 [ " + rs.getString("userid") + " ] 입니다.";
			} else {
				result = "가입하지 않은 이메일 입니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	} //end remindIdCheck()
	
	//비밀번호 조회 메소드
	public String remindPwdCheck(UserDTO dto) {
		String result = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String SQL = "SELECT passwd FROM userdb WHERE userid=? AND email=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()) {//조회가 된다면
				result = "해당 아이디의 비밀번호는 [" + rs.getString("passwd") + "] 입니다. \n 로그인 페이지로 이동하시겠습니까?";
			} else {
				result = "가입하지 않은 아이디 입니다. \n 다시 입력하려면 [취소] 버튼을 눌러주세요.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//end remindPwdCheck();
	
	//회원가입 메소드
	public int insertJoin(UserDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO userdb ");
			sb.append(" (userid,passwd,name,email,hp,consent,privacy) VALUES ");
			sb.append(" (?,?,?,?,?,?,?)");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getConsent());
			pstmt.setString(7, dto.getPrivacy());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;//데이터베이스 오류
	}//end insertJoin()

	//회원정보 조회
	public UserDTO userDetail(String userid) {
		UserDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String SQL = "SELECT * FROM userdb WHERE userid=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUserid(userid);
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setConsent(rs.getString("consent"));
				dto.setPrivacy(rs.getString("privacy"));
				dto.setJoin_date(rs.getDate("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	} //end userDetail();

	//회원정보 수정
	public void update(UserDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE userdb SET ");
			sb.append(" passwd=?, name=?, email=?, hp=?" );
			sb.append(" WHERE userid=?");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getUserid());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end userDetail();

	//회원정보 삭제
	public void delete(String userid) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			String SQL = "DELETE FROM userdb WHERE userid=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end delete()
	
}
