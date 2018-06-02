using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_WindowsStyleChange
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btn1_Click(object sender, EventArgs e)
        {
            title.BackColor = Color.Yellow;
            title.Font = new Font("微軟正黑體", 18, FontStyle.Bold);
            subtitle.Font = new Font("微軟正黑體", 14, FontStyle.Bold);
            content.BackColor = Color.White;
            button.TextAlign = ContentAlignment.BottomLeft;
            pictureBox.BackColor = Color.White;
        }

        private void btn2_Click(object sender, EventArgs e)
        {
            title.BackColor = Color.Transparent;
            title.Font = new Font("新細明體", 18, FontStyle.Underline);
            subtitle.Font = new Font("新細明體", 14, FontStyle.Italic);
            content.BackColor = Color.Brown;
            button.TextAlign = ContentAlignment.MiddleRight;
            pictureBox.BackColor = Color.Blue;
        }
    }
}
