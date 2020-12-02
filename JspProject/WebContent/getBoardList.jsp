<%@page import="com.rubypaper.biz.user.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="com.rubypaper.biz.board.BoardDAO"%>
<%@page import="com.rubypaper.biz.board.BoardVO"%>
<%@page contentType="text/html; charset=EUC-KR"%>

<%
	// 1. ����� �Է����� ����
	String searchCondition = request.getParameter("searchCondition");//request�� ��� ���� ä�����µ�?
	String searchKeyword = request.getParameter("searchKeyword");
	
	// Null Check
	if(searchCondition == null) searchCondition = "TITLE";
	if(searchKeyword == null) searchKeyword = "";
	
	// 2. DB ���� ó��
	BoardVO vo = new BoardVO();
	vo.setSearchCondition(searchCondition);
	vo.setSearchKeyword(searchKeyword);
	
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> boardList = boardDAO.getBoardList(vo);
	
	HttpSession session2 = request.getSession();
	UserVO user = (UserVO)session2.getAttribute("user");
	// 3. ���� ȭ�� ����
%>

<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>
<title>�� ���</title>
</head>
<body>
	<center>
		<h1>�Խñ� ���</h1>
		<h3>
			<font color='red'><%= user.getName()%></font>�� �α��� ȯ���մϴ�...... <a href='logout_proc.jsp'>Log-out</a>
		</h3>
		<!-- �˻� ���� -->
		<form action='getBoardList.jsp' method='post'>
			<table border='1' cellpadding='0' cellspacing='0' width='700'>
				<tr>
					<td align='right'><select name='searchCondition'>
							<option value='TITLE'>����
							<option value='CONTENT'>����
					</select> <input name='searchKeyword' type='text' /> <input type='submit'
						value='�˻�' /></td>
				</tr>
			</table>
		</form>
		<!-- �˻� ���� -->
		<table border='1' cellpadding='0' cellspacing='0' width='700'>
			<tr>
				<th bgcolor='orange' width='100'>��ȣ</th>
				<th bgcolor='orange' width='200'>����</th>
				<th bgcolor='orange' width='150'>�ۼ���</th>
				<th bgcolor='orange' width='150'>�����</th>
				<th bgcolor='orange' width='100'>��ȸ��</th>
			</tr>
			
			<% for(BoardVO board : boardList) { %>
			<tr>
				<td><%= board.getSeq() %></td>
				<td align='left'><a href='getBoard.jsp?seq=2'><%= board.getTitle() %></a></td>
				<td><%= board.getWriter() %></td>
				<td><%= board.getRegDate() %></td>
				<td><%= board.getCnt() %></td>
			</tr>
			<% } %>
			
		</table>
		<br> <a href='insertBoard.html'>���� ���</a>
	</center>
</body>
</html>