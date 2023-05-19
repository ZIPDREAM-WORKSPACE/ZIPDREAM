<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
	div{
		  /* border : 1px solid red;  */
	}
	.wrap{
		width: 100%;
		height: 100vw;
		display: inline-flex;
		border-top: 1px solid lightblue;
	}
	#con1{
		float: left;
		width: 20%;
		height: 100%;
	}
	#con2{
		float: right;
		width: 80%;
		height: 100%;
		border: 1px solid lightgray;
	}
	#con1>#search{
		position: top;
		width: 100%;
		height: 50px;
		
	}
	.listWrap{
		width: 100%;
		height: 2083px;
		border-bottom: 1px solid lightgray; 
		overflow: auto;
	}
	.listWrap::-webkit-scrollbar {
	    width: 10px;
	    background-color: gray;
	  }
	.bi-search{
		float: left;
	}
	#search>svg{
		margin: 10px;
	}
	#search{
		border-bottom: 1px solid lightgray;
	}
	.object{
		width: 100%;
		height: 150px;
		border-bottom: 1px solid lightgray;
	}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="wrap">
		<div id="con1">
			<div id="search">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
				<input type="text" style="width: 70%; height: 95%; border: none;  outline: none; font-size: 18px;">
				<div class="dropdown">
					<div class="dropdown-menu">
						<a class="dropdown-item"></a>
						<a class="dropdown-item"></a>
						<a class="dropdown-item"></a>
					</div>
					<div class="dropdown-menu">
					</div>
					<div class="dropdown-menu">
					</div>
				</div>
			</div>
			<div class="listWrap">
				<div class="object">
				
				</div>
			</div>
		</div>
		<div id="con2">
		</div>
	</div>
	
	
	
	
</body>

<script>
	$("#search>input").click(function(){
		/* 세부리스트 보여짐 */
		
	});
</script>

</html>