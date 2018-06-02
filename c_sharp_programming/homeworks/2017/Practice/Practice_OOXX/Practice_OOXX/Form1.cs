using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_OOXX
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Button[] btn = new Button[9];
        int count = 0;
        double sec;

        private void Form1_Load(object sender, EventArgs e)
        {
            btn[0] = btn1; btn[1] = btn2; btn[2] = btn3;//指定按鈕物件陣列元素
            btn[3] = btn4; btn[4] = btn5; btn[5] = btn6;
            btn[6] = btn7; btn[7] = btn8; btn[8] = btn9;
            btn2.Click += btn1_Click; btn3.Click += btn1_Click;//訂閱共享事件
            btn4.Click += btn1_Click; btn5.Click += btn1_Click;
            btn6.Click += btn1_Click; btn7.Click += btn1_Click;
            btn8.Click += btn1_Click; btn9.Click += btn1_Click;
        }

        private void btn1_Click(object sender, EventArgs e)
        {
            Button btnClick = (Button)sender;   //將sender轉型為按鈕物件btnClick
            if (count % 2 > 0)   //若按鈕文字為X
            {
                btnClick.Text = "X"; //按鈕文字清空
                count++;
            }
            else if(count % 2 == 0)
            {
                btnClick.Text = "O";
                count++;
            }
            int q = 0;
            if (count > 4)
            {
                int j = 0;
                int p = 4;
                for(j = 0;j < 3; j++)
                {
                    if (btn[j].Text == btn[j + 3].Text && btn[j + 3].Text == btn[j + 6].Text)
                    {
                        MessageBox.Show(btn[j].Text + "獲勝");
                        q = 1;
                        timer.Enabled = false;

                    }
                    else if (btn[j * 3].Text == btn[j * 3 + 1].Text && btn[j * 3 + 1].Text == btn[j * 3 + 2].Text)
                    {
                        MessageBox.Show(btn[j].Text + "獲勝");
                        q = 1;
                        timer.Enabled = false;
                    }
                    else if((btn[p].Text == btn[p - 4].Text && btn[p].Text == btn[p + 4].Text) || (btn[p].Text == btn[p - 2].Text && btn[p].Text == btn[p + 2].Text))
                    {
                        MessageBox.Show(btn[p].Text + "獲勝");
                        q = 1;
                        timer.Enabled = false;
                    }
                    else
                    {
                        timer.Enabled = true;
                    }
                }
                
            }
            if(count == 9 && q == 0)
            {
                timer.Enabled = false;
                MessageBox.Show("沒有人獲勝");
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        private void timer_Tick(object sender, EventArgs e)
        {
            label_time.Text = (sec -= 0.1).ToString("#.0") + " 秒"; //秒數-0.1並顯示
            if (sec <= 0)   //若剩餘秒數歸零
            {
                timer.Enabled = false;   //計時器關閉
                for (int i = 0; i < 9; i++)
                {
                    btn[i].Enabled = false; //按鈕不能使用
                }
                btn_reset.Enabled = true;//開始鈕可以使用
            }
        }

        private void btn_reset_Click(object sender, EventArgs e)
        {
            count = 0;  //預設擊中和失誤次數都為0
            for (int i = 0; i < 9; i++)
            {
                btn[i].Text = "";
                btn[i].Enabled = true;//可以使用
            }
            sec = 30;   //設剩餘秒數為30
            timer.Enabled = true;    //計時器啟動
        }
    }
}
