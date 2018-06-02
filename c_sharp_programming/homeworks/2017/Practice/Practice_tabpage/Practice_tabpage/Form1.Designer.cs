namespace Practice_tabpage
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
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.data = new System.Windows.Forms.TabPage();
            this.account = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pass = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.login = new System.Windows.Forms.Button();
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.english = new System.Windows.Forms.TabPage();
            this.chinese = new System.Windows.Forms.TabPage();
            this.score1 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.average1 = new System.Windows.Forms.Label();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.textBox6 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox7 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox8 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.data.SuspendLayout();
            this.tabControl2.SuspendLayout();
            this.english.SuspendLayout();
            this.chinese.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.data);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(260, 237);
            this.tabControl1.TabIndex = 0;
            // 
            // data
            // 
            this.data.Controls.Add(this.login);
            this.data.Controls.Add(this.progressBar1);
            this.data.Controls.Add(this.textBox2);
            this.data.Controls.Add(this.pass);
            this.data.Controls.Add(this.textBox1);
            this.data.Controls.Add(this.account);
            this.data.Location = new System.Drawing.Point(4, 22);
            this.data.Name = "data";
            this.data.Padding = new System.Windows.Forms.Padding(3);
            this.data.Size = new System.Drawing.Size(252, 211);
            this.data.TabIndex = 2;
            this.data.Text = "你的資料";
            this.data.UseVisualStyleBackColor = true;
            // 
            // account
            // 
            this.account.AutoSize = true;
            this.account.Font = new System.Drawing.Font("新細明體", 14F);
            this.account.Location = new System.Drawing.Point(22, 32);
            this.account.Name = "account";
            this.account.Size = new System.Drawing.Size(47, 19);
            this.account.TabIndex = 0;
            this.account.Text = "帳號";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(75, 32);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 22);
            this.textBox1.TabIndex = 1;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // pass
            // 
            this.pass.AutoSize = true;
            this.pass.Font = new System.Drawing.Font("新細明體", 14F);
            this.pass.Location = new System.Drawing.Point(22, 80);
            this.pass.Name = "pass";
            this.pass.Size = new System.Drawing.Size(47, 19);
            this.pass.TabIndex = 2;
            this.pass.Text = "密碼";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(75, 77);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 22);
            this.textBox2.TabIndex = 3;
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(40, 139);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(154, 23);
            this.progressBar1.TabIndex = 4;
            this.progressBar1.Click += new System.EventHandler(this.progressBar1_Click);
            // 
            // login
            // 
            this.login.Location = new System.Drawing.Point(80, 168);
            this.login.Name = "login";
            this.login.Size = new System.Drawing.Size(75, 23);
            this.login.TabIndex = 5;
            this.login.Text = "登入";
            this.login.UseVisualStyleBackColor = true;
            this.login.Click += new System.EventHandler(this.login_Click);
            // 
            // tabControl2
            // 
            this.tabControl2.Controls.Add(this.english);
            this.tabControl2.Controls.Add(this.chinese);
            this.tabControl2.Location = new System.Drawing.Point(12, 12);
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(260, 237);
            this.tabControl2.TabIndex = 1;
            // 
            // english
            // 
            this.english.Controls.Add(this.textBox5);
            this.english.Controls.Add(this.label1);
            this.english.Controls.Add(this.textBox4);
            this.english.Controls.Add(this.average1);
            this.english.Controls.Add(this.textBox3);
            this.english.Controls.Add(this.score1);
            this.english.Location = new System.Drawing.Point(4, 22);
            this.english.Name = "english";
            this.english.Padding = new System.Windows.Forms.Padding(3);
            this.english.Size = new System.Drawing.Size(252, 211);
            this.english.TabIndex = 0;
            this.english.Text = "英文";
            this.english.UseVisualStyleBackColor = true;
            // 
            // chinese
            // 
            this.chinese.Controls.Add(this.textBox6);
            this.chinese.Controls.Add(this.label2);
            this.chinese.Controls.Add(this.textBox7);
            this.chinese.Controls.Add(this.label3);
            this.chinese.Controls.Add(this.textBox8);
            this.chinese.Controls.Add(this.label4);
            this.chinese.Location = new System.Drawing.Point(4, 22);
            this.chinese.Name = "chinese";
            this.chinese.Padding = new System.Windows.Forms.Padding(3);
            this.chinese.Size = new System.Drawing.Size(252, 211);
            this.chinese.TabIndex = 1;
            this.chinese.Text = "國文";
            this.chinese.UseVisualStyleBackColor = true;
            // 
            // score1
            // 
            this.score1.AutoSize = true;
            this.score1.Font = new System.Drawing.Font("新細明體", 12F);
            this.score1.Location = new System.Drawing.Point(26, 39);
            this.score1.Name = "score1";
            this.score1.Size = new System.Drawing.Size(72, 16);
            this.score1.TabIndex = 0;
            this.score1.Text = "你的分數";
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(105, 39);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 22);
            this.textBox3.TabIndex = 1;
            // 
            // average1
            // 
            this.average1.AutoSize = true;
            this.average1.Font = new System.Drawing.Font("新細明體", 12F);
            this.average1.Location = new System.Drawing.Point(26, 92);
            this.average1.Name = "average1";
            this.average1.Size = new System.Drawing.Size(72, 16);
            this.average1.TabIndex = 2;
            this.average1.Text = "全班平均";
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(105, 92);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(100, 22);
            this.textBox4.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("新細明體", 12F);
            this.label1.Location = new System.Drawing.Point(29, 139);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "排名";
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(105, 139);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(100, 22);
            this.textBox5.TabIndex = 5;
            // 
            // textBox6
            // 
            this.textBox6.Location = new System.Drawing.Point(116, 144);
            this.textBox6.Name = "textBox6";
            this.textBox6.Size = new System.Drawing.Size(100, 22);
            this.textBox6.TabIndex = 11;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("新細明體", 12F);
            this.label2.Location = new System.Drawing.Point(40, 144);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(40, 16);
            this.label2.TabIndex = 10;
            this.label2.Text = "排名";
            // 
            // textBox7
            // 
            this.textBox7.Location = new System.Drawing.Point(116, 97);
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new System.Drawing.Size(100, 22);
            this.textBox7.TabIndex = 9;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("新細明體", 12F);
            this.label3.Location = new System.Drawing.Point(37, 97);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 16);
            this.label3.TabIndex = 8;
            this.label3.Text = "全班平均";
            // 
            // textBox8
            // 
            this.textBox8.Location = new System.Drawing.Point(116, 44);
            this.textBox8.Name = "textBox8";
            this.textBox8.Size = new System.Drawing.Size(100, 22);
            this.textBox8.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("新細明體", 12F);
            this.label4.Location = new System.Drawing.Point(37, 44);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(72, 16);
            this.label4.TabIndex = 6;
            this.label4.Text = "你的分數";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.tabControl2);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.data.ResumeLayout(false);
            this.data.PerformLayout();
            this.tabControl2.ResumeLayout(false);
            this.english.ResumeLayout(false);
            this.english.PerformLayout();
            this.chinese.ResumeLayout(false);
            this.chinese.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage data;
        private System.Windows.Forms.Label account;
        public System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button login;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label pass;
        private System.Windows.Forms.TabControl tabControl2;
        private System.Windows.Forms.TabPage english;
        private System.Windows.Forms.TabPage chinese;
        private System.Windows.Forms.Label score1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label average1;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.TextBox textBox6;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox7;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox8;
        private System.Windows.Forms.Label label4;
    }
}

