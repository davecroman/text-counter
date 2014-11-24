<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Text Counter</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://yui-s.yahooapis.com/pure/0.5.0/pure-min.css">
    <link rel="stylesheet" href="/resources/css/main.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/bootstrap-dropdown-checkbox.css" type="text/css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>

<body>
<%@ include file="header.jspf" %>

<div class="pure-g" style="margin-top: 5px;">
    <div class="pure-u-1-5"></div>
    <div class="pure-u-2-5">
        <div class="pure-form">
            <textarea id="inputText" placeholder="Write or paste text here" rows="15"
                      style="width:100%; max-width:100%"></textarea>
        </div>
        <button disabled id="clearTextButton" class="pure-button" onclick="clearTextArea()">
            Clear Text
        </button>
    </div>
    <%@ include file="detailsTable.jspf" %>
    <div class="pure-u-1-5"></div>
</div>

</body>

<script>
    var widget;

    var wordcount_options = [
        { id: "1", label: "Exclude articles", isChecked: false }
    ];

    var charcount_options = [
        { id: "1", label: "Exclude spaces", isChecked: false },
        { id: "2", label: "Exclude non-alphanumeric", isChecked: false }
    ];

    function p(wat) {
        return '<p>' + JSON.stringify(wat) + '</p>';
    }

    function updateStatus() {
        var $p = $('p.status').empty();

        $p.append(p(widget.checked()));
        updateTable();
    }

    $('.wordcount-settings').dropdownCheckbox({
        data: wordcount_options,
        title: "Wordcount Settings",
        hideHeader: true,
        showNbSelected: false,
        templateButton: '<tags:settings-dropdown-button/>'
    });

    $('.charactercount-settings').dropdownCheckbox({
        data: charcount_options,
        title: "Character Count Settings",
        hideHeader: true,
        showNbSelected: false,
        templateButton: '<tags:settings-dropdown-button/>'
    });

    widget = $('.wordcount-settings').data('dropdownCheckbox');

    $('body').on('change:dropdown-checkbox checked checked:all check:all uncheck:all check:checked uncheck:checked', updateStatus);
    $('#inputText').on('input paste', updateStatus);

    updateStatus();
</script>


</html>
