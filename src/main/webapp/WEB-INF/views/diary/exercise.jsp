<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">


<style>
#chooseFile {
	visibility: hidden;
}
#diarylist{
	visibility: hidden;
}


#diarysave{
	visibility: hidden;
}

#diaryphoto {
	visibility: hidden;
	width: 100%;
	height: 50%;
	object-fit: cover;
}
#todaydate {

 text-align: center;
 vertical-align:middle;
}

</style>
<style>
body {
  display: flex;
  flex-direction: column;
}
a {
	color: black;
	text-decoration: none;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #e7e7e7;
	background-color: #f3f3f3;
}

li {
	float: left;
}

li a {
	display: block;
	color: #666;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) {
	color: white;
	background-color: #04AA6D;
}

li a.active {
	color: white;
	background-color: #04AA6D;
}

dropdown2 {
	position: relative;
	display: inline-block;
}

.dropdown2-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown2:hover .dropdown2-content {
	display: block;
}

.flex_container {
	display: flex;
}

.flex_item {
	margin: auto;
}

.jumbotron {
	background-color: #f9f9f9;
}

.image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.button {
	text-aglin: center;
}
#calendar {
	flex-direction: column;

}
</style>
<title>Insert title here</title>
</head>
<body>
	<ul class="nav justify-content-around bg-light">
		<li class="flex-fill"><a class="" href="/news" style= "text-decoration: none;">News</a></li>
		<li class="flex-fill"><a href="/calorieDic" style= "text-decoration: none;">칼로리 사전</a> </li>
		<li class="dropdown2 flex-fill"><a href="javascript:void(0)"
			class="dropbtn " style= "text-decoration: none;">와글와글</a>
			<div class="dropdown2-content flex-fill" style="width: 15.8%">
				<a href="/board?menuId=1" style= "text-decoration: none;">자유게시판</a> 
				<a href="/board?menuId=2" style= "text-decoration: none;">건강 QnA</a>
				<a href="/recipe" style= "text-decoration: none;">다이어트 Recipe</a> 
				<a href="/board?menuId=3" style= "text-decoration: none;">다이어트 인증샷</a>
			</div></li>
		<li class="dropdown2 flex-fill"><a href="javascript:void(0)"
			class="dropbtn" style= "text-decoration: none;">다이어트 다이어리</a>
			<div class="dropdown2-content flex-fill" style="width: 19.5%">
			<a href="/exercise" style= "text-decoration: none;">운동 일기</a> 
			<a href="/diet" style= "text-decoration: none;">식단 일기</a>
			</div></li>
		<li class="flex-fill"><a href="/myBody" style= "text-decoration: none;">나의 Body</a></li>
		<li class="dropdown2 flex-fill"><a href="javascript:void(0)"  class="droptbtn" style= "text-decoration: none;">회원정보</a>
			<div class="dropdown2-content flex-fill" style="width: 15.8%">
			<a href="/user/${sessionScope.principal.id}" style= "text-decoration: none;">회원정보</a> 
			<a href="/logout" style= "text-decoration: none;">로그아웃</a>
			</div>
		</li>
		
	</ul>
	<div class="jumbotron text-center"
		style="height: 200px; position: relative">
		<img class="image-thumbnail" src="/image/exercise.jpg">
	</div>
	<div class="container m_tm_20" style="height: 100%;">
		<div id="calendar" style="float: left; width: 66%; "></div>
				<div id = "todaydate" >
				</div>
				<br>
		<div id="diary" style="float: left; width: 34%; height: 650px;">
			<form class="upload-form" action="/exercise" method="post" enctype="multipart/form-data">
				
				<div class="form-group">
					<input type="text" id="date" name="date" class="form-control"
						required="required" readonly="readonly">
				</div>
				<div class="form-group" id="exercise" style="width: 100%;">
					<input id="exercise" name="exercise"  type="text" class="form-control"
						placeholder="오늘의 운동을 입력해주세요" required="required"
						style="width: 100%; float: right">

				</div>
				<div class="form-group" id="exercise" style="width:100%;">
					<input id="time"  name="time" type="text" class="form-control"
						placeholder="분" required="required"
						style="width: 100%; float: right">

				</div>

				<div class="form-group">
					<input type="text" class="form-control" name="kcal" placeholder="kcal"
						required="required" maxlength="20">
				</div>
				<div class="image-upload" id="image-upload">

					<div class="button">
						<label for="chooseFile"> 👉 CLICK HERE! 👈 *오늘의 운동 사진을
							올려주세요* </label> <input type="file" id="chooseFile" name="chooseFile"
							accept="image/*" onchange="loadFile(this)">
					</div>
				</div>
				<div class="image-show" id="image-show"
					style="width: 50%; height: 30%">
					<img id="diaryphoto" src="">
				</div>
				<button type="submit" id="diarysave" class="btn btn-primary" onclick="calenderClick();" >일기저장</button>
				<a id = "diarylist" href="/exercise/${sessionScope.principal.id}/list" >운동일기리스트</a>
			</form>



			<div class="container">
				<form method="post" enctype="multipart/form-data"></form>
			</div>
		</div>
	</div>
	<footer>
	<div class="jumbotron text-center"
		style="position: absolute; left: 0; bottom: -20; width: 100%;">
		
		<p>2조 다이어트App 1557</p>

		<p>📞010-1234-1557</p>
		<p>📬부산시 부산진구</p>
		<p>📝사업자번호: 051-****-1557</p>
	</div>
	</footer>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/main.min.css">
