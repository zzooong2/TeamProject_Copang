let oEditors = []
smartEditor = function() { 
    nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "editorTxt",
    sSkinURI: "/resources/static/smarteditor/SmartEditor2Skin.html", 
    fCreator: "createSEditor2",
    htParams: { fOnBeforeUnload : function() {} }
}) }

$(document).ready(function() {
    smartEditor() 
})

function save() { 
    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []); 
    return;
}

/* let oEditors = [];

        function smartEditor() {
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "editorTxt",
                sSkinURI: "/resources/static/smarteditor/SmartEditor2Skin.html",
                fCreator: "createSEditor2",
                htParams: {
                    bUseToolbar: true,
                    bUseVerticalResizer: true,
                    bUseModeChanger: true,
                    fOnBeforeUnload: function() {}
                },
                fOnAppLoad: function() {
                    // 에디터 로드 완료 후 높이를 명시적으로 설정
                    document.getElementById('editorTxt').style.height = '500px';
                }
            });
        }

        $(document).ready(function() {
            smartEditor();
        });

        function save() {
            // 에디터의 내용을 textarea에 업데이트
            oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
            // 폼 제출 등의 추가 작업을 여기서 수행
            return true; // 폼이 제출되도록 true 반환
        }*/