using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web;
using System.IO;
using PatuhService.ViewModels;
using PatuhService.Models;
using PatuhService.Utils;
using System.Net.Http.Headers;
using PagedList;

namespace PatuhService.Controllers
{
    public class ArticleReportController : ApiController
    {
       

        // GET api/values
        public IList<ArticleViewModel> Get()
        {
            IList<ArticleViewModel> articleViewModels = new List<ArticleViewModel>();
            using (PatuhEntities db = new PatuhEntities())
            {
                IList<TrArticle> articles = db.TrArticles.Where(x => x.Id != 0 && x.Category == "ARTICLE").ToList();


                foreach (TrArticle article in articles)
                {
                    ArticleViewModel articleViewModel = new ArticleViewModel();
                    articleViewModel.Id = article.Id;
                    articleViewModel.Title = article.Title;
                    articleViewModel.Category = article.Category;
                    articleViewModel.Story = article.Story;
                    articleViewModel.GPSLocation = article.GPSLocation;
                    articleViewModel.GPSLong = article.GPSLong;
                    articleViewModel.GPSLat = article.GPSLat;
                    articleViewModel.ImageIds = db.TrImageAttachments.Where(x => x.HeaderId == article.Id).Select(y => y.Id).ToArray();

                    articleViewModel.cCreated = article.cCreated;
                    articleViewModel.dCreated = article.dCreated;
                    articleViewModel.cLastUpdated = article.cLastUpdated;
                    articleViewModel.dLastUpdated = article.dLastUpdated;

                    articleViewModels.Add(articleViewModel);
                }
            }
            return articleViewModels;
        }



        // POST api/values

        public object Post([FromBody]ArticleReportViewModel trArticleReport)
        {
            JsonResultViewModel result = new JsonResultViewModel();
            result.status = true;
            result.message = "Article successfully reported";
            result.messageCode = "S";

            var httpRequest = HttpContext.Current.Request;
            
            try
            {
                using (PatuhEntities db = new PatuhEntities())
                {
                    TrArticleReport articleReport = db.TrArticleReports.Where(x => x.ArticleId == trArticleReport.ArticleId && x.cCreated == trArticleReport.cCreated).FirstOrDefault();

                    if (articleReport == null)
                    {
                        articleReport = new TrArticleReport();
                        articleReport.ArticleId = trArticleReport.ArticleId;
                        articleReport.ReportCategory = trArticleReport.ReportCategory;
                        articleReport.ReportDesc = trArticleReport.ReportDesc;
                        articleReport.cStatus = trArticleReport.cStatus;
                        articleReport.cCreated = trArticleReport.cCreated;
                        articleReport.dCreated = DateTime.Now;
                        db.TrArticleReports.AddObject(articleReport);
                    }

                    articleReport.cLastUpdated = trArticleReport.cLastUpdated;
                    articleReport.dLastUpdated = DateTime.Now;

                    db.SaveChanges();
                    
                }
            }
            catch (Exception e)
            {
                result.status = false;
                result.message = e.Message;
                result.messageCode = "Error in reporting Article";
            }

            return result;

        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}