<script src="js/main.js"></script>
<script src="js/ko.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
let mealtime =  $("#mealtime input").on("click", function(event){
	mealtime  = event.target.value;
	});
		
	function calenderClick() {
	    console.log('일기가 저장되었습니다.');
		
	}
	let today = new Date();   

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	
	$("#todaydate").append("<h3>"+ year+"년"+month+"월"+ date+"일"+"</h3>");

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			selectable : true,
			locale : 'ko',
			height : 650,
			dateClick : function(info) {
				document.getElementById("date").value = info.dateStr;

				events: [ /* event data here */]
			},
			initialDate : '2021-10-12',
			/*  
			calendar.addEvent({
				title : i,
				start : '2021-10-06',
				end : '2021-10-07'
			})

			,
			 */
			dayMaxEventRows : true, // for all non-TimeGrid views
			dayMaxEventRows : 3, // adjust to 6 only for timeGridWeek/timeGridDay

			select : function(arg) {
			
			},

			eventClick : function(arg) {
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
			},
			headerToolbar: {
				start:'list',
		        center: 'exercisediary'
		      },
			customButtons: {
				list : {
					text: '리스트보기',
					click: function() {
						$('#diarylist').get(0).click();
						$("#diarylist").trigger("click");
					}
					
					
				},
				exercisediary: {
		          text: '일기저장',
		          click: function() {
		              calendar.addEvent({
		                title: mealtime,
		                start: document.getElementById("date").value,
		                allDay: true
		              });
		             $("#diarysave").trigger("click");
		           
		          }
		        }
			}


		});

		calendar.render();
	});
</script>
<script>
	function loadFile(input) {
		var file = input.files[0]; //선택된 파일 가져오기
		/*  
		 */
		//미리 만들어 놓은 div에 text(파일 이름) 추가
		//새로운 이미지 div 추가
		//document.getElementById('image-upload').style.visibility = 'hidden';
		var newImage = document.createElement("img");
		newImage.setAttribute("class", 'img');

		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);

		newImage.style.width = "100px";
		newImage.style.height = "300px";
		newImage.style.objectFit = "contain";

		//이미지를 image-show div에 추가
		//var container = document.getElementById('image-show');

		$("#diaryphoto").attr("src", newImage.src);
		document.getElementById('diaryphoto').style.visibility = 'visible';
		//container.appendChild(newImage);
	};
</script>

</body>
</html>