package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web02.DB;

public class idDAO {
	public String login(idDTO dto) {
		String result=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql=
					"select * from idcheck where basicid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBasicid());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString("basicid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}


