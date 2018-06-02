namespace Practice_list
{
    partial class Form1
    {
        /// <summary>
        /// 設計工具所需的變數。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清除任何使用中的資源。
        /// </summary>
        /// <param name="disposing">如果應該處置 Managed 資源則為 true，否則為 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 設計工具產生的程式碼

        /// <summary>
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器修改
        /// 這個方法的內容。
        /// </summary>
        private void InitializeComponent()
        {
            this.account = new System.Windows.Forms.Label();
            this.accountBox = new System.Windows.Forms.TextBox();
            this.passwd = new System.Windows.Forms.Label();
            this.pswdBox = new System.Windows.Forms.TextBox();
            this.login = new System.Windows.Forms.Button();
            this.id = new System.Windows.Forms.Label();
            this.idBox = new System.Windows.Forms.TextBox();
            this.gender = new System.Windows.Forms.Label();
            this.phone = new System.Windows.Forms.Label();
            this.address = new System.Windows.Forms.Label();
            this.genderBox = new System.Windows.Forms.TextBox();
            this.phoneBox = new System.Windows.Forms.TextBox();
            this.addressBox = new System.Windows.Forms.TextBox();
            this.add = new System.Windows.Forms.Button();
            this.search = new System.Windows.Forms.Button();
            this.delete = new System.Windows.Forms.Button();
            this.log_out = new System.Windows.Forms.Button();
            this.confirm = new System.Windows.Forms.Button();
            this.delete_list = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.searchBtn = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // account
            // 
            this.account.AutoSize = true;
            this.account.Font = new System.Drawing.Font("新細明體", 12F);
            this.account.Location = new System.Drawing.Point(225, 234);
            this.account.Name = "account";
            this.account.Size = new System.Drawing.Size(52, 16);
            this.account.TabIndex = 0;
            this.account.Text = "帳號 : ";
            // 
            // accountBox
            // 
            this.accountBox.Font = new System.Drawing.Font("新細明體", 12F);
            this.accountBox.Location = new System.Drawing.Point(279, 231);
            this.accountBox.Name = "accountBox";
            this.accountBox.Size = new System.Drawing.Size(100, 27);
            this.accountBox.TabIndex = 1;
            // 
            // passwd
            // 
            this.passwd.AutoSize = true;
            this.passwd.Font = new System.Drawing.Font("新細明體", 12F);
            this.passwd.Location = new System.Drawing.Point(225, 275);
            this.passwd.Name = "passwd";
            this.passwd.Size = new System.Drawing.Size(48, 16);
            this.passwd.TabIndex = 2;
            this.passwd.Text = "密碼 :";
            // 
            // pswdBox
            // 
            this.pswdBox.Font = new System.Drawing.Font("新細明體", 12F);
            this.pswdBox.Location = new System.Drawing.Point(279, 272);
            this.pswdBox.Name = "pswdBox";
            this.pswdBox.Size = new System.Drawing.Size(100, 27);
            this.pswdBox.TabIndex = 3;
            // 
            // login
            // 
            this.login.Location = new System.Drawing.Point(294, 305);
            this.login.Name = "login";
            this.login.Size = new System.Drawing.Size(75, 23);
            this.login.TabIndex = 4;
            this.login.Text = "登入";
            this.login.UseVisualStyleBackColor = true;
            this.login.Click += new System.EventHandler(this.login_Click);
            // 
            // id
            // 
            this.id.AutoSize = true;
            this.id.Font = new System.Drawing.Font("新細明體", 12F);
            this.id.Location = new System.Drawing.Point(173, 9);
            this.id.Name = "id";
            this.id.Size = new System.Drawing.Size(100, 16);
            this.id.TabIndex = 5;
            this.id.Text = "身分證字號 : ";
            // 
            // idBox
            // 
            this.idBox.Location = new System.Drawing.Point(280, 9);
            this.idBox.Name = "idBox";
            this.idBox.Size = new System.Drawing.Size(100, 22);
            this.idBox.TabIndex = 6;
            // 
            // gender
            // 
            this.gender.AutoSize = true;
            this.gender.Font = new System.Drawing.Font("新細明體", 12F);
            this.gender.Location = new System.Drawing.Point(225, 55);
            this.gender.Name = "gender";
            this.gender.Size = new System.Drawing.Size(48, 16);
            this.gender.TabIndex = 7;
            this.gender.Text = "性別 :";
            // 
            // phone
            // 
            this.phone.AutoSize = true;
            this.phone.Font = new System.Drawing.Font("新細明體", 12F);
            this.phone.Location = new System.Drawing.Point(225, 98);
            this.phone.Name = "phone";
            this.phone.Size = new System.Drawing.Size(48, 16);
            this.phone.TabIndex = 8;
            this.phone.Text = "電話 :";
            // 
            // address
            // 
            this.address.AutoSize = true;
            this.address.Font = new System.Drawing.Font("新細明體", 12F);
            this.address.Location = new System.Drawing.Point(225, 146);
            this.address.Name = "address";
            this.address.Size = new System.Drawing.Size(48, 16);
            this.address.TabIndex = 9;
            this.address.Text = "地址 :";
            // 
            // genderBox
            // 
            this.genderBox.Location = new System.Drawing.Point(280, 48);
            this.genderBox.Name = "genderBox";
            this.genderBox.Size = new System.Drawing.Size(100, 22);
            this.genderBox.TabIndex = 10;
            // 
            // phoneBox
            // 
            this.phoneBox.Location = new System.Drawing.Point(280, 98);
            this.phoneBox.Name = "phoneBox";
            this.phoneBox.Size = new System.Drawing.Size(100, 22);
            this.phoneBox.TabIndex = 11;
            // 
            // addressBox
            // 
            this.addressBox.Location = new System.Drawing.Point(279, 146);
            this.addressBox.Name = "addressBox";
            this.addressBox.Size = new System.Drawing.Size(100, 22);
            this.addressBox.TabIndex = 12;
            // 
            // add
            // 
            this.add.Location = new System.Drawing.Point(584, 7);
            this.add.Name = "add";
            this.add.Size = new System.Drawing.Size(75, 23);
            this.add.TabIndex = 13;
            this.add.Text = "新增";
            this.add.UseVisualStyleBackColor = true;
            this.add.Click += new System.EventHandler(this.add_Click);
            // 
            // search
            // 
            this.search.Location = new System.Drawing.Point(584, 46);
            this.search.Name = "search";
            this.search.Size = new System.Drawing.Size(75, 23);
            this.search.TabIndex = 14;
            this.search.Text = "查詢";
            this.search.UseVisualStyleBackColor = true;
            this.search.Click += new System.EventHandler(this.search_Click);
            // 
            // delete
            // 
            this.delete.Location = new System.Drawing.Point(584, 96);
            this.delete.Name = "delete";
            this.delete.Size = new System.Drawing.Size(75, 23);
            this.delete.TabIndex = 15;
            this.delete.Text = "刪除";
            this.delete.UseVisualStyleBackColor = true;
            this.delete.Click += new System.EventHandler(this.delete_Click);
            // 
            // log_out
            // 
            this.log_out.Location = new System.Drawing.Point(584, 146);
            this.log_out.Name = "log_out";
            this.log_out.Size = new System.Drawing.Size(75, 23);
            this.log_out.TabIndex = 16;
            this.log_out.Text = "登出";
            this.log_out.UseVisualStyleBackColor = true;
            this.log_out.Click += new System.EventHandler(this.log_out_Click);
            // 
            // confirm
            // 
            this.confirm.Location = new System.Drawing.Point(443, 146);
            this.confirm.Name = "confirm";
            this.confirm.Size = new System.Drawing.Size(75, 23);
            this.confirm.TabIndex = 17;
            this.confirm.Text = "確認";
            this.confirm.UseVisualStyleBackColor = true;
            this.confirm.Click += new System.EventHandler(this.confirm_Click);
            // 
            // delete_list
            // 
            this.delete_list.Location = new System.Drawing.Point(443, 7);
            this.delete_list.Name = "delete_list";
            this.delete_list.Size = new System.Drawing.Size(75, 23);
            this.delete_list.TabIndex = 18;
            this.delete_list.Text = "確認刪除";
            this.delete_list.UseVisualStyleBackColor = true;
            this.delete_list.Click += new System.EventHandler(this.delete_list_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(443, 176);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 12);
            this.label1.TabIndex = 19;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(443, 192);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 12);
            this.label2.TabIndex = 20;
            // 
            // searchBtn
            // 
            this.searchBtn.Location = new System.Drawing.Point(443, 37);
            this.searchBtn.Name = "searchBtn";
            this.searchBtn.Size = new System.Drawing.Size(75, 23);
            this.searchBtn.TabIndex = 21;
            this.searchBtn.Text = "搜尋";
            this.searchBtn.UseVisualStyleBackColor = true;
            this.searchBtn.Click += new System.EventHandler(this.searchBtn_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(176, 29);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(0, 12);
            this.label3.TabIndex = 22;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(692, 340);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.searchBtn);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.delete_list);
            this.Controls.Add(this.confirm);
            this.Controls.Add(this.log_out);
            this.Controls.Add(this.delete);
            this.Controls.Add(this.search);
            this.Controls.Add(this.add);
            this.Controls.Add(this.addressBox);
            this.Controls.Add(this.phoneBox);
            this.Controls.Add(this.genderBox);
            this.Controls.Add(this.address);
            this.Controls.Add(this.phone);
            this.Controls.Add(this.gender);
            this.Controls.Add(this.idBox);
            this.Controls.Add(this.id);
            this.Controls.Add(this.login);
            this.Controls.Add(this.pswdBox);
            this.Controls.Add(this.passwd);
            this.Controls.Add(this.accountBox);
            this.Controls.Add(this.account);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label account;
        private System.Windows.Forms.TextBox accountBox;
        private System.Windows.Forms.Label passwd;
        private System.Windows.Forms.TextBox pswdBox;
        private System.Windows.Forms.Button login;
        private System.Windows.Forms.Label id;
        private System.Windows.Forms.TextBox idBox;
        private System.Windows.Forms.Label gender;
        private System.Windows.Forms.Label phone;
        private System.Windows.Forms.Label address;
        private System.Windows.Forms.TextBox genderBox;
        private System.Windows.Forms.TextBox phoneBox;
        private System.Windows.Forms.TextBox addressBox;
        private System.Windows.Forms.Button add;
        private System.Windows.Forms.Button search;
        private System.Windows.Forms.Button delete;
        private System.Windows.Forms.Button log_out;
        private System.Windows.Forms.Button confirm;
        private System.Windows.Forms.Button delete_list;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button searchBtn;
        private System.Windows.Forms.Label label3;
    }
}

