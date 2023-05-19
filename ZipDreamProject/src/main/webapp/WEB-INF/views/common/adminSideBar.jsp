<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.side_bar {
	display: inline-block;
	min-width: 250px;
	max-width: 250px;
	min-height: 900px;
	background-color: #FFFFFF;
}

.side_bar nav {
	height: 44px;
	display: flex;
	position: relative;
	align-items: center;
}

.side_bar nav>span {
	padding-left: 16px;
}

.side_title {
	padding: 10px 20px;
}

.side_menu {
	margin: 4px 8px 4px 10px;
	border-top-right-radius: 30px;
	border-bottom-right-radius: 30px;
	cursor: pointer;
}

.side_img {
	margin-left: 15px;
}

.side_arrow {
	position: absolute;
	right: 20px;
}

.clicked {
	background-color: '326CF9';
}
</style>

</head>
<body>
	<section class="side_bar">
		<nav class="side_title">
			<b>Home</b>
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Category.svg" width="25px" height="25px"
				class="side_img"> <span>메뉴</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_title">
			<b>Pages</b>
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Messages.svg" width="25px" height="25px"
				class="side_img"> <span>회원조회</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Shield Done.svg" width="25px" height="25px"
				class="side_img"> <span>공인중개사 승인</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Shield Done-1.svg" width="25px"
				height="25px" class="side_img"> <span>공지사항 관리</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Info Circle.svg" width="25px" height="25px"
				class="side_img"> <span>신고 관리</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Shield Done-2.svg" width="25px"
				height="25px" class="side_img"> <span>이벤트 관리</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Frame 35287.svg" width="25px" height="25px"
				class="side_img"> <span>채팅 관리</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
		<nav class="side_menu">
			<img src="<%=request.getContextPath()%>/resources/images/Wallet.svg" width="25px" height="25px"
				class="side_img"> <span>매물 관리</span> <img
				src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px"
				class="side_arrow">
		</nav>
	</section>

	<script>
		$(".side_menu").click(
				function() {
					let menus = $('.side_menu');
					for (let i = 0; i < menus.length; i++) {
						let menu = menus.eq(i);
						if (menu.hasClass("clicked")) {
							menu.removeClass("clicked");
							let src = menu.children('.side_img').attr('src')
									.replace("_white", "");
							menu.children('.side_img').attr('src', src);
							menu.css('background-color', '#FFFFFF');
							menu.children()[1].style.color = 'black';
							menu.children('.side_arrow').attr('src',
									'<%=request.getContextPath()%>/resources/images/Dropdown.svg');
						}
					}

					if (!$(this).hasClass("clicked")) {
						$(this).addClass("clicked");
						let src = $(this).children('.side_img').attr('src')
								.replace(".svg", "").concat("_white.svg");
						$(this).children('.side_img').attr('src', src);
						$(this).css('background-color', '#326CF9');
						$(this).children()[1].style.color = '#FFFFFF';
						$(this).children('.side_arrow').attr('src',
								'<%=request.getContextPath()%>/resources/images/Dropdown_white.svg');
					}
				});
	</script>
</body>
</html>