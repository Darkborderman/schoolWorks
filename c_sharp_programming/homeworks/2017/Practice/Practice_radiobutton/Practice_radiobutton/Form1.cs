using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_radiobutton
{
    public partial class Form1 : Form
    {
        int current;              // 目前顯示的圖像檔順序
        int rate;　　　　　　　　 // 圖像方塊的縮放比例　　
        int wide, high, pX, pY;
        double sec;
        int i;

        public Form1()
        {
            InitializeComponent();
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            label1.Text = (sec -= 0.1).ToString("#.0") + " 秒";
            //label2.Text = Convert.ToString(current);//秒數-0.1並顯示
            if (sec <= 0)   //若剩餘秒數歸零
            {
                sec = 0.5;
                if (i == 1)
                {
                    current++;
                    if (current > 3)
                    {
                        current = 1;
                    }
                }
                if(i == 2)
                {
                    current--;
                    if (current <= 0)
                    {
                        current = 3;
                    }
                }
            }
            FigShow(current,sec);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            pic.SizeMode = PictureBoxSizeMode.Zoom;
            wide = pic.Width;
            high = pic.Height;
            pX = pic.Left;
            pY = pic.Top;
            current = 1;                  // 設定顯示的圖像檔順序為 1
            rate = 80;                    // 設定顯示比例為80%
            FigShow(current,sec);
        }

        private void radiobtn2_Click(object sender, EventArgs e)
        {
            i = 2;
        }

        private void radiobtn1_Click(object sender, EventArgs e)
        {
            i = 1;
        }

        private void FigShow(int i,double sec)
        {
            pic.Image = Image.FromFile(@"C:\Users\PADA\Desktop\1060323_stu_doc\pic\" + current + ".jpg");

            int W = wide * rate / 100;      // 圖片方塊縮放後寬度
            int H = high * rate / 100;      // 圖片方塊縮放後高度
            pic.Size = new Size(W, H);      // 設定圖片方塊的大小
            // 設定圖片方塊顯示的位置，中心位置恆不變
            pic.Location = new Point(pX + (wide - W) / 2, pY + (high - H) / 2);
            

        }

        private void btn_Click(object sender, EventArgs e)
        {
            current = 1; 
            sec = 0.5;   
            timer.Enabled = true;    //計時器啟動
            radiobtn1.Checked = true;
        }
    }
}
