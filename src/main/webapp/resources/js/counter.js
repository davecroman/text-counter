var articles = ["a", "an", "the"];
var articleFilter = function(word){ return articles.indexOf(word) <= -1 };
var text_stat = textstatistics("");
var textArea;
var wordCountField;
var characterCountField;
var syllableCountField;
var clearTextButton;

document.addEventListener("DOMContentLoaded", function() {
    textArea = document.getElementById("inputText");
    wordCountField = document.getElementById("wordCount");
    characterCountField = document.getElementById("characterCount");
    syllableCountField = document.getElementById("syllableCount");
    clearTextArea = document.getElementById("clearTextButton");
});

function asWords(text){
    return text.split(/\s+/g);
}

function countWords(words, excludeArticles) {
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

function countSyllables(words){
    var syllableCount = 0;

    $.each(words, function(index,word){
        syllableCount += text_stat.syllableCount(word);
    });

    return syllableCount;
}

function updateTable() {
    var text = textArea.value.trim();

    if( text.length == 0 ) {
        resetFieldsToZero();
    } else {
        var words = asWords(text);
        wordCountField.textContent = countWords(words, isExcludeArticlesChecked());
        characterCountField.textContent = countCharacters(text, isExcludeSpacesChecked(), isExcludeNonAlphaNumericChecked());
        syllableCountField.textContent = countSyllables(words);
        clearTextArea.disabled = false;
    }
}

function resetFieldsToZero() {
    wordCountField.textContent
        = characterCountField.textContent
        = syllableCountField.textContent = 0;

    clearTextArea.disabled = true;
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
    textArea.value = "";
    updateTable();
}