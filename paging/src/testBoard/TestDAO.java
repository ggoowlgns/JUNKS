package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TestDAO {
	Connection con;	//연결된 객체
	PreparedStatement ps;	//쿼리문 처리 객체
	ResultSet rs;	//쿼리 결과 담을 객체
	
	public TestDAO(){
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
	
	
	public ArrayList<TestDTO> list() throws Exception {	//목록 전부를 가져올떄
		String sql  = "select * from paging order by num desc";	//내림차순으로 정렬
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		ArrayList<TestDTO> listDTO = new ArrayList<TestDTO>();
		while(rs.next()) {
			
			TestDTO dto = new TestDTO();
			dto.setTitle(rs.getString("title"));
			dto.setNum(rs.getInt("num"));
			dto.setPdate(rs.getString("pdate"));
			dto.setCount(rs.getInt("count"));
			
			listDTO.add(dto);
			
		}
		
		return listDTO;
	}
	
	public ArrayList<TestDTO> list(int start , int total) throws Exception {	//페이지의 시작과 끝값을 가져올떄
		//String sql  = "select * from paging order by num desc";	//내림차순으로 정렬
		String sql = "select * from (select rownum rn , A.* from(select * from paging order by num desc)A) where rn between ? and ?";//rownum : 가상의 번호(rn은 변수명)
		ps = con.prepareStatement(sql);
		ps.setInt(1, (start-1)*5 + 1);
		ps.setInt(2, (start)*5);
		rs = ps.executeQuery();
		ArrayList<TestDTO> listDTO = new ArrayList<TestDTO>();
		while(rs.next()) {
			
			TestDTO dto = new TestDTO();
			dto.setTitle(rs.getString("title"));
			dto.setNum(rs.getInt("num"));
			dto.setPdate(rs.getString("pdate"));
			dto.setCount(rs.getInt("count"));
			
			listDTO.add(dto);
			
		}
		
		return listDTO;
	}
	
	public void insert(TestDTO dto) throws Exception {
		String sql = "insert into paging values(test_num.nextval,?,sysdate,0,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContext());
			ps.executeUpdate();
					
	}
	
	public TestDTO readPage(String title) throws Exception {
		String sql = "select * from paging where title = ?";
		TestDTO dto = new TestDTO();
		ps = con.prepareStatement(sql);
		ps.setString(1, title);
		rs = ps.executeQuery();
		while(rs.next()) {
			dto.setCount(rs.getInt("count"));
			dto.setPdate(rs.getString("pdate"));
			dto.setTitle(rs.getString("title"));
			dto.setNum(rs.getInt("num"));
			dto.setContext(rs.getString("context"));
			return dto;
		}
		return null;
		
	}
	
	public void count(String num) throws Exception {
		String sql = "update paging set count = count+1 where num=?";	//조회수 (count)값을 1 올려주는 쿼리문
		ps = con.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(num));
		rs = ps.executeQuery();
		
		
	}
	
	
	public int getTotalPage() throws Exception {
		String sql = "select count(*) from paging";	//paging 에있는 글 수 가져오기
		int totalPage = 0;
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
		
		totalPage = rs.getInt(1);
		return totalPage;
	}
}