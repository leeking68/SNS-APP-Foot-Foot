<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="dto" items="${requestScope.list}">
<div class="col-md-12">
	<div class="text-reply-post">
	<h5>${dto.nickname} &nbsp;&nbsp;<span style="color:#999;">${dto.reCon} [${dto.reDate}]</span>
		<c:if test="${dto.userid eq sessionScope.userid }">
			<a onclick="deleteReply('${dto.reNum}','${dto.userid}')">[삭제]</a>
		</c:if></h5>
	</div>
</div>
</c:forEach>
