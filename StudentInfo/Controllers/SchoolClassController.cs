using StudentInfo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentInfo.Controllers
{
    public class SchoolClassController : Controller
    {
        // GET: SchoolClass
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SaveClass(SchoolClassmodel model)
        {
            return Json(new { message = (new SchoolClassmodel().SaveClass(model)) }, JsonRequestBehavior.AllowGet);
        }
    }
}