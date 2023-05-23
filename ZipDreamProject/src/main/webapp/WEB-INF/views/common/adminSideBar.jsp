<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<nav class="side_bar">
	<div class="side_title">
		<b>Home</b>
	</div>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Category.svg" width="25px" height="25px" class="side_img"> 
		<span>메뉴</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<div class="side_title" data-href="main">
		<b>Pages</b>
	</div>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Messages.svg" width="25px" height="25px" class="side_img"> 
		<span>회원조회</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Shield Done.svg" width="25px" height="25px" class="side_img"> 
		<span>공인중개사 승인</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="notice">
		<img src="<%=request.getContextPath()%>/resources/images/Shield Done-1.svg" width="25px" height="25px" class="side_img"> 
		<span>공지사항 관리</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Info Circle.svg" width="25px" height="25px" class="side_img"> 
		<span>신고 관리</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Shield Done-2.svg" width="25px" height="25px" class="side_img"> 
		<span>이벤트 관리</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Frame 35287.svg" width="25px" height="25px" class="side_img"> 
		<span>채팅 관리</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<aside class="side_menu" data-href="main">
		<img src="<%=request.getContextPath()%>/resources/images/Wallet.svg" width="25px" height="25px" class="side_img"> 
		<span>매물 관리</span> 
		<img src="<%=request.getContextPath()%>/resources/images/Dropdown.svg" width="25px" height="25px" class="side_arrow">
	</aside>
	<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="150.000000pt" height="130.000000pt"
         viewBox="0 0 150.000000 130.000000" preserveAspectRatio="xMidYMid meet" style="opacity: 0.15;position: absolute;top:1050px;">

         <g transform="translate(0.000000,130.000000) scale(0.100000,-0.100000)" fill="#0048B3" stroke="none">

            <path d="M637 1014 c-4 -4 -7 -15 -7 -25 0 -28 -48 -77 -88 -89 -20 -6 -43
            -13 -49 -15 -21 -7 -2 -35 24 -35 53 0 113 -55 113 -103 0 -19 27 -29 37 -14
            4 7 13 25 18 41 12 35 51 66 96 75 50 10 48 34 -3 48 -58 16 -76 31 -92 78
            -13 38 -34 54 -49 39z m44 -166 l-26 -27 -27 26 -26 25 26 23 26 23 27 -22 26
            -21 -26 -27z" />
            <path d="M292 1233 c2 -30 7 -38 23 -38 16 0 20 7 20 35 0 29 -4 36 -23 38
            -21 3 -23 0 -20 -35z" />
            <path d="M195 1180 c-12 -19 10 -32 51 -28 27 2 39 8 39 18 0 19 -79 27 -90
            10z" />
            <path d="M347 1183 c-20 -19 -5 -33 38 -33 38 0 45 3 45 20 0 17 -7 20 -38 20
            -21 0 -42 -3 -45 -7z" />
            <path d="M297 1143 c-11 -10 -8 -71 3 -78 16 -10 40 14 40 39 0 32 -27 56 -43
            39z" />
            <path d="M1240 726 c0 -15 46 -56 62 -56 21 0 20 34 -1 52 -28 21 -61 24 -61
            4z" />
            <path d="M1371 720 c-24 -21 -23 -50 2 -50 16 0 57 41 57 58 0 18 -32 14 -59
            -8z" />
            <path d="M1266 629 c-30 -24 -34 -49 -7 -49 29 0 65 34 58 53 -8 22 -19 21
            -51 -4z" />
            <path d="M1354 635 c-7 -18 32 -54 59 -55 24 0 21 22 -6 48 -27 26 -45 28 -53
            7z" />
        </g>
    </svg>
</nav>

<script>
	// 클릭 css
	let pathName = window.location.pathname;
	let pathArray = pathName.split("/");
	
	let index = 0;
	switch(menuPathName = pathArray[3]){
	case "main" :
		index = 0;
        break;
	case "notice" :
		index = 3;
        break;
   /*  case "user" :
        index = 1;
        break;
    case 값C :
        값이 C일 때 실행할 명령문;
        break;
    case 값D :
        값이 D일 때 실행할 명령문;
        break;
    case 값E :
        값이 E일 때 실행할 명령문;
        break; */
	}
	
	let menu = $('.side_menu').eq(index);
	
	menu.addClass("clicked");	
	let src = menu.children('.side_img').attr('src')
		.replace(".svg", "").concat("_white.svg");
	menu.children('.side_img')	.attr('src', src);
	menu.css('background-color', '#326CF9');
	menu.children()[1].style.color = '#FFFFFF';
	menu.children('.side_arrow').attr('src',
		'<%=request.getContextPath()%>/resources/images/Dropdown_white.svg');
	
	// 페이지 이동
	let menus = $('.side_menu');
	for(item of menus){
		let pathName = item.dataset.href;
		item.addEventListener("click", function(){
			location.href = "<%=request.getContextPath()%>/admin/"+ pathName;
		});
	}
</script>