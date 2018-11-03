using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PatuhService.ViewModels
{
    public class ArticleReportViewModel
    {
        public long Id { get; set; }
        public long ArticleId {get;set;}
        public string ReportCategory { get; set; }
        public string ReportDesc { get; set; }
        public string cStatus { get; set; }

        public string cCreated { get; set; }
        public DateTime? dCreated { get; set; }
        public string cLastUpdated { get; set; }
        public DateTime? dLastUpdated { get; set; }
    }
}