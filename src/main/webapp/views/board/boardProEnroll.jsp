<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" type="text/css" href="../../resources/css/board/boardProDetail.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/header.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/index.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/common/footer.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../resources/js/boardjs/smarteditor.js" charset="UTF-8"></script>
</head>
<body>
    <header>
        <!-- 로고 -->
        <div class="logo">

        </div>
        <p>header<p>
        <!-- 네비게이션 -->
        <div class="nav">

        </div>
    </header>
    <hr>
    <div id="main">
        <section class="main_container">
            <form action="/form/proDetail.do" method="POST">
                
                <input type="text" class="detailTitle" name="detailTitle" id="detail_Title" placeholder="제목을 입력하세요.">
                
                <textarea id="editorTxt" class="detailContents" name="detailContents" id="editorTxt" placeholder="내용을 입력하세요."></textarea>
                
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
<script src="../../resources/js/boardjs/fileupload.js"></script>