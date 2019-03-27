using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Test_Application.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        private readonly Test_DBEntities _dbContext = new Test_DBEntities();
        protected override void OnException(ExceptionContext filterContext)
        {

            ViewResult view = new ViewResult();
            view.ViewName = "Error";
            filterContext.Result = view;
            filterContext.ExceptionHandled = true;
            //---Log---

            Exception ex = filterContext.Exception;
            var sb = new StringBuilder();
            var context = System.Web.HttpContext.Current;
            var exceptionType = ex.GetType().ToString();
            var exceptionTypeSplit = exceptionType.Split('.');

            exceptionType = exceptionTypeSplit[exceptionTypeSplit.Length - 1];

            sb.Append(exceptionType).Append(": ").Append(ex.Message);
            sb.Append(ex.StackTrace);

            var innerException = ex.InnerException;
            if (innerException != null)
            {
                var innerExType = innerException.GetType().ToString();
                var innerExTypeTypeSplit = innerExType.Split('.');
                innerExType = innerExTypeTypeSplit[innerExTypeTypeSplit.Length - 1];

                sb.Append("\r\nINNER EXCEPTION: ").Append(innerExType).Append(": ")
                    .Append(innerException.Message).Append(innerException.StackTrace);
            }

          
            var logEntity = new ErrorLog()
            {
                IP_Address = Request.UserHostAddress,
                Message = sb.ToString(),
                
                Date= DateTime.UtcNow,               
            };

            try
            {
                _dbContext.ErrorLogs.Add(logEntity);
                _dbContext.SaveChanges();
                
                //logEntity.ErrorId can also be made use of in any way.
            }
            catch
            {
                // Email logic
            }

        }
    }
}