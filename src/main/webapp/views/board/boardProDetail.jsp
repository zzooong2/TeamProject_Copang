<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="/src/main/webapp/resources/img/tapIcon.png">
    <link rel="stylesheet" type="text/css" href="/src/main/webapp/resources/css/board/BoardProDetail.css">
</head>
<body>
    <section class="main_container">
        <form action="/form/proDetail.do" method="POST">
            
            <input type="text" class="detailTitle" name="detailTitle" id="detail_Title" placeholder="제목을 입력하세요.">
            
            <textarea class="detailContents" name="detailContents" id="detail_Contents" placeholder="내용을 입력하세요."></textarea>

            <table class="checkTable">
                <thead class="checkThead">
                    <th>NO</th>
                    <th>의뢰타입</th>
                    <th>제안사항</th>
                    <th>작업일자</th>
                    <th>수정회수</th>
                    <th>작업비용</th>
                </thead>
                <tbody class="checkTbody">
                    <tr> 
                        <td>1</td>
                        <td>STANDARD</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>DELUXE</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>PREMIUM</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                </tbody>
            </table>



            <button type="submit" class="detail_submit">등록</button>
        </form>
    </section>
</body>
</html>