<%--
  Created by IntelliJ IDEA.
  User: piratXus
  Date: 09.06.2016
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title></title>
</head>
<body>

<h2>Table of car</h2>

<table border="1">
    <tr>
        <form:form method="GET" actian="/newCar">
        <td>ID </td> <td>Brand</td> <td>Age</td> <td>Color</td>
            <td colspan="2">
                <input type="submit" value="new car">
            </td>
        </form:form>

    </tr>

    <c:forEach items = "${ct.carTableList}" var="car">
        <tr>
            <td> ${car.id} </td>
            <td> ${car.color} </td>
            <td> ${car.age} </td>
            <td> ${car.brand} </td>

            <form:form method="POST" action="/edit">
                <td colspan="2">
                    <input type="hidden" name = "editcarId" value = ${car.id}>
                    <input type="submit" value="Edit" >
                </td>
            </form:form>

            <form:form method="POST" action="/delete">
                <td colspan="2">
                    <input type="hidden" name = "deletecarId" value = ${car.id}>
                    <input type="submit" name = "delete" value="Delete"/>
                </td>
            </form:form>
        </tr>



    </c:forEach>


</table>

</body>
</html>