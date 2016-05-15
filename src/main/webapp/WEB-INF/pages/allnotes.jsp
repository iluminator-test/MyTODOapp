<%--
  Created by IntelliJ IDEA.
  User: hawk
  Date: 09.05.2016
  Time: 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TODO</title>

    <style>
        tr:first-child{
            font-weight: bold;
            background-color: #C6C9C4;
        }
    </style>

</head>


<body>
<div align="center"><h2>Список TODO дел</h2> </div>
<div align="center">
<table cellpadding="5" cellspacing="1">
    <tr>
        <td>ID</td> <td>Категория</td><td>Что сделать</td><td>Начало</td><td>Окончание</td><td>Выполнено</td><td>Редактировать</td><td>Удалить</td>
    </tr>
    <c:forEach items="${notes}" var="note">
        <tr>
            <td>${note.id}</td>
            <td>${note.title}</td>
            <td>${note.note}</td>
            <td>${note.beginDate}</td>
            <td>${note.endDate}</td>
            <td>${note.done}</td>

            <td><a href="<c:url value='/edit-${note.id}-note' />">Редактировать</a></td>
            <td><a href="<c:url value='/delete-${note.id}-note' />">Удалить</a></td>
        </tr>
    </c:forEach>
</table>
    <br/>

    <c:forEach items="${pages}" var="page">

            <a href="<c:url value='/page-${page}' />">${page}</a>&nbsp;

    </c:forEach>
<br/>
<p>
<a href="<c:url value='/new' />">Добавить новое дело</a>
</p>
<%--<p>
<a href="<c:url value='/gen' />">Генерировать новое дело</a>

</p>--%>

    <p>
        <b> Поиск (по id (число), по делам (строка), по дате начала (гггг-мм-дд))</b>
    </p>
    <form action="${pageContext.request.contextPath}/find"
          method="post">
        <label for="input">Введите строку поиска: </label> <br/>
        <input type="text" name="input">

        <input type="submit" value="Искать">
    </form>

    <p>
        <a href="<c:url value='/' />">Вернуться на главную</a>

    </p>
</div>
</body>
</html>