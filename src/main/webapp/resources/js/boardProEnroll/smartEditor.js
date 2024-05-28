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