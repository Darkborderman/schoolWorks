using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_multipleFormList
{
    public partial class Add : Form
    {
        public Add()
        {
            InitializeComponent();
        }

        private void btn_cancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_yes_Click(object sender, EventArgs e)
        {
            MessageBox.Show("新增成功","成功");
            this.Close();
        }
    }
}
