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
    <script type="text/javascript" src="../../resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../resources/js/boardjs/smarteditor.js" charset="UTF-8"></script>
</head>
<head>
	<%@ include file="/views/common/head.jsp"%>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
    <div id="main">
        <section class="main_container">
            <form action="/form/proDetail.do" method="POST">
                
                <input type="text" class="detailTitle" name="detailTitle" id="detail_Title" placeholder="제목을 입력하세요.">
                
                <input type="text" class="secondTitle" name="secondTitle" id="second_Title" placeholder="페이지를 간단하게 소개하세요.">

                <textarea id="editorTxt" class="detailContents" name="detailContents" placeholder="내용을 입력하세요."></textarea>
                
                <table class="checkTable">
                    <thead class="checkThead">
                        <th>NO</th>
                        <th>의뢰타입</th>
                        <th>기능추가</th>
                        <th>작업일자</th>
                        <th>수정회수</th>
                        <th>작업비용</th>
                    </thead>
                    <tbody class="checkTbody">
                        <tr> 
                            <td>1</td>
                            <td>STANDARD</td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="pay01" type="text"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>DELUXE</td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="pay02" type="text"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>PREMIUM</td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="" type="text"></td>
                            <td><input class="inputStyle" name="pay03" type="text"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="insert">
                    <form method="POST" onsubmit="return false;" enctype="multipart/form-data">
                        <input type="file" onchange="addFile(this);" multiple />
                        <div class="file-list"></div>
                    </form>
                </div>

                <button type="submit" class="detail_submit">등록</button>
            </form>
        </section>
    </div>
    <hr>
    <div id="footer">
        <p>footer<p>
        </div>
</body>
</html>
<script src="../../resources/js/boardProEnroll/fileUpload.js"></script>
<script>
    let oEditors = [];

    smartEditor = function () {
        console.log("Naver SmartEditor")
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "editorTxt",
            sSkinURI: "../../resources/static/smarteditor/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        })
    }

    $(document).ready(function () {
        smartEditor()
    })

</script>
<script src="../../resources/js/boardjs/fileupload.js"></script>