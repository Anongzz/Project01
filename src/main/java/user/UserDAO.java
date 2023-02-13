package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.filters.SetCharacterEncodingFilter;
import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.mysql.cj.exceptions.RSAException;

import jakarta.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import util.DatabaseUtil;

public class UserDAO {

	
	public int join(String userName, String userID, String userPW) {
		String SQL ="INSERT INTO parkinguser VALUES (?,?,?)";
		try {
			Connection connection = DatabaseUtil.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userID);
			pstmt.setString(3, userPW);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int join2(String userName, String userID, String userPW) {
		
		String SQL = "INSERT INTO parkinguser VALUES (?,?,HEX(AES_ENCRYPT(?,'ABC')))";
		try {
			Connection connection = DatabaseUtil.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userID);
			pstmt.setString(3, userPW);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int createBuilding_step1(String userID, String buildingName) {
		System.out.println("createBuilding_step1 함수 진입");
		String buildingInformationSQL = "INSERT INTO buildingInformation VALUES (?,?,now())";
		try {
			Connection connection = DatabaseUtil.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(buildingInformationSQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, buildingName);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int createBuilding_step2(String userID, String buildingName, String basicPrice, String basicTime, String addPrice, String addTime) {
		System.out.println("createBuilding_step2 함수 진입");
		
		String SQL ="INSERT INTO parkingPrice VALUES (?,?,?,?,?,?)";
		try {
			Connection connection = DatabaseUtil.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, buildingName);
			pstmt.setInt(3,Integer.parseInt(basicPrice));
			pstmt.setInt(4,Integer.parseInt(basicTime));
			pstmt.setInt(5,Integer.parseInt(addPrice));
			pstmt.setInt(6,Integer.parseInt(addTime));
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int login(String userID, String userPW) throws SQLException, IOException {
		
		String SQL = "SELECT userID, userPW FROM parkinguser WHERE userID=? AND userPW=?" ;
		UserDTO dto = new UserDTO();
		String getID="";
		String getPW="";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			ResultSet rs =pstmt.executeQuery();
			
			while(rs.next()) {
				getID=rs.getString("userID");
				getPW=rs.getString("userPW");
			}
			rs.close();
			System.out.println(getID.equals(userID)&&getPW.equals(userPW));
			if(getID.equals(userID)&&getPW.equals(userPW)) {
				return 1;
			}
			else {
				return 2;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 2;
	}
	
	public int login2(String userID, String userPW) throws SQLException, IOException {
		
		
		String SQL = "SELECT userID, AES_DECRYPT(UNHEX(userPW), 'ABC')  from parkinguser where userID = ? and ? = (SELECT cast(AES_DECRYPT(UNHEX(userPW), 'ABC') as char(100)) FROM parkinguser where userID=?);";
		UserDTO dto = new UserDTO();
		String getID="";
		String getPW="";
		String subUserID=userID;
		
		
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//값 보내기
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, subUserID);
			ResultSet rs =pstmt.executeQuery();
			
			while(rs.next()) {
				//값 받기
				getID=rs.getString("userID");
				getPW=rs.getString("AES_DECRYPT(UNHEX(userPW), 'ABC')");
			}
			rs.close();
			System.out.println(getID.equals(userID)&&getPW.equals(userPW));
			if(getID.equals(userID)&&getPW.equals(userPW)) {
				return 1;
			}
			else {
				return 2;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 2;
	}
	
	
}
