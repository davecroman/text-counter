var articles = ["a", "an", "the"];
var articleFilter = function(word){ return articles.indexOf(word) <= -1 };

function countWords(text, excludeArticles) {
    if( text.length == 0 ) { return 0; }

    var words = text.trim().split(/\s+/g);

    if( excludeArticles ){
        return words.filter(articleFilter).length;
    }else{
        return words.length;
    }
}

function countCharacters(text, excludeSpaces, excludeNonAlphaNumeric) {
    var reducedText = text;

    if(excludeSpaces){
        reducedText = reducedText.replace(/\s+/g, "");
    }
    if(excludeNonAlphaNumeric){
        reducedText = reducedText.replace(/\W+/g, "");
    }
    return reducedText.length;
}

function updateTable() {
    var textArea = document.getElementById("inputText");
    var wordCountField = document.getElementById("wordCount");
    var characterCountField = document.getElementById("characterCount");

    var text = textArea.value;

    wordCountField.textContent = countWords(text, isExcludeArticlesChecked());
    document.getElementById("clearTextButton").disabled = text.length == 0;

    characterCountField.textContent = countCharacters(text, isExcludeSpacesChecked(), isExcludeNonAlphaNumericChecked());
}

function isExcludeSpacesChecked(){
    return $('.charactercount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude spaces"}).length > 0;
}

function isExcludeNonAlphaNumericChecked(){
    return $('.charactercount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude non-alphanumeric"}).length > 0;
}

function isExcludeArticlesChecked() {
    return $('.wordcount-settings').dropdownCheckbox("checked").filter(function(e){ return e.label == "Exclude articles" }).length > 0;
}

function clearTextArea() {
    document.getElementById("inputText").value = "";
    updateTable();
}