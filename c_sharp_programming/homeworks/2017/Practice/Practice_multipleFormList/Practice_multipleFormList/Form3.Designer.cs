namespace Practice_multipleFormList
{
    partial class Add
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
            this.name = new System.Windows.Forms.Label();
            this.text = new System.Windows.Forms.TextBox();
            this.btn_yes = new System.Windows.Forms.Button();
            this.btn_cancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // name
            // 
            this.name.AutoSize = true;
            this.name.Font = new System.Drawing.Font("新細明體", 14F);
            this.name.Location = new System.Drawing.Point(34, 40);
            this.name.Name = "name";
            this.name.Size = new System.Drawing.Size(47, 19);
            this.name.TabIndex = 0;
            this.name.Text = "姓名";
            // 
            // text
            // 
            this.text.Location = new System.Drawing.Point(87, 37);
            this.text.Name = "text";
            this.text.Size = new System.Drawing.Size(100, 22);
            this.text.TabIndex = 1;
            // 
            // btn_yes
            // 
            this.btn_yes.Location = new System.Drawing.Point(38, 112);
            this.btn_yes.Name = "btn_yes";
            this.btn_yes.Size = new System.Drawing.Size(75, 23);
            this.btn_yes.TabIndex = 2;
            this.btn_yes.Text = "確定";
            this.btn_yes.UseVisualStyleBackColor = true;
            this.btn_yes.Click += new System.EventHandler(this.btn_yes_Click);
            // 
            // btn_cancel
            // 
            this.btn_cancel.Location = new System.Drawing.Point(120, 112);
            this.btn_cancel.Name = "btn_cancel";
            this.btn_cancel.Size = new System.Drawing.Size(75, 23);
            this.btn_cancel.TabIndex = 3;
            this.btn_cancel.Text = "取消";
            this.btn_cancel.UseVisualStyleBackColor = true;
            this.btn_cancel.Click += new System.EventHandler(this.btn_cancel_Click);
            // 
            // Add
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(223, 158);
            this.Controls.Add(this.btn_cancel);
            this.Controls.Add(this.btn_yes);
            this.Controls.Add(this.text);
            this.Controls.Add(this.name);
            this.Name = "Add";
            this.Text = "新增";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label name;
        private System.Windows.Forms.Button btn_yes;
        private System.Windows.Forms.Button btn_cancel;
        public System.Windows.Forms.TextBox text;
    }
}