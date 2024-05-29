<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
   	<%@ include file="/views/common/head.jsp"%>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" type="text/css" href="../../resources/css/board/boardProEnroll.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/static/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
	<link rel="stylesheet" type="text/css" href="../../resources/css/common/index.css">
	<%@ include file="/views/common/head.jsp"%>
</head>
	<%@ include file="/views/common/header.jsp"%>
<body>
	<div id="main">
		<div class="main_container">
			<form action="/BoardPro/enroll.do" method="POST" enctype="multipart/form-data">

				<input type="text" class="detailTitle" name="detailTitle" id="detail_Title" placeholder="제목을 입력하세요."> 
				
				<input type="text" class="secondTitle" name="secondTitle" id="second_Title" placeholder="페이지를 간단하게 소개하세요.">

				<textarea id="editorTxt" class="detailContents" name="detailContents" placeholder="내용을 입력하세요."></textarea>

				<table class="checkTable">
					<thead class="checkThead">
						<th>NO</th>
						<th>의뢰타입</th>
						<th>자료수량</th>
						<th>작업일자</th>
						<th>수정회수</th>
						<th>작업비용</th>
					</thead>
					<tbody class="checkTbody">
						<tr>
							<td>1</td>
							<td name="business_type_standard" value="STANDARD">STANDARD</td>
							<td><input class="inputStyle" name="standard_function" type="text"></td>
							<td><input class="inputStyle" name="standard_workDate" type="text"></td>
							<td><input class="inputStyle" name="standard_retouch" type="text"></td>
							<td><input class="inputStyle" name="standard_pay" type="text"></td>
						</tr>
						<tr>
							<td>2</td>
							<td name="business_type_deluxe" value="DELUXE">DELUXE</td>
							<td><input class="inputStyle" name="deluxe_function" type="text"></td>
							<td><input class="inputStyle" name="deluxe_workDate" type="text"></td>
							<td><input class="inputStyle" name="deluxe_retouch" type="text"></td>
							<td><input class="inputStyle" name="deluxe_pay" type="text"></td>
						</tr>
						<tr>
							<td>3</td>
							<td name="business_type_premium" value="PREMIUM">PREMIUM</td>
							<td><input class="inputStyle" name="premium_funcion" type="text"></td>
							<td><input class="inputStyle" name="premium_workDate" type="text"></td>
							<td><input class="inputStyle" name="premium_retouch" type="text"></td>
							<td><input class="inputStyle" name="premium_pay" type="text"></td>
						</tr>
					</tbody>
				</table>
				<div class="insert">
					<input type="file" onchange="addFile(this);" multiple />
					<div class="file-list"></div>
				</div>

				<button type="submit" class="detail_submit">등록</button>
			</form>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
<script src="../../resources/js/boardProEnroll/fileUpload.js"></script>
<script src="../../resources/js/boardProEnroll/smartEditor.js"></script>

