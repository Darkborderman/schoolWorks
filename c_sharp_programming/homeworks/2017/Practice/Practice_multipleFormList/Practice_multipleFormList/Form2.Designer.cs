namespace Practice_multipleFormList
{
    partial class Login
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
            this.account = new System.Windows.Forms.Label();
            this.account_text = new System.Windows.Forms.TextBox();
            this.pass = new System.Windows.Forms.Label();
            this.pass_text = new System.Windows.Forms.TextBox();
            this.btn_log = new System.Windows.Forms.Button();
            this.btn_cancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // account
            // 
            this.account.AutoSize = true;
            this.account.Font = new System.Drawing.Font("新細明體", 14F);
            this.account.Location = new System.Drawing.Point(35, 43);
            this.account.Name = "account";
            this.account.Size = new System.Drawing.Size(47, 19);
            this.account.TabIndex = 0;
            this.account.Text = "帳號";
            // 
            // account_text
            // 
            this.account_text.Location = new System.Drawing.Point(88, 43);
            this.account_text.Name = "account_text";
            this.account_text.Size = new System.Drawing.Size(156, 22);
            this.account_text.TabIndex = 1;
            // 
            // pass
            // 
            this.pass.AutoSize = true;
            this.pass.Font = new System.Drawing.Font("新細明體", 14F);
            this.pass.Location = new System.Drawing.Point(39, 106);
            this.pass.Name = "pass";
            this.pass.Size = new System.Drawing.Size(47, 19);
            this.pass.TabIndex = 2;
            this.pass.Text = "密碼";
            // 
            // pass_text
            // 
            this.pass_text.Location = new System.Drawing.Point(88, 103);
            this.pass_text.Name = "pass_text";
            this.pass_text.Size = new System.Drawing.Size(151, 22);
            this.pass_text.TabIndex = 3;
            this.pass_text.TextChanged += new System.EventHandler(this.pass_text_TextChanged);
            // 
            // btn_log
            // 
            this.btn_log.Location = new System.Drawing.Point(43, 181);
            this.btn_log.Name = "btn_log";
            this.btn_log.Size = new System.Drawing.Size(75, 23);
            this.btn_log.TabIndex = 4;
            this.btn_log.Text = "登入";
            this.btn_log.UseVisualStyleBackColor = true;
            this.btn_log.Click += new System.EventHandler(this.btn_log_Click);
            // 
            // btn_cancel
            // 
            this.btn_cancel.Location = new System.Drawing.Point(169, 181);
            this.btn_cancel.Name = "btn_cancel";
            this.btn_cancel.Size = new System.Drawing.Size(75, 23);
            this.btn_cancel.TabIndex = 5;
            this.btn_cancel.Text = "取消";
            this.btn_cancel.UseVisualStyleBackColor = true;
            this.btn_cancel.Click += new System.EventHandler(this.btn_cancel_Click);
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.btn_cancel);
            this.Controls.Add(this.btn_log);
            this.Controls.Add(this.pass_text);
            this.Controls.Add(this.pass);
            this.Controls.Add(this.account_text);
            this.Controls.Add(this.account);
            this.Name = "Login";
            this.Text = "登入";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label account;
        private System.Windows.Forms.TextBox account_text;
        private System.Windows.Forms.Label pass;
        private System.Windows.Forms.TextBox pass_text;
        private System.Windows.Forms.Button btn_log;
        private System.Windows.Forms.Button btn_cancel;
    }
}