using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Test_Application.Models;

namespace Test_Application.Controllers
{
    public class HomeController : BaseController
    {
        private readonly Test_DBEntities _dbContext = new Test_DBEntities();
        public ActionResult Index()
        {
            
            return View();
        }

        
        public ActionResult FormData(long id=0)
        {
            TestDataModel model = new TestDataModel();
            model.DOB = DateTime.Now.Date;
            if (id > 0)
            {
                var entity = _dbContext.TestDatas.Find(id);
                if (entity != null)
                {
                    //Also Can be done by Auto mapper
                    model.Id = entity.Id;
                    model.FirstName = entity.FirstName;
                    model.LastName = entity.LastName;
                    model.Email = entity.Email;
                    model.DOB = entity.DOB;
                    model.Gender = entity.Gender;
                    model.mobile = entity.mobile;
                    model.City = entity.City;
                }
            }            
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult FormData(TestDataModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (model.Id > 0)
                    {
                        var entity = _dbContext.TestDatas.Find(model.Id);
                        entity.Id = model.Id;
                        entity.FirstName = model.FirstName;
                        entity.LastName = model.LastName;
                        entity.Email = model.Email;
                        entity.DOB = model.DOB;
                        entity.Gender = model.Gender;
                        entity.mobile = model.mobile??0;
                        _dbContext.Entry(entity).State = EntityState.Modified;
                        _dbContext.SaveChanges();
                    }
                    else
                    {
                        var entity = new TestData();
                        entity.FirstName = model.FirstName;
                        entity.LastName = model.LastName;
                        entity.Email = model.Email;
                        entity.DOB = model.DOB;
                        entity.City = model.City;
                        entity.Gender = model.Gender;
                        entity.mobile = model.mobile ?? 0;
                        _dbContext.TestDatas.Add(entity);
                        _dbContext.SaveChanges();
                    }
                    return Json(new { result = true }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { result = false, message = "Check Data." }, JsonRequestBehavior.AllowGet);
                }
                
            }
            catch (Exception exception)
            {
                return Json(new { result = false, message = "Something went wrong. Pleas try Again." }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult DataList()
        {
            return View(_dbContext.TestDatas.ToList());
        }
        public ActionResult DeleteData(long id)
        {
            try
            {
                var model = _dbContext.TestDatas.Remove(_dbContext.TestDatas.Find(id));
                _dbContext.SaveChanges();
                return Json(new { result = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(
                    new { result = false, message = "Something went wrong. Please try Again.", exception = e.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}