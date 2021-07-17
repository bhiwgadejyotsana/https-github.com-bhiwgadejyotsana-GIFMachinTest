$(document).ready(function () {
    editStudent();

});

var saveUser = function () {
    var stuname = $("#txtStudentName").val().split(" ");
    var fname = stuname[0];
    var lname = stuname[1];
    var studentclass  = $("#ddlClass").val();
    var parentemail = $("#txtParentEmail").val();
    var parentphone = $("#txtParentPhone").val();
    var active = $("#ddlActive").val();
    var parentid = $("#hdnParentId").val();
    var id = $("#hdnId").val();
    var model = {ParentId : parentid,Id : id,FirstName: fname, LastName: lname, ClassId: studentclass, Email: parentemail, Phone: parentphone, Active: active };
    $.ajax({
        url: "/User/SaveUser",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("User Edited successfully.l");
            window.location.href = "/User/StudentList";
        }

    });
}

var editStudent = function () {
    var Id = $("#hdnId").val();
    var model = {Id: Id };

    $.ajax({
        url: "/User/GetEditStudent",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (response) {
            $(" #hdnParentId").val(response.model.ParentId);
            $("#hdnId").val(response.model.Id);
            $("#txtStudentName").val(response.model.StudentName);
            $("#txtParentName").val(response.model.ParentName);
            $("#ddlClass").val(response.model.ClassId);
            $("#txtParentEmail").val(response.model.ParentEmail);
            $("#txtParentPhone").val(response.model.ParentPhone);
            $("#ddlActive").val(response.model.Active);
            
        }
    });
}