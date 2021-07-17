using StudentInfo.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Common;

namespace StudentInfo.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserType { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Active { get; set; }
        public int ClassId { get; set; }
        public int ParentId { get; set; }

        public string SaveUser(UserModel model)
        {
            string message = "";
            StudentInfoEntities1 db = new StudentInfoEntities1();
            var getStud = db.tblUsers.Where(p => p.Id == model.Id).FirstOrDefault();
          if(getStud !=null)
            {
                getStud .FirstName = model.FirstName;
                getStud .LastName = model.LastName;

                getStud.Active = model.Active;
            }           
            db.SaveChanges();

            var getStudClass= db.tblStudentClasses.Where(p => p.StudentId == model.Id).FirstOrDefault();
            if (getStudClass != null)
            {
                getStudClass.ClassId = model.ClassId;              
            }
            db.SaveChanges();

            var getStudPar = db.tblUsers.Where(p => p.Id == model.ParentId).FirstOrDefault();
            if (getStudPar != null)
            {

                getStudPar.Email = model.Email;
                getStudPar.Phone = model.Phone;

            }
            db.SaveChanges();

            return message;
        }

        public List<VMUserModel> GetStudentList()
        {
            StudentInfoEntities1 db = new StudentInfoEntities1();
            List<VMUserModel> lstStudent = new List<VMUserModel>();
         
            //By using Stored Procedure
            try
            {
               DataTable dtTable = new DataTable();
              using (var cmd = db.Database.Connection.CreateCommand())
              {
                  db.Database.Connection.Open();
                  cmd.CommandText = "UspStudentList";
                  cmd.CommandType = CommandType.StoredProcedure;

                   

                   DbDataAdapter da = DbProviderFactories.GetFactory("System.Data.SqlClient").CreateDataAdapter();
                    da.SelectCommand = cmd;
                   da.Fill(dtTable);
                   db.Database.Connection.Close();
              }
              foreach (DataRow dr in dtTable.Rows)
              {
                   VMUserModel slmodel = new VMUserModel();
                   slmodel.Id = Convert.ToInt32(dr["Id"].ToString());
                  slmodel.StudentName = dr["StudentName"].ToString();
                    slmodel.ParentName = dr["ParentName"].ToString();
                           slmodel.StudentClass = dr["StudentClass"].ToString();
                          slmodel.ParentEmail = dr["ParentEmail"].ToString();
                        slmodel.ParentPhone = dr["ParentMobile"].ToString();
                    slmodel.Active = dr["Active"].ToString();
                    lstStudent.Add(slmodel);
                       }
                    }
                    catch (Exception ex)
                    {
                       db.Database.Connection.Close();
                       throw ex;
                    }

                    db.Dispose();
            return lstStudent;
        }

        public VMUserModel GetEditStudent(int Id)
        {
           
            StudentInfoEntities1 db = new StudentInfoEntities1();
            //List<VMUserModel> lstStudent = new List<VMUserModel>();
            VMUserModel slmodel = new VMUserModel();
            //By using Stored Procedure
            try
            {
                DataTable dtTable = new DataTable();
                using (var cmd = db.Database.Connection.CreateCommand())
                {
                    db.Database.Connection.Open();
                    cmd.CommandText = "UspGetStudent";
                    cmd.CommandType = CommandType.StoredProcedure;

                    DbParameter paramName = cmd.CreateParameter();
                    paramName.ParameterName = "Id";
                    paramName.Value = Id;
                    cmd.Parameters.Add(paramName);

                    DbDataAdapter da = DbProviderFactories.GetFactory("System.Data.SqlClient").CreateDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dtTable);
                    db.Database.Connection.Close();
                }
               
                    
                    slmodel.Id = Convert.ToInt32(dtTable.Rows[0]["Id"].ToString());
                slmodel.StudentName = dtTable.Rows[0]["StudentName"].ToString();
                slmodel.ParentId = Convert.ToInt32(dtTable.Rows[0]["ParentId"].ToString());
                slmodel.ParentName = dtTable.Rows[0]["ParentName"].ToString();
                slmodel.StudentClass = dtTable.Rows[0]["StudentClass"].ToString();
                slmodel.ClassId = Convert.ToInt32(dtTable.Rows[0]["ClassId"].ToString());
                //slmodel.Id = Convert.ToInt32(dtTable.Rows[0]["Id"].ToString());
                slmodel.ParentEmail = dtTable.Rows[0]["ParentEmail"].ToString();
                    slmodel.ParentPhone = dtTable.Rows[0]["ParentMobile"].ToString();
                    slmodel.Active = dtTable.Rows[0]["Active"].ToString();
                   
            }
            catch (Exception ex)
            {
                db.Database.Connection.Close();
                throw ex;
            }

            db.Dispose();
            return slmodel;

        }
    }

    public class VMUserModel
    {
        public int Id { get; set; }
        public string StudentName { get; set; }
        public string ParentName { get; set; }
        public string StudentClass{ get; set; }
        public string ParentEmail { get; set; }
        public string ParentPhone { get; set; }
        public string Active { get; set; }
        public int ClassId { get; set; }
        public int ParentId { get; set; }
    }
}