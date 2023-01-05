package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt; //sql 구문을 실행하는 역할
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1230";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //?는 setString에서 userID
		try {
			//매개변수 값 대입, 매개변수 유효화 처리
			pstmt = conn.prepareStatement(SQL);  //SQL구문을 실행시키는 기능
			pstmt.setString(1, userID);//인덱스를 스트링 값으로 지정 --> 어떻게 기능이 작동되는건지
			rs = pstmt.executeQuery(); //rs에 select구문을 수행한 결과값을 담는다.
			
			if(rs.next()) {// 아이디가 있는지 
				if(rs.getString(1).equals(userPassword)) { //userID와 userPassword가 같으면 1반환 다르면 0반환
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 불일치
				}
			}
			return -1;  //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;  //DB오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();  //해당 스테이트먼트를 실행한 결과를 넣어줄 수 있도록함
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  //DB오류
	}
}
