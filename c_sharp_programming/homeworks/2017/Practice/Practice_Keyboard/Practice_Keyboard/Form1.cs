using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_Keyboard
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.KeyPreview = true;
            label_mouse.Text = "Press";
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            label_mouse.Text = "按了" + e.Button + "於 X:" + e.X + ", Y:" + e.Y;
        }

        private void Form1_KeyPress(object sender, KeyPressEventArgs e)
        {

        }

        private void Form1_KeyUp(object sender, KeyEventArgs e)
        {
            label_key.Text = "按了" + e.KeyCode + ",鍵碼:" + e.KeyValue;
        }
    }
}
