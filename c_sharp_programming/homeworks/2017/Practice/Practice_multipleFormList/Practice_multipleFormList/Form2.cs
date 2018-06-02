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
    public partial class Login : Form
    {

        int num = 0;
        public Login()
        {
            InitializeComponent();
        }

        private void pass_text_TextChanged(object sender, EventArgs e)
        {

        }

        private void btn_log_Click(object sender, EventArgs e)
        {
            num++;
            if (account_text.Text == "admin" && pass_text.Text == "0000")
                this.Close();   // 關閉目前(frmPW)表單
            else
            {
                if (num < 3)   // 若輸入次數<3
                {
                    DialogResult result = MessageBox.Show("是否再輸入？",
                      "密碼錯誤", MessageBoxButtons.YesNo);
                    if (result == DialogResult.Yes)
                    {
                        account_text.Clear();
                        pass_text.Clear();    // 清空文字方塊
                        account_text.Focus();     // 使txtID成為作用物件
                    }
                    else
                        Application.Exit();  // 使用者不想輸入結束程式
                }
                else
                    Application.Exit();       // 輸入次數=3結束程式
            }
        }

        private void btn_cancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
