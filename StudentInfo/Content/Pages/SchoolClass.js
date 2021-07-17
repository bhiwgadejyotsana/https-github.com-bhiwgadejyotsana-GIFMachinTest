var saveClass = function () {
    var name = $("#txtName").val();
   

    var model = { Name: name };
    $.ajax({
        url: "/SchoolClass/SaveClass",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("Class added successfully.l");
        }

    });
}