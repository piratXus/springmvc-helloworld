    function validateAdd() {
        var brand = document.getElementById('brand').value;
        var color = document.getElementById('color').value;
        var age = document.getElementById('age').value;
        var alpha = new RegExp('[0-9A-z]');
        var onliAlpha = new RegExp('[A-z]');
        var digit = new RegExp('[0-9]');
        var json = JSON.stringify({
            brand: brand,
            color: color,
            age: age


        });
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                var out = JSON.parse(xhttp.responseText);
                alert(out);
                inputData();
            }
        }
        xhttp.open('POST', '/inspection', true);
        xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
        xhttp.send(json);
    }

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
            var idOut = out.id;
            var ageOut = out.age;
            var colorOut = out.color;
            var brandOut = out.brand;

            var data = [idOut, brandOut, ageOut, colorOut];
            tableDraw(data);
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
    var bataDraw = data;
    for (var i = 0; i < data.length; i++) {
        row.insertCell(i).innerHTML = data[i];
    }
    row.insertCell(-1).innerHTML = '<input type= "button" value="Delete" onclick="Javacsript:deleteData(this)"/>';
    row.insertCell(-1).innerHTML = '<input type= "button" value="Edit" onclick="Javacsript:editeData(this)"/>';

}

function deleteData(obj) {
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("TableData");

    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var out = JSON.parse(xhttp.responseText);
            if (out == true) {
                table.deleteRow(index);
            } else alert("no entry");
        }
    }
    xhttp.open('POST', '/delete', true);
    xhttp.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhttp.send(index);


}

function editeData(odj) {
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("TableData");
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    for (var i = 0; i < data.length; i++) {
        row.insertCell(i).innerHTML = data[i];
    }
    row.insertCell(-1).innerHTML = '<input type= "button" value="Cancel" onclick="Javacsript:tableDraw(obj)"/>';
    row.insertCell(-1).innerHTML = '<input type= "button" value="Save" onclick="Javacsript:tableDraw(data)"/>';

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

//            window.onload = function() {
//                start();
//
//            }


