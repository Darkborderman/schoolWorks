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
    public partial class Form1 : Form
    {
        string[,] array = new string[100, 2];
        int count = 0;

        public Form1()
        {
            InitializeComponent();
        }

        private void login_Click(object sender, EventArgs e)
        {
            Login log = new Login();  // 宣告frmPW為Password表單的物件實體
            log.ShowDialog();             // 用強制回應對話方塊方式來顯示frmPW表單
            add.Enabled = true;          // 設新增文件鈕可以使用
            search.Enabled = true;
            delete.Enabled = true;
            text.Enabled = true;
            logout.Enabled = true;
            login.Enabled = false;
            status.Text = "歡迎回來，admin";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            add.Enabled = false;
            search.Enabled = false;
            delete.Enabled = false;
            text.Enabled = false;
            logout.Enabled = false;
        }

        private void add_Click(object sender, EventArgs e)
        {
            array[count, 0] = text.Text;
            Add newlist = new Add();
            newlist.ShowDialog();
            array[count, 1] = newlist.text.Text;
            text.Clear();
            //label1.Text = array[count, 0];
            //label2.Text = array[count, 1];
            count++;
    }

        private void search_Click(object sender, EventArgs e)
        {
            int i;
            for(i = 0;i < count;i++)
            {
                if(text.Text == array[i,0])
                {
                    MessageBox.Show("學號" + array[i, 0] + "對應的名字是" + array[i,1],"查詢結果");
                    break;
                }
                else if (i == count - 1)
                {
                    MessageBox.Show("查無此人", "查詢結果");
                }
            }
            text.Clear();
        }

        private void delete_Click(object sender, EventArgs e)
        {
            int i;
            int j;
            for (i = 0; i < count; i++)
            {
                if (text.Text == array[i, 0])
                {
                    MessageBox.Show("資料已刪除", "刪除結果");
                    for(j = i;j < count - 1;j++)
                    {
                        array[j, 0] = array[j + 1, 0];
                        array[j, 1] = array[j + 1, 1];
                    }
                    count--;
                    break;
                }
                else if (i == count - 1)
                {
                    MessageBox.Show("查無此人", "刪除結果");
                }
            }
            text.Clear();
        }

        private void logout_Click(object sender, EventArgs e)
        {
            add.Enabled = false;
            search.Enabled = false;
            delete.Enabled = false;
            text.Enabled = false;
            logout.Enabled = false;
            login.Enabled = true;
            status.Text = "尚未登入";
        }
    }
}
