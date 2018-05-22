using DataSimulator;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTool.Design
{
    public partial class PictureTool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater_item.DataSource = GetToolInfo();
                Repeater_item.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void Repeater_item_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                int width = Convert.ToInt32((e.Item.FindControl("kuan") as TextBox).Text);
                int height = Convert.ToInt32((e.Item.FindControl("gao") as TextBox).Text);
                string name = (e.Item.FindControl("hid") as HiddenField).Value;
                generate(width, height, name);
            }
        }

        protected void Repeater_item_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        /// <summary>
        /// 查询数
        /// </summary>
        private DataTable GetToolInfo()
        {
            string con = "server = 10.1.0.28; database = Tool; uid = sa; pwd = frontfree";
            DbHelperSQL.connectionString = con;

            string path = @"\\10.1.0.28\Design\";



            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(path);

            System.IO.FileInfo[] files = dir.GetFiles(); //获取所有文件信息

            //获取文件前清空数据库的数据
            DbHelperSQL.Query("truncate table Design_IMG");

            foreach (System.IO.FileInfo file in files)
            {
                string ss = path + file.Name;

                if (file.Name != "Thumbs.db")
                {
                    //Image img = Image.FromFile();
                    System.Drawing.Image img = System.Drawing.Image.FromFile(ss);
                    string width = img.Width.ToString();
                    string height = img.Height.ToString();

                    string sqlX = "INSERT INTO [dbo].[Design_IMG]([Name],[Width],[Height]) VALUES('" + file.Name + "','" + width + "','" + height + "')";
                    DataSet Ds = DbHelperSQL.Query(sqlX);

                }
            }
            string sql = "";
            DataSet ds = DbHelperSQL.Query("SELECT [ID],[Name],[Width],[Height] FROM [dbo].[Design_IMG]");
            return ds.Tables[0];

        }

        /// <summary>
        /// 裁剪图片的方法
        /// </summary>
        /// <param name="width">宽</param>
        /// <param name="height">高</param>
        /// <param name="name">路径加名称</param>
        private void generate(int width,int height,string name) {
            string path = @"\\10.1.0.28\Design\";
            string imgpath = @"\\10.1.0.28\img\";

            System.Drawing.Image serverImage = System.Drawing.Image.FromFile(path + name);

            //画板大小
            int towidth = width;
            int toheight = height;
            //缩略图矩形框的像素点
            int x = 0;
            int y = 0;
            int ow = serverImage.Width;
            int oh = serverImage.Height;

            if (ow > oh)
            {
                toheight = serverImage.Height * towidth / serverImage.Width;
            }
            else
            {
                towidth = serverImage.Width * toheight / serverImage.Height;
            }
            //新建一个bmp图片
            System.Drawing.Image bm = new System.Drawing.Bitmap(towidth, toheight);
            //新建一个画板
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bm);
            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            //清空画布并以透明背景色填充
            g.Clear(System.Drawing.Color.White);
            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(serverImage, new System.Drawing.Rectangle((towidth - towidth) / 2, (towidth - toheight) / 2, towidth, toheight),
                0, 0, ow, oh,
                System.Drawing.GraphicsUnit.Pixel);
            //try
            //{
            //以jpg格式保存缩略图
            bm.Save(imgpath + name, System.Drawing.Imaging.ImageFormat.Jpeg);
            bm.Dispose();
            Response.Write("<script>alert('修改生成成功，目录为" + name + "')</script>");
        }

    }
}