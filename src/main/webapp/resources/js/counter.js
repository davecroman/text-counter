articles = ["a", "an", "the"];

function countWords(text, excludeArticles) {
    if( text.length > 0 ){
        var words = text.trim().split(/\s+/g);

        if( excludeArticles ){
            return words.filter(function(word){ return articles.indexOf(word) <= -1 }).length;
        }else{
            return words.length;
        }
    }else{
        return 0;
    }
}

function countCharacters(text, excludeSpaces, excludeNonAlphaNumeric) {
    if(excludeSpaces){
        text = text.replace(/\s+/g, "");
    }
    if(excludeNonAlphaNumeric){
        text = text.replace(/\W+/g, "");
    }
    return text.length;
}

function updateTable() {
    var textArea = document.getElementById("inputText");
    var wordCountField = document.getElementById("wordCount");
    var characterCountField = document.getElementById("characterCount");
    var excludeArticles = $('.wordcount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude articles" }).length > 0;
    var excludeSpaces = $('.charactercount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude spaces"}).length > 0;
    var excludeNonAlphaNumeric =  $('.charactercount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude non-alphanumeric"}).length > 0;

    var text = textArea.value;

    var wordCount = countWords(text, excludeArticles);
    var charCount = countCharacters(text, excludeSpaces, excludeNonAlphaNumeric);

    wordCountField.textContent = wordCount;
    document.getElementById("clearTextButton").disabled = wordCount == 0;

    characterCountField.textContent = charCount;

}

function clearTextArea() {
    var textArea = document.getElementById("inputText");

    textArea.value = "";
    updateTable();
}