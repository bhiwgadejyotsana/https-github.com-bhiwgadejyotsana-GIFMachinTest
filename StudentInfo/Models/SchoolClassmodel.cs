using StudentInfo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentInfo.Models
{
    public class SchoolClassmodel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string SaveClass(SchoolClassmodel model)
        {
            string message = "";
            StudentInfoEntities1 db = new StudentInfoEntities1();
            var saveClass = new tblSchoolClass()
            {
                Name = model.Name,
               
            };
            db.tblSchoolClasses.Add(saveClass);
            db.SaveChanges();
            return message;
        }


    }
}