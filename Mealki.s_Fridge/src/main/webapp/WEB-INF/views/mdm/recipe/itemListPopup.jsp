<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List Popup</title>
</head>
<body>
    <h1>Item List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>품목코드</th>
                <th>식자재이름</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${itemList}">
                <tr onclick="sendItemToParent('${item.item_num}', '${item.item_name}')">
                    <td>${item.item_num}</td>
                    <td>${item.item_name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<script>
function sendItemToParent(itemNum, itemName) {
	  window.opener.updateItemInfo(itemNum, itemName);
	  window.close();
	}
</script>
</body>
</html>
