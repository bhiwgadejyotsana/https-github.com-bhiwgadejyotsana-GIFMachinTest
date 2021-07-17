$(document).ready(function () {
    updateStudentStatus();
    getStudentList();
});
var saveUser = function () {
    var firstname = $("#txtFirstName").val();
    var lastname = $("#txtLastName").val();
    var usertype = $("#ddlUserType").val();
    var email = $("#txtEmail").val();
    var phone = $("#txtPhone").val();
    var active = $("#ddlActive").val();
    
    var model = { FirstName: firstname, LastName: lastname, UserType: usertype, Email: email, Phone: phone, Active: active };
    $.ajax({
        url: "/User/SaveUser",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("User added successfully.l");
        }

    });
}
var updateStudentStatus = function () {
    var active = $("#ddlActive").val();
    var model = { Active: active };
    $.ajax({
        url: "/User/UpdateStudentStatus",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("Status updated successfully.l");
        }

    });

}

var studentEdit = function (id) {
    window.location.href = "/User/Edit?Id=" + id;
}

var getStudentList = function () {
    $.ajax({
        url: "/User/GetStudentList",
        method: "post",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (response) {
            var html = "";
            $("#tblUser tbody").empty();
            $.each(response.model, function (index, elementValue) {
                html += "<tr><td>" + elementValue.Id + "</td><td>" + elementValue.StudentName + "</td><td>" + elementValue.ParentName + "</td><td>" + elementValue.StudentClass + "</td><td>" + elementValue.ParentEmail + "</td><td>" + elementValue.ParentPhone + "</td><td><Input type='checkbox' '" + (elementValue.Active == 'Active' ? "checked='checked'" : " ") + ">"+elementValue.Active+ " </td><td><input type='submit' value='Edit' onClick='studentEdit(" + elementValue.Id + ")' /> </td></tr>";
            });
            $("#tblUser tbody").append(html);

        }
    });
}