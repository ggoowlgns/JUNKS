package members;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection con;	//연결된 객체
	PreparedStatement ps;	//쿼리문 처리 객체
	ResultSet rs;	//쿼리 결과 담을 객체
	
	public MemberDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url =  "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "jsp";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public ArrayList<MemberDTO> memberView() {
		   String sql = "select * from members";
		   ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		   
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
								
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();//DTO에다가 정보 저장
					dto.setId(rs.getString("id"));
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
					dto.setAddr(rs.getString("addr"));
					dto.setTel(rs.getString("tel"));
					
					memberList.add(dto);	//만든 리스트에 dto를 추가한다.
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return memberList;
	   }
	
	public MemberDTO chkUser(String id , String pwd) {
			String sql  = "select * from members where id = ?";
			
			
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					
					if(pwd.equals(rs.getString("pwd"))) {
						
						MemberDTO dto = new MemberDTO();//DTO에다가 정보 저장
						dto.setId(rs.getString("id"));
						dto.setPwd(rs.getString("pwd"));
						dto.setName(rs.getString("name"));
						dto.setAddr(rs.getString("addr"));
						dto.setTel(rs.getString("tel"));
						return dto;
					}
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}
	
	public void deleteUser(String name) {
		String sql = "delete from members where name=?";
		
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.executeQuery();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void registUser(String id, String pwd , String name , String addr , String tel) {
		String sql = "insert into members values(?,?,?,?,?)";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pwd);
				ps.setString(3, name);
				ps.setString(4, addr);
				ps.setString(5, tel);
				
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}
	
	public boolean chkIdUsed(String id) {
		String sql ="select * from members where id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return true;
			}else return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public MemberDTO getUserInfo(String name) {
		String sql ="select * from members where name = ?";
		MemberDTO m = new MemberDTO();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				m.setTel(rs.getString("tel"));
				return m;
			}
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void modifyUserInfo(String befName, String name , String addr , String tel) {
		String sql = "update members  set addr=?,tel=?,name=? where name = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addr);
			ps.setString(2, tel);
			ps.setString(3, name);
			ps.setString(4, befName);
			rs = ps.executeQuery();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
