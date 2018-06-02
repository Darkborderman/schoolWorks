using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hw2
{
    public partial class game : Form
    {
        public game()
        {
            InitializeComponent();
        }

        Button[] btn = new Button[12];
        string[] name = new string[6];
        int[] score = new int[6];
        int[] score_dup = new int[6];
        double[] taketime = new double[6];
        double[] taketime_dup = new double[6];

        string[,] array = new string[6, 3];
        int[] rand = new int[12];
        double sec;
        int count = 0;
        int[,] confirm = new int[2,2];
        int btn_con = 0;

        private void game_Load(object sender, EventArgs e)
        {
            btn[0] = btn1; btn[1] = btn2; btn[2] = btn3;
            btn[3] = btn4; btn[4] = btn5; btn[5] = btn6;
            btn[6] = btn7; btn[7] = btn8; btn[8] = btn9;
            btn[9] = btn10; btn[10] = btn11; btn[11] = btn12;
            btn2.Click += btn1_Click; btn3.Click += btn1_Click;
            btn4.Click += btn1_Click; btn5.Click += btn1_Click;
            btn6.Click += btn1_Click; btn7.Click += btn1_Click;
            btn8.Click += btn1_Click; btn9.Click += btn1_Click;
            btn10.Click += btn1_Click;btn11.Click += btn1_Click;
            btn12.Click += btn1_Click;

            retry.Enabled = false;
            logout.Enabled = false;            

            int j = 0;

            for(int i = 0;i < 12;i++)
            {
                rand[i] = 0;
            }

            for(int i = 0;i < 6; i++)
            {
                score[i] = 0;
                score_dup[i] = 0;
                taketime[i] = 0;
                taketime_dup[i] = 0;
            }

            int found;
            while (j < 12)
            {
                int tempt;
                Random rnd = new Random();
                tempt = rnd.Next(1, 13);
                found = 0;
                for(int i = 0;i <= j;i++)
                {
                    if(tempt == rand[i])
                    {
                        found = 1;
                        break;
                    }           
                }
                if(found == 0)
                {
                    rand[j] = tempt;
                    j++;
                }
            }

            for (int i = 0; i < 12; i++)
            {
                if(rand[i] % 2 == 0)
                {
                    rand[i] = rand[i] - 1;
                }
            }

            for (int i = 0; i < 12; i++)
            {
                btn[i].Enabled = false;
                //btn[i].Text = Convert.ToString(rand[i]);
            }

        }

        private void btn1_Click(object sender, EventArgs e)
        {
            Button btnClick = (Button)sender;
            for(int i = 0;i < 12; i++)
            {
                if(btnClick == btn[i])
                {
                    btnClick.Text = Convert.ToString(rand[i]);
                    if(rand[i] < 4)
                    {
                        btnClick.BackColor = Color.Red;
                    }
                    else if(rand[i] > 4 && rand[i] < 8)
                    {
                        btnClick.BackColor = Color.Yellow;
                    }
                    else if(rand[i] > 8)
                    {
                        btnClick.BackColor = Color.Green;
                    }
                    confirm[btn_con,0] = rand[i];
                    confirm[btn_con, 1] = i;
                    btn_con++;
                    if(btn_con >= 2)
                    {
                        if(confirm[1,0] != confirm[0,0])
                        {
                            btn[confirm[1, 1]].Text = "";
                            btn[confirm[1, 1]].BackColor = Color.WhiteSmoke;
                            btn[confirm[0, 1]].Text = "";
                            btn[confirm[0, 1]].BackColor = Color.WhiteSmoke;
                        }
                        else if(confirm[1, 0] == confirm[0, 0])
                        {
                            count++;
                        }
                        confirm[0, 0] = 0;
                        confirm[0, 1] = 0;
                        confirm[1, 0] = 0;
                        confirm[1, 1] = 0;
                        btn_con = 0;
                    }
                }
            }
        }

        private void log_Click(object sender, EventArgs e)
        {
            login log_in = new login();
            log_in.ShowDialog();
            status.Text = log_in.account_text.Text;
            retry.Enabled = true;
            log.Enabled = false;
            logout.Enabled = true;
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            time.Text = (sec -= 0.1).ToString("#.0"); 
            if (sec <= 0 || count == 6)   //若剩餘秒數歸零
            {
                login log_in = new login();
                timer.Enabled = false;   //計時器關閉
                for (int i = 0; i < 12; i++)
                {
                    btn[i].Enabled = false; //按鈕不能使用
                }

                double time_result = 30 - sec - 0.0000000000002;
                MessageBox.Show("翻出了" + count + "對牌，花費" + time_result + "秒","Result");
                name[5] = status.Text;
                score[5] = count;
                //score_dup[5] = count;
                taketime[5] = time_result;
                for(int i = 0;i < 6; i++)
                {
                    taketime_dup[i] = taketime[i];
                    score_dup[i] = score[i];
                }

                //Array.Sort(taketime, name);
                //Array.Sort(taketime_dup, score);
                Array.Sort(score, name);
                Array.Sort(score_dup, taketime);
                Array.Reverse(name);
                Array.Reverse(score);
                Array.Reverse(taketime);

                int j = 1;
                while(j < 5)
                {
                    for (int i = 0; i < j; i++)
                    {
                        if (score[j] == score[i] && taketime[i] > taketime[j])
                        {

                            string tempt1;
                            double tempt3;

                            tempt1 = name[i];
                            name[i] = name[j];
                            name[j] = tempt1;

                            tempt3 = taketime[i];
                            taketime[i] = taketime[j];
                            taketime[j] = tempt3;
                        }
                    }
                    j++;
                }
                

                result end = new result();
                end.no1name.Text = name[0];
                end.no1score.Text = Convert.ToString(score[0]);
                end.no1time.Text = Convert.ToString(taketime[0]);
                end.no2name.Text = name[1];
                end.no2score.Text = Convert.ToString(score[1]);
                end.no2time.Text = Convert.ToString(taketime[1]);
                end.no3name.Text = name[2];
                end.no3score.Text = Convert.ToString(score[2]);
                end.no3time.Text = Convert.ToString(taketime[2]);
                end.no4name.Text = name[3];
                end.no4score.Text = Convert.ToString(score[3]);
                end.no4time.Text = Convert.ToString(taketime[3]);
                end.no5name.Text = name[4];
                end.no5score.Text = Convert.ToString(score[4]);
                end.no5time.Text = Convert.ToString(taketime[4]);
                end.ShowDialog();
            }
        }

        private void retry_Click(object sender, EventArgs e)
        {
            sec = 30;
            timer.Enabled = true;
            for(int i = 0;i < 12; i++)
            {
                count = 0;
                btn[i].Enabled = true;
                btn[i].Text = "";
                btn[i].BackColor = Color.WhiteSmoke;
            }
        }

        private void logout_Click(object sender, EventArgs e)
        {
            retry.Enabled = false;
            logout.Enabled = false;
            log.Enabled = true;
            timer.Enabled = false;
            time.Text = "30.0";
            for (int i = 0; i < 12; i++)
            {
                count = 0;
                btn[i].Enabled = false;
                btn[i].Text = "";
                btn[i].BackColor = Color.WhiteSmoke;
            }
            status.Text = "";
        }
    }
}
