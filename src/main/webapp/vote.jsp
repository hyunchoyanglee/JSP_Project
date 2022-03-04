<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<style>
body {
	margin-top: 50px;
}

.rad-label {
	display: flex;
	align-items: center;
	border-radius: 100px;
	padding: 14px 16px;
	margin: 10px 0;
	cursor: pointer;
	transition: .3s;
}

.rad-label:hover, .rad-label:focus-within {
	background: hsla(0, 0%, 80%, .14);
}

.rad-input {
	position: absolute;
	left: 0;
	top: 0;
	width: 1px;
	height: 1px;
	opacity: 0;
	z-index: -1;
}

.rad-design {
	width: 22px;
	height: 22px;
	border-radius: 100px;
	background: linear-gradient(to right bottom, hsl(154, 97%, 62%),
		hsl(225, 97%, 62%));
	position: relative;
}

.rad-design::before {
	content: '';
	display: inline-block;
	width: inherit;
	height: inherit;
	border-radius: inherit;
	background: hsl(0, 0%, 90%);
	transform: scale(1.1);
	transition: .3s;
}

.rad-input:checked+.rad-design::before {
	transform: scale(0);
}

.rad-text {
	color: hsl(0, 0%, 60%);
	margin-left: 14px;
	letter-spacing: 3px;
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 900;
	transition: .3s;
}

.rad-input:checked ~.rad-text {
	color: hsl(0, 0%, 40%);
}

.voteBody {
	margin: 0 auto;
	width: 40%;
}

body {
	text-align: center;
}

/* 버튼 */
@import url("https://fonts.googleapis.com/css?family=Mukta:700");

button {
	position: relative;
	display: inline-block;
	cursor: pointer;
	outline: none;
	border: 0;
	vertical-align: middle;
	text-decoration: none;
	background: transparent;
	padding: 0;
	font-size: inherit;
	font-family: inherit;
}

button.learn-more {
	width: 12rem;
	height: auto;
}

button.learn-more .circle {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: relative;
	display: block;
	margin: 0;
	width: 3rem;
	height: 3rem;
	background: #282936;
	border-radius: 1.625rem;
}

button.learn-more .circle .icon {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	background: #fff;
}

button.learn-more .circle .icon.arrow {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	left: 0.625rem;
	width: 1.125rem;
	height: 0.125rem;
	background: none;
}

button.learn-more .circle .icon.arrow::before {
	position: absolute;
	content: "";
	top: -0.25rem;
	right: 0.0625rem;
	width: 0.625rem;
	height: 0.625rem;
	border-top: 0.125rem solid #fff;
	border-right: 0.125rem solid #fff;
	transform: rotate(45deg);
}

button.learn-more .button-text {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 0.75rem 0;
	margin: 0 0 0 1.85rem;
	color: #282936;
	font-weight: 700;
	line-height: 1.6;
	text-align: center;
	text-transform: uppercase;
}

button:hover .circle {
	width: 100%;
}

button:hover .circle .icon.arrow {
	background: #fff;
	transform: translate(1rem, 0);
}

button:hover .button-text {
	color: #fff;
}
</style>
</head>
<body>
	<h3>투표 종료 시간 2022.03.04 18:00 P.M</h3>
	<%
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);

	Calendar cal = Calendar.getInstance();
	long currentTime = cal.getTimeInMillis();
	%>
	현재시간은
	<%=hour%>시
	<%=minute%>분
	<%=second%>초입니다.
	
	<% request.setCharacterEncoding("UTF-8");%>
	<% Authentication aut = new Authentication();
		String voteTime = aut.getVoteTime();
		String dueYear = voteTime.substring(0,4);
		String dueMonth = voteTime.substring(5,7);
		String dueDate = voteTime.substring(8,10);
		String dueHour = voteTime.substring(11,13);
		String dueMinute = voteTime.substring(14,16);
		cal.set(Integer.parseInt(dueYear), Integer.parseInt(dueMonth)-1, Integer.parseInt(dueDate), Integer.parseInt(dueHour), Integer.parseInt(dueMinute));
		long tmpTime = cal.getTimeInMillis();
	%>
	<form method="post" action="voteOk.jsp">
		<div class="voteBody">
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="han" value="1"
				checked="checked"> <span class="rad-design"></span> <span
				class="rad-text">한돈애</span>
			</label> 
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="cho" value="2">
				<span class="rad-design"></span> <span class="rad-text">초선과여포</span>
			</label> 
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="tong" value="3">
				<span class="rad-design"></span> <span class="rad-text">오늘통닭</span>
			</label> 
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="tong" value="4">
				<span class="rad-design"></span> <span class="rad-text">하나우동</span>
			</label> 
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="sal" value="5">
				<span class="rad-design"></span> <span class="rad-text">화돈</span>
			</label>
		</div>

		<%
		if (currentTime - tmpTime > 0) {
		%>
		<div>
			<!-- <input type="submit" value="투표" disabled> -->
			<!-- <button class="learn-more">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">투표하기</span>
			</button> -->
			<p style="color: red">* 투표가 마감되었습니다 *</p>
		</div>
		<%
		} else {
		%>
		<div>
			<!-- <input type="submit" value="투표"> -->
			<button class="learn-more">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">투표하기</span>
			</button>
		</div>
		<%
		}
		%>
	</form>
	<br>
	<button class="learn-more" onclick="window.location.href='index.jsp'">
		<span class="circle" aria-hidden="true"> <span
			class="icon arrow"></span>
		</span> <span class="button-text">Main</span>
	</button>

</body>
</html>