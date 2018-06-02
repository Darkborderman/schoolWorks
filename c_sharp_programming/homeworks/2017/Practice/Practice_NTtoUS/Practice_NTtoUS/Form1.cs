using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_NTtoUS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            label3.Text = "可兌換:" + (0.0 + float.Parse(textBox1.Text)) * 33 + "台幣";
        }

private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
