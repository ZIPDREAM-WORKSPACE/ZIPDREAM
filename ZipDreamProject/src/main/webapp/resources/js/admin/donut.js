/**
 * 그래프 색 변경, 숫자 변경 함수
 */
function donutAnimation(donut , color) {
	let total = donut.dataset.percent;
    let number = 0;
    let donutAnimation = setInterval(() => {
        donut.dataset.percent = number;
        if(number >= total){
        	clearInterval(donutAnimation);	
        }
        number = (number+0.1).toFixed(12) * 1;
        donut.style.background = 'conic-gradient(' + color + ' 0' + number + '%, #DEDEDE 0' + number + '% 100% )';
    }, 1);
}