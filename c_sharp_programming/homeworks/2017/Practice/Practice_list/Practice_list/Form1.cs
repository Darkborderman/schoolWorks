using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practice_list
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int i = 0;
        string[,] array = new string[100, 4];

        private void login_Click(object sender, EventArgs e)
        {
            if (accountBox.Text == "zayn" && pswdBox.Text == "123456")
            {
                add.Visible = true;
                search.Visible = true;
                delete.Visible = true;
                log_out.Visible = true;
                delete_list.Visible = false;
                confirm.Visible = true;
                login.Visible = false;
                confirm.Visible = false;
                searchBtn.Visible = false;
                account.Visible = false;
                accountBox.Visible = false;
                passwd.Visible = false;
                pswdBox.Visible = false;
                label1.Visible = false;
                label2.Visible = false;
                label3.Visible = false;
            }

            else
            {
                accountBox.Clear();
                pswdBox.Clear();
                MessageBox.Show("Error!!!");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            login.Visible = true;
            add.Visible = false;
            search.Visible = false;
            delete.Visible = false;
            log_out.Visible = false;
            delete_list.Visible = false;
            confirm.Visible = false;
            searchBtn.Visible = false;

            account.Visible = true;
            accountBox.Visible = true;
            passwd.Visible = true;
            pswdBox.Visible = true;
            id.Visible = false;
            idBox.Visible = false;
            gender.Visible = false;
            genderBox.Visible = false;
            phone.Visible = false;
            phoneBox.Visible = false;
            address.Visible = false;
            addressBox.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;

            pswdBox.PasswordChar = '*';
            pswdBox.Text = "";
            accountBox.Text = "";
            label1.Text = "";
            label2.Text = "";
            label3.Text = "";
        }

        private void confirm_Click(object sender, EventArgs e)
        {
            if(i > 99)
            {
                label1.Text = "資料已達上限，無法儲存";
                label2.Text = "";
                idBox.Clear();
                genderBox.Clear();
                phoneBox.Clear();
                addressBox.Clear();
            }

            else if(idBox.Text.Length >= 1 && genderBox.Text.Length >= 1 && phoneBox.Text.Length >= 1 && addressBox.Text.Length >= 1)
            {
                array[i, 0] = idBox.Text;
                array[i, 1] = genderBox.Text;
                array[i, 2] = phoneBox.Text;
                array[i, 3] = addressBox.Text;
                i++;
                label1.Text = "資料已存入!!";
                label2.Text = "目前已存有" + i +"筆資料";
                idBox.Clear();
                genderBox.Clear();
                phoneBox.Clear();
                addressBox.Clear();
            }

            else
            {
                label1.Text = "各欄位不能為空，請重新輸入";
                label2.Text = "";
                idBox.Clear();
                genderBox.Clear();
                phoneBox.Clear();
                addressBox.Clear();
            }
        }

        private void add_Click(object sender, EventArgs e)
        {
            id.Visible = true;
            idBox.Visible = true;
            gender.Visible = true;
            genderBox.Visible = true;
            phone.Visible = true;
            phoneBox.Visible = true;
            address.Visible = true;
            addressBox.Visible = true;
            confirm.Visible = true;
            delete_list.Visible = false;
            searchBtn.Visible = false;
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = false;

        }

        private void search_Click(object sender, EventArgs e)
        {
            id.Visible = true;
            idBox.Visible = true;
            searchBtn.Visible = true;
            gender.Visible = false;
            genderBox.Visible = false;
            phone.Visible = false;
            phoneBox.Visible = false;
            address.Visible = false;
            addressBox.Visible = false;
            confirm.Visible = false;
            delete_list.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = true;

        }

        private void searchBtn_Click(object sender, EventArgs e)
        {
            int j;
            for(j = 0;j <= i; j++)
            {
                if(idBox.Text == array[j, 0] && idBox.Text.Length >= 1)
                {
                    gender.Visible = true;
                    genderBox.Visible = true;
                    genderBox.Text = array[j, 1];
                    phone.Visible = true;
                    phoneBox.Visible = true;
                    phoneBox.Text = array[j, 2];
                    address.Visible = true;
                    addressBox.Visible = true;
                    addressBox.Text = array[j, 3];
                    confirm.Visible = false;
                    delete_list.Visible = false;
                    label1.Visible = false;
                    label2.Visible = false;
                    label3.Text = "";
                    break;
                }

                else if(j == i)
                {
                    idBox.Clear();
                    genderBox.Clear();
                    phoneBox.Clear();
                    addressBox.Clear();
                    label3.Text = "查無此資料";
                    gender.Visible = false;
                    genderBox.Visible = false;
                    phone.Visible = false;
                    phoneBox.Visible = false;
                    address.Visible = false;
                    addressBox.Visible = false;
                    break;
                }

                else if(idBox.Text == "")
                {
                    idBox.Clear();
                    genderBox.Clear();
                    phoneBox.Clear();
                    addressBox.Clear();
                    label3.Text = "欄位不能為空";
                    gender.Visible = false;
                    genderBox.Visible = false;
                    phone.Visible = false;
                    phoneBox.Visible = false;
                    address.Visible = false;
                    addressBox.Visible = false;
                    break;
                }
            }
        }

        private void delete_Click(object sender, EventArgs e)
        {
            id.Visible = true;
            idBox.Visible = true;
            searchBtn.Visible = false;
            delete_list.Visible = true;
            gender.Visible = false;
            genderBox.Visible = false;
            phone.Visible = false;
            phoneBox.Visible = false;
            address.Visible = false;
            addressBox.Visible = false;
            confirm.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = true;
        }

        private void delete_list_Click(object sender, EventArgs e)
        {
            int j;
            for (j = 0; j <= i; j++)
            {
                if (idBox.Text == array[j, 0])
                {
                    int p;
                    for(p = j;p < i; p++)
                    {
                        array[p, 0] = array[p + 1, 0];
                        array[p, 1] = array[p + 1, 1];
                        array[p, 2] = array[p + 1, 2];
                        array[p, 3] = array[p + 1, 3];
                    }
                    i--;
                    label3.Text = "刪除成功";
                    gender.Visible = false;
                    genderBox.Visible = false;
                    phone.Visible = false;
                    phoneBox.Visible = false;
                    address.Visible = false;
                    addressBox.Visible = false;
                    confirm.Visible = false;
                    delete_list.Visible = false;
                    label1.Visible = false;
                    label2.Visible = false;
                    break;

                }

                else if (j == i)
                {
                    idBox.Clear();
                    genderBox.Clear();
                    phoneBox.Clear();
                    addressBox.Clear();
                    label3.Text = "無此資料";
                    gender.Visible = false;
                    genderBox.Visible = false;
                    phone.Visible = false;
                    phoneBox.Visible = false;
                    address.Visible = false;
                    addressBox.Visible = false;
                    break;
                }

                else if(idBox.Text == "")
                {
                    idBox.Clear();
                    genderBox.Clear();
                    phoneBox.Clear();
                    addressBox.Clear();
                    label3.Text = "欄位不能為空";
                    gender.Visible = false;
                    genderBox.Visible = false;
                    phone.Visible = false;
                    phoneBox.Visible = false;
                    address.Visible = false;
                    addressBox.Visible = false;
                    break;
                }
            }
        }

        private void log_out_Click(object sender, EventArgs e)
        {
            login.Visible = true;
            add.Visible = false;
            search.Visible = false;
            delete.Visible = false;
            log_out.Visible = false;
            delete_list.Visible = false;
            confirm.Visible = false;
            searchBtn.Visible = false;

            account.Visible = true;
            accountBox.Visible = true;
            passwd.Visible = true;
            pswdBox.Visible = true;
            id.Visible = false;
            idBox.Visible = false;
            gender.Visible = false;
            genderBox.Visible = false;
            phone.Visible = false;
            phoneBox.Visible = false;
            address.Visible = false;
            addressBox.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;

            pswdBox.PasswordChar = '*';
            pswdBox.Text = "";
            accountBox.Text = "";
            label1.Text = "";
            label2.Text = "";
            label3.Text = "";
        }
    }
}
