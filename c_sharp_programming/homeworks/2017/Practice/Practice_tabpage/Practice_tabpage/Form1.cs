using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_tabpage
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            progressBar1.Step = 1;       // 設定進度列每次的增量為1
            progressBar1.Maximum = 100;
            progressBar1.Minimum = 0;
            tabControl2.Hide();
            textBox2.PasswordChar = '*';

            textBox3.Text = "86";
            textBox4.Text = "86.53";
            textBox5.Text = "5";

            textBox8.Text = "90";
            textBox7.Text = "94.87";
            textBox6.Text = "10";
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void progressBar1_Click(object sender, EventArgs e)
        {

        }

        private void login_Click(object sender, EventArgs e)
        {
            for(int i = 0;i < 101; i++)
            {
                progressBar1.Value = i;
                if((i % 5) == 0)
                {
                    Thread.Sleep(100);                  
                }
            }
            tabControl1.Hide();
            tabControl2.Show();


        }
    }
}
