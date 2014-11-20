
function updateTable() {
    var textArea = document.getElementById("inputText");
    var wordCountField = document.getElementById("wordCount");
    var characterCountField = document.getElementById("characterCount");

    var text = textArea.value;

    if( text.length > 0 ){
        wordCountField.textContent = text.trim().split(/\s+/g).length;
        document.getElementById("clearTextButton").disabled = false;
    }else{
        wordCountField.textContent = 0;
        document.getElementById("clearTextButton").disabled = true;
    }

    characterCountField.textContent = text.length.toString();
}

function clearTextArea() {
    var textArea = document.getElementById("inputText");

    textArea.value = "";
    updateTable();
}