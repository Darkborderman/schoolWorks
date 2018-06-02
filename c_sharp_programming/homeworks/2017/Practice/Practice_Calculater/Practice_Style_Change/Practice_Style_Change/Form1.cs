using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_Style_Change
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            float a = float.Parse(Div.Text);
            float b = float.Parse(BDiv.Text);
            float ans;
            ans = b / a;
            Ans.Text = "答案是" + ans.ToString("#,#.0");
        }
    }
}
