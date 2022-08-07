<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, classes.PaymentInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort By Address</title>
</head>
<body>
	<%
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("./error/401.html");
			return;
		}
	%>
	<%@ include file="./components/adminHeader.jsp" %>
	<div class="page-wrapper">
		<div class="container">
			<form method="post" action="/Assignment2_Client/PaymentInfoServlet">
				<input type="text" name="address" />
				<input type="submit" value="Search" />
			</form>
			<div>
				<%
					ArrayList<PaymentInfo> pList = (ArrayList<PaymentInfo>)session.getAttribute("paymentInfoList");
					if (pList != null){
						for (int i = 0; i < pList.size(); i++){
				%>
						<div>
							<p>
								Fullname: <%=pList.get(i).getFullname() %> <br>
								Phone: <%=pList.get(i).getPhone() %><br>
								Address: <%=pList.get(i).getAddress() %><br>
								ZIP: <%=pList.get(i).getZip() %>
							</p>
						</div>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
	<%@ include file="./components/footer.jsp" %>
</body>
</html>