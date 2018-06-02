namespace Hw2
{
    partial class login
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.webBrowser1 = new System.Windows.Forms.WebBrowser();
            this.account = new System.Windows.Forms.Label();
            this.account_text = new System.Windows.Forms.TextBox();
            this.password = new System.Windows.Forms.Label();
            this.pass_text = new System.Windows.Forms.TextBox();
            this.confirm = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // webBrowser1
            // 
            this.webBrowser1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.webBrowser1.Location = new System.Drawing.Point(0, 0);
            this.webBrowser1.MinimumSize = new System.Drawing.Size(20, 20);
            this.webBrowser1.Name = "webBrowser1";
            this.webBrowser1.Size = new System.Drawing.Size(258, 165);
            this.webBrowser1.TabIndex = 0;
            // 
            // account
            // 
            this.account.AutoSize = true;
            this.account.BackColor = System.Drawing.SystemColors.Window;
            this.account.Font = new System.Drawing.Font("新細明體", 14F);
            this.account.Location = new System.Drawing.Point(12, 30);
            this.account.Name = "account";
            this.account.Size = new System.Drawing.Size(62, 19);
            this.account.TabIndex = 1;
            this.account.Text = "帳號 : ";
            // 
            // account_text
            // 
            this.account_text.Location = new System.Drawing.Point(80, 32);
            this.account_text.Name = "account_text";
            this.account_text.Size = new System.Drawing.Size(147, 22);
            this.account_text.TabIndex = 2;
            // 
            // password
            // 
            this.password.AutoSize = true;
            this.password.BackColor = System.Drawing.Color.White;
            this.password.Font = new System.Drawing.Font("新細明體", 14F);
            this.password.Location = new System.Drawing.Point(12, 75);
            this.password.Name = "password";
            this.password.Size = new System.Drawing.Size(62, 19);
            this.password.TabIndex = 3;
            this.password.Text = "密碼 : ";
            // 
            // pass_text
            // 
            this.pass_text.Location = new System.Drawing.Point(80, 77);
            this.pass_text.Name = "pass_text";
            this.pass_text.Size = new System.Drawing.Size(147, 22);
            this.pass_text.TabIndex = 4;
            // 
            // confirm
            // 
            this.confirm.Location = new System.Drawing.Point(95, 124);
            this.confirm.Name = "confirm";
            this.confirm.Size = new System.Drawing.Size(75, 23);
            this.confirm.TabIndex = 5;
            this.confirm.Text = "確定";
            this.confirm.UseVisualStyleBackColor = true;
            this.confirm.Click += new System.EventHandler(this.confirm_Click);
            // 
            // login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(258, 165);
            this.Controls.Add(this.confirm);
            this.Controls.Add(this.pass_text);
            this.Controls.Add(this.password);
            this.Controls.Add(this.account_text);
            this.Controls.Add(this.account);
            this.Controls.Add(this.webBrowser1);
            this.Name = "login";
            this.Text = "Login";
            this.Load += new System.EventHandler(this.login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.WebBrowser webBrowser1;
        private System.Windows.Forms.Label account;
        public System.Windows.Forms.TextBox account_text;
        private System.Windows.Forms.Label password;
        private System.Windows.Forms.TextBox pass_text;
        private System.Windows.Forms.Button confirm;
    }
}