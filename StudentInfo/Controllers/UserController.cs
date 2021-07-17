using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentInfo.Models;

namespace StudentInfo.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult StudentList()
        {
            return View();
        }
        public ActionResult Edit(int Id)
        {
            ViewBag.Id = Id;
            return View();
        }
        public ActionResult SaveUser(UserModel model)
        {
            return Json(new { message = (new UserModel().SaveUser(model)) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetStudentList()
        {
            try
            {
                return Json(new { model = (new UserModel().GetStudentList()) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }
        public ActionResult GetEditStudent(int Id)
        {
            try
            {


                return Json(new { model = (new UserModel().GetEditStudent(Id)) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

    }
}