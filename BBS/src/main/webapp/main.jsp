<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%	
		String userID = null; //로그인이 된 사람들은 로그인 정보를 담을 수 있게 변수를 만들어줌
		//현재 세션이 존재하는 사람이라면 그 아이디 값을 받아서 세션에 있는 값을 스트링형태로 받아옴
		if(session.getAttribute("userID") != null){	
			userID = (String) session.getAttribute("userID");
		}
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"
       				aria-expanded="false">
           <ul class="nav navbar-nav">
                   <li class="active"><a href="main.jsp">메인</a></li>
                   <li><a href="bbs.jsp">게시판</a></li>
           </ul>
           <%
               if(userID == null){
           %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
                     	data-toggle="dropdown" role="button" aria-haspopup="true"
                    	 aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     	<li><a href="login.jsp">로그인</a></li>
                     	<li><a href="join.jsp">회원가입</a></li>
                    </ul>
				</li>
			</ul>
			<%
               } else{
            %>
            
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
                     	data-toggle="dropdown" role="button" aria-haspopup="true"
                    	 aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                     	<li><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
				</li>
			</ul>
			<%	   
               }
			%>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>이 웹사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다. </p>
				<p><a class="btn btn-primary btn-pull" href="https://getbootstrap.kr/" role="button">Bootstrap사이트 알아보기</a></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/toronto.jpg">
				</div>
				<div class="item">
					<img src="images/ducks.jpg">
				</div>
				<div class="item">
					<img src="images/niagarafalls.jpg">
				</div>
				<div class="item">
					<img src="images/cathedral.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>