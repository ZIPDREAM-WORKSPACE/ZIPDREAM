<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<div class="content-header">
		<h2>집드림 현황</h2>
		<p>항상 집드림을 위해 일하시는 여러분께 감사드리며 오늘 하루도 화이팅!</p>
	</div>
	<div class="content-view">
		<div class="content-view-item">
			<div class="donut" data-percent="83"></div>
			<div>
				<p class="text-gray">공인중개사</p>
				<h4>4600</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="30.4"></div>
			<div>
				<p class="text-gray">사용자</p>
				<h4>4600</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="50"></div>
			<div>
				<p class="text-gray">매물</p>
				<h4>4600</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="10.5"></div>
			<div>
				<p class="text-gray">신고</p>
				<h4>4600</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="9"></div>
			<div>
				<p class="text-gray">이벤트</p>
				<h4>4600</h4>
			</div>
		</div>
	</div>
	<div class="content-main">
		<div class="content-main-report">
			<h3 style="margin: 0px 25px 15px;">신고 현황</h3>
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>Supplier Code</th>
						<th>Supplier Name</th>
						<th>Invoice Number</th>
						<th>Invoice Date</th>
						<th>Due Date</th>
						<th>Net Amount</th>
					</tr>
					<tr>
						<td data-th="Supplier Code">UPS5005</td>
						<td data-th="Supplier Name">UPS</td>
						<td data-th="Invoice Number">ASDF19218</td>
						<td data-th="Invoice Date">06/25/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$8,322.12</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">UPS3449</td>
						<td data-th="Supplier Name">UPS South Inc.</td>
						<td data-th="Invoice Number">ASDF29301</td>
						<td data-th="Invoice Date">6/24/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$3,255.49</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">BOX5599</td>
						<td data-th="Supplier Name">BOX Pro West</td>
						<td data-th="Invoice Number">ASDF43000</td>
						<td data-th="Invoice Date">6/27/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$45,255.49</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">PAN9999</td>
						<td data-th="Supplier Name">Pan Providers and Co.</td>
						<td data-th="Invoice Number">ASDF33433</td>
						<td data-th="Invoice Date">6/29/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$12,335.69</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="content-main-event">
			<h3 style="margin: 0px 25px 15px;">현재 진행중 이벤트</h3>
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>Supplier Code</th>
						<th>Supplier Name</th>
						<th>Invoice Number</th>
						<th>Invoice Date</th>
						<th>Due Date</th>
						<th>Net Amount</th>
					</tr>
					<tr>
						<td data-th="Supplier Code">UPS5005</td>
						<td data-th="Supplier Name">UPS</td>
						<td data-th="Invoice Number">ASDF19218</td>
						<td data-th="Invoice Date">06/25/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$8,322.12</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">UPS3449</td>
						<td data-th="Supplier Name">UPS South Inc.</td>
						<td data-th="Invoice Number">ASDF29301</td>
						<td data-th="Invoice Date">6/24/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$3,255.49</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">BOX5599</td>
						<td data-th="Supplier Name">BOX Pro West</td>
						<td data-th="Invoice Number">ASDF43000</td>
						<td data-th="Invoice Date">6/27/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$45,255.49</td>
					</tr>
					<tr>
						<td data-th="Supplier Code">PAN9999</td>
						<td data-th="Supplier Name">Pan Providers and Co.</td>
						<td data-th="Invoice Number">ASDF33433</td>
						<td data-th="Invoice Date">6/29/2016</td>
						<td data-th="Due Date">12/25/2016</td>
						<td data-th="Net Amount">$12,335.69</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="content-main-chat">
			<div style="text-align: center;">
				<b class="content-main-chat-no">50</b> <br> <span
					class="text-gray">현재 채팅 문의</span>
			</div>
			<div style="border-right: 1px solid gray;"></div>
			<div style="text-align: center;">
				<b class="content-main-chat-no">20</b> <br> <span
					class="text-gray">답변 중인 문의</span>
			</div>
		</div>

		<div class="content-main-apply">
			<h3 style="margin-bottom: 32px;">공인중개사 신청</h3>

			<div class="content-main-apply-item">
				<div class="apply-item-wrap">
					<div class="apply-item-circle"></div>
					<div class="apply-item-line"></div>
				</div>
				<div style="margin-top: 10px;">
					<h5>사랑 공인중개사</h5>
					<p class="text-gray">2023-05-20 13:12</p>
				</div>
			</div>
			<div class="content-main-apply-item">
				<div class="apply-item-wrap">
					<div class="apply-item-circle"></div>
					<div class="apply-item-line"></div>
				</div>
				<div style="margin-top: 10px;">
					<h5>사랑 공인중개사</h5>
					<p class="text-gray">2023-05-20 13:12</p>
				</div>
			</div>

		</div>
	</div>

</section>
<script>
	    let donuts = document.getElementsByClassName("donut");
	    
	    function donutAnimation(donut) {
	    	let total = donut.dataset.percent;
	        let number = 0;
	        let donutAnimation = setInterval(() => {
	            donut.dataset.percent = number;
	            if(number >= total){
	            	clearInterval(donutAnimation);	
	            }
	            number = (number+0.1).toFixed(12) * 1;
	            donut.style.background = `conic-gradient(#4F98FF 0 \${number}%, #DEDEDE \${number}% 100% )`;
	        }, 3);
	    }
	
	    for(let i = 0; i < donuts.length; i++){
	        donut = donuts.item(i);
	        donutAnimation(donut);
	    }
	</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />