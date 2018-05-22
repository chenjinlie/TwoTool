using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSimulator;

namespace TwoTool
{
    public partial class Ac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void id_Click(object sender, EventArgs e)
        {
            DbHelperSQL.connectionString = "server=10.0.0.3;database=MilestoneDB;uid=sa;pwd=frontfree";

            string fingerId = this.finger.Value;
            DataSet ds = DbHelperSQL.Query("SELECT [AtteID],[FingerID],[WorkTime],[HomeTime],[WorkDate],[AtteType],[WorkStati] FROM [MilestoneDB].[dbo].[Attendance] where FingerID=" + fingerId);
            ds.Tables[0].Columns.Add("test", typeof(string));
            ds.Tables[0].Columns.Add("time", typeof(double));
            DataRow dr = ds.Tables[0].NewRow();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string ssss = ds.Tables[0].Rows[i]["WorkStati"].ToString();
                if (ssss != null && ssss != "")
                {
                    ds.Tables[0].Rows[i]["time"] = double.Parse(ds.Tables[0].Rows[i]["WorkStati"].ToString()) / 3600.00;
                }
                string att = ds.Tables[0].Rows[i]["AtteType"].ToString();
                if (att == "99")
                {
                    //dr["test"] = "正常";

                    ds.Tables[0].Rows[i]["test"] = "正常";
                }
                else if (att == "100")
                {
                    //dr["test"] = "病假";

                    ds.Tables[0].Rows[i]["test"] = "忘打卡";
                }
                else if (att == "98")
                {
                    //dr["test"] = "病假";

                    ds.Tables[0].Rows[i]["test"] = "周末加班";
                }
                else if (att == "1")
                {
                    //dr["test"] = "外勤";

                    ds.Tables[0].Rows[i]["test"] = "外勤";
                }
                else if (att == "2")
                {
                    //dr["test"] = "加班";

                    ds.Tables[0].Rows[i]["test"] = "加班";
                }
                else if (att == "9")
                {
                    //dr["test"] = "调休";

                    ds.Tables[0].Rows[i]["test"] = "调休";
                }
                else if (att == "96")
                {
                    //dr["test"] = "迟到";

                    ds.Tables[0].Rows[i]["test"] = "迟到";
                }
                else if (att == "4")
                {
                    //dr["test"] = "病假";

                    ds.Tables[0].Rows[i]["test"] = "病假";
                }
                else if (att == "3")
                {
                    //dr["test"] = "请假";

                    ds.Tables[0].Rows[i]["test"] = "请假";
                }
                //ds.Tables[0].Rows.Add(dr);
            }
            DataTable dt = ds.Tables[0];
            rep.DataSource = ds;
            rep.DataBind();
        }
    }
}