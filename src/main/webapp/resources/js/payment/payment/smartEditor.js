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