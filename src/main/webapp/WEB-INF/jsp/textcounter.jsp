
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
</head>

<body>

<script src="<c:url value="/resources/js/counter.js" />"></script>

<div class="pure-g header">
    <div class="pure-u-1"><h1>Text Counter</h1></div>
</div>

<div class="pure-g" style="margin-top: 5px;">
    <div class="pure-u-1-5"></div>
    <div class="pure-u-2-5">
        <form class="pure-form">
            <textarea id="inputText" rows="15" cols="50" style="width:100%; max-width:100%" onkeyup="updateTable()"
                      onchange="updateTable()" on></textarea>
        </form>
        <button disabled id="clearTextButton" class="pure-button" onclick="clearTextArea()" style="margin-top:5px;">
            Clear Text
        </button>
    </div>
    <%@ include file="detailsTable.jspf" %>
    <div class="pure-u-1-5"></div>
</div>

</body>
</html>
