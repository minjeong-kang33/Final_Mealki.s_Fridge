<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List Popup</title>
 <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/mdm/itemfindPopup.css">

</head>
<body>
    <h2>| 납입처 </h2>
    <table >
        <thead>
            <tr>
                <th>납입처</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${customerList}">
                <tr onclick="sendItemToParent('${item.cust_name}')">
                    <td>${item.cust_name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<script>
function sendItemToParent(supplier) {
	  window.opener.updateItemInfo(supplier);
	  window.close();
	}
</script>
</body>
</html>
