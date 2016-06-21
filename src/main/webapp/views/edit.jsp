<%--
  Created by IntelliJ IDEA.
  User: piratXus
  Date: 10.06.2016
  Time: 14:08
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
<form:form method="POST" action="/edit/processEditing" var="car">
    <table>
        <tr>
            <td>ID </td> <td>Brand</td> <td>Age</td> <td>Color</td>
        </tr>
        <tr>
            <td>
                <input type="text" name = "id" readonly="readonly" value = ${car.id}>
            </td>
            <td>
                <input type="text" name = "brand" value = ${car.brand}>
            </td>
            <td>
                <input type="text" name = "age" value = ${car.age}>
            </td>
            <td>
                <input type="text" name = "color" value = ${car.color}>
            </td>
        </tr>
    </table>

    <input type="submit" value = "Save">       <input type="button"  onclick="location.href='/carMain'" value="Cancel" >
</form:form>




</body>
</html>
