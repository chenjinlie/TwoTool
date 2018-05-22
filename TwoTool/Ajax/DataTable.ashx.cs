using DataSimulator;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TwoTool.Ajax
{
    /// <summary>
    /// DataTable 的摘要说明
    /// </summary>
    public class DataTable : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string con = HttpContext.Current.Request.Params["con"];
            string dataname = HttpContext.Current.Request.Params["databasename"];

            string user = HttpContext.Current.Request.Params["user"];
            string pwd = HttpContext.Current.Request.Params["pwd"];
            //if (!string.IsNullOrEmpty(con))
            //{
            //    HttpContext.Current.Response.Write("con error");
            //}
            //if (!string.IsNullOrEmpty(dataname))
            //{
            //    HttpContext.Current.Response.Write("dataname error");
            //}

            DbHelperSQL.connectionString = "server=" + con + ";database=" + dataname + ";uid=" + user + ";pwd=" + pwd + "";
            DataSet DS = DbHelperSQL.Query("USE [" + dataname + "] SELECT name FROM sys.tables");

            //获取所有库的名字
            for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
            {
                DataSet dsfrom = DbHelperSQL.Query("USE [" + dataname + "] select TABLE_NAME from INFORMATION_SCHEMA.COLUMNS group by TABLE_NAME");
                string table = "";
                table = table + " <div class=" + "tile" + "> <h3 class=" + "tile-title" + ">" + dataname + "</h3>";
                //获取所有表的名字
                for (int j = 0; j < dsfrom.Tables[0].Rows.Count; j++)
                {
                    table = table + "<div class=" + "col-xs-3" + "><h6>" + dsfrom.Tables[0].Rows[j]["TABLE_NAME"].ToString() + "</h6>";
                    DataSet dsfield = DbHelperSQL.Query("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='" + dsfrom.Tables[0].Rows[j]["TABLE_NAME"] + "'");
                    //获取所有字段的名字
                    for (int t = 0; t < dsfield.Tables[0].Rows.Count; t++)
                    {
                        table = table + "<p>" + dsfield.Tables[0].Rows[t]["COLUMN_NAME"] + "</p>";
                    }
                    table = table + "</div>";
                }
                table = table + "</div>";
                //table = table + "< /div>< /div>";
                HttpContext.Current.Response.Write(table);
                HttpContext.Current.Response.End();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}