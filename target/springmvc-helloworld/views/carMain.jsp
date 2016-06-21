<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <style>
    table, th, td {
    border: 1px solid black;
    }
    </style>

    <title>Car main</title>

    <script type='text/javascript' >


        function inputData() {

            var brand = document.getElementById('brand').value;
            var color = document.getElementById('color').value;
            var age = document.getElementById('age').value;
            var json = JSON.stringify({
                brand: brand,
                color: color,
                age: age
            });


            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    var out = JSON.parse(xhttp.responseText);
                   try{
                       var idOut = out.id;
                       var ageOut = out.age;
                       var colorOut = out.color;
                       var brandOut = out.brand;

                       var data = [idOut, brandOut, ageOut, colorOut];
                       tableDraw(data);
                       clearInput();
                   } catch (out) {
                       alert("Ошибка на сервере:"
                               + "\nbrand: " + JSON.parse(out.responseText).errorBrand
                               + "\nColor: " + JSON.parse(out.responseText).errorColor
                               + "\nAge: " + JSON.parse(out.responseText).errorAge);
                   }

                }

            }

            xhttp.open('POST', '/carMain/save', true);
            xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
            xhttp.send(json);




        }

        function tableDraw(data) {
            var table = document.getElementById("TableData");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            for (var i = 0; i < data.length; i++) {
                row.insertCell(i).innerHTML = data[i];
            }
            row.insertCell(-1).innerHTML = '<input type= "button" value="Delete" onclick="deleteData(this)"/>';
            row.insertCell(-1).innerHTML = '<input type= "button" value="Edit" onclick="editeData(this)"/>';

        }

        function deleteData(obj) {
            var index = obj.parentNode.parentNode.rowIndex;
            var table = document.getElementById("TableData");
            var data=obj.parentNode.parentNode.innerText.split(/\s+/,4);
            var id=data[0];

            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    var out = JSON.parse(xhttp.responseText);
                    if (out == true) {
                        deleteEditeRow(obj);
                    } else alert("no entry");
                }
            }
            xhttp.open('POST', '/delete', true);
            xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
            xhttp.send(id);


        }

        function editeData(obj) {
            var index = obj.parentNode.parentNode.rowIndex;
            var table = document.getElementById("TableData");
            var rowCount = table.rows.length;
            var row = table.insertRow(index);
            var data=obj.parentNode.parentNode.innerText.split(/\s+/,4);

            row.insertCell(0).innerHTML = '<input type="label"  id="idE" readonly="readonly" value=${id}>'
            row.insertCell(1).innerHTML = '<input type="text"  id="brandE" value=${b}> <span id = "brandE_e"></span>'
            row.insertCell(2).innerHTML = '<input type="text"  id="ageE"   value=${a}> <span id = "ageE_e"></span>'
            row.insertCell(3).innerHTML = '<input type="text"  id="colorE" value=${c}> <span id = "colorE_e"></span>'

            var brand =document.getElementById('idE').value=data[0];
            var brand =document.getElementById('brandE').value=data[1];
            var age = document.getElementById('ageE').value=data[2];
            var color = document.getElementById('colorE').value=data[3];


            row.insertCell(-1).innerHTML = '<input type= "button" value="Save" onclick="if(validateEdite()){EditServise(this)}"/>';
            row.insertCell(-1).innerHTML = '<input type= "button" value="Cancel" onclick="deleteEditeRow(this),start()"/>';

            deleteEditeRow(obj);


        }


        function EditServise(obj) {

            var idE = document.getElementById('idE').value;
            var brandE = document.getElementById('brandE').value;
            var colorE= document.getElementById('colorE').value;
            var ageE = document.getElementById('ageE').value;
            var json = JSON.stringify({
                id: idE,
                brand: brandE,
                color: colorE,
                age: ageE
            });

            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    var out = JSON.parse(xhttp.responseText);
                    var idOut = out.id;
                    var ageOut = out.age;
                    var colorOut = out.color;
                    var brandOut = out.brand;

                    var newData = [idOut, brandOut, ageOut, colorOut];
                    deleteEditeRow(obj);
                    tableDraw(newData);
                }
            }
            xhttp.open('POST', '/editeCar', true);
            xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
            xhttp.send(json);

        }

        function deleteEditeRow(obj) {
            var index = obj.parentNode.parentNode.rowIndex;
            var table = document.getElementById("TableData");
            table.deleteRow(index);
        }

        function start() {
            xhttp = new XMLHttpRequest();
            var data;
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    var out = JSON.parse(xhttp.responseText);
                    for (var i = 0; i < out.length; i++) {
                        var idOut = out[i].id;
                        var ageOut = out[i].age;
                        var colorOut = out[i].color;
                        var brandOut = out[i].brand;

                        var data = [idOut, brandOut, ageOut, colorOut];
                        tableDraw(data);
                    }


                }

            }
            xhttp.open('GET', '/start', true);
            xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
            xhttp.send();

        }

        function clearInput() {
            document.getElementById("brand").value='';
            document.getElementById("color").value='';
            document.getElementById("age").value='';
        }

        window.onload = function() {
            start();
        }




    </script>


</head>
<body>

    <table>
        <tr>
            <td>Brand</td> <td>Age </td> <td>color </td>
        </tr>
        <tr>
            <td>
                <input type="text" id = "brand"  value = ${brand}>
                <span id = "brand_e"></span>
            </td>
            <td>
                <input type="text" id = "age"  value = ${age}>
                <span id = "age_e"></span>
            </td>
            <td>
                <input type="text" id = "color"  value = ${color}>
                <span id = "color_e"></span>
            </td>
        </tr>

    </table>
    <input type="submit" value = "Save" onclick = "return inputData()" />



<table border="1" id="TableData">
    <tr><td>Id</td><td>Brand</td> <td>Age </td> <td>color </td></tr>

</table>




 </body>
</html>