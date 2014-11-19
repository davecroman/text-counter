<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="utf-8">
    <title>Text Counter</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://yui-s.yahooapis.com/pure/0.5.0/pure-min.css">

    <style>
        .header{
            font-family: "omnes-pro", sans-serif;
            text-align: center;
            border-bottom: 1px solid #dddddd;
            background: #eeeeee;
        }
    </style>
</head>

<body>

<script>
    function updateTable() {
        var textArea = document.getElementById("inputText");
        var wordCountField = document.getElementById("wordCount");

        var text = textArea.value.trim();

        if( text.length > 0 ){
            wordCountField.textContent = text.split(/\s+/g).length;
        }else{
            wordCountField.textContent = 0;
        }
    }
</script>

<div class="container">
    <div class="pure-g header">
        <div class="pure-u-1"> <h1>Text Counter</h1> </div>
    </div>

    <div class="pure-g" style="margin-top: 5px;">
        <div class="pure-u-1-5"></div>
        <div class="pure-u-2-5">
            <form class="pure-form" style="margin: 5px;">
                <textarea id="inputText" rows="10" cols="50" style="width:100%;max-width: 100%" onkeyup="updateTable()"></textarea>
            </form>
        </div>
        <div class="pure-u-1-5" style="margin: 5px;">
            <table class="pure-table table-striped" style="width: 100%">
                <thead>
                <tr>
                    <th colspan="2">Details</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>Word count</td>
                    <td id="wordCount">0</td>
                </tr>

                <tr>
                    <td>Paragraph count</td>
                    <td>0</td>
                </tr>


                </tbody>
            </table>
        </div>
        <div class="pure-u-1-5"></div>
    </div>
</div>

</body>
</html>
