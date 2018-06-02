namespace Practice_WindowsStyleChange
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
            this.btn1 = new System.Windows.Forms.Button();
            this.btn2 = new System.Windows.Forms.Button();
            this.title = new System.Windows.Forms.Label();
            this.subtitle = new System.Windows.Forms.Label();
            this.pictureBox = new System.Windows.Forms.PictureBox();
            this.content = new System.Windows.Forms.TextBox();
            this.button = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // btn1
            // 
            this.btn1.Location = new System.Drawing.Point(22, 13);
            this.btn1.Name = "btn1";
            this.btn1.Size = new System.Drawing.Size(75, 23);
            this.btn1.TabIndex = 0;
            this.btn1.Text = "Style1";
            this.btn1.UseVisualStyleBackColor = true;
            this.btn1.Click += new System.EventHandler(this.btn1_Click);
            // 
            // btn2
            // 
            this.btn2.Location = new System.Drawing.Point(128, 12);
            this.btn2.Name = "btn2";
            this.btn2.Size = new System.Drawing.Size(75, 23);
            this.btn2.TabIndex = 1;
            this.btn2.Text = "Style2";
            this.btn2.UseVisualStyleBackColor = true;
            this.btn2.Click += new System.EventHandler(this.btn2_Click);
            // 
            // title
            // 
            this.title.AutoSize = true;
            this.title.Location = new System.Drawing.Point(22, 64);
            this.title.Name = "title";
            this.title.Size = new System.Drawing.Size(50, 12);
            this.title.TabIndex = 2;
            this.title.Text = "Title Text";
            // 
            // subtitle
            // 
            this.subtitle.AutoSize = true;
            this.subtitle.Location = new System.Drawing.Point(22, 98);
            this.subtitle.Name = "subtitle";
            this.subtitle.Size = new System.Drawing.Size(64, 12);
            this.subtitle.TabIndex = 3;
            this.subtitle.Text = "Subtitle Text";
            // 
            // pictureBox
            // 
            this.pictureBox.Location = new System.Drawing.Point(158, 59);
            this.pictureBox.Name = "pictureBox";
            this.pictureBox.Size = new System.Drawing.Size(114, 104);
            this.pictureBox.TabIndex = 4;
            this.pictureBox.TabStop = false;
            // 
            // content
            // 
            this.content.Location = new System.Drawing.Point(24, 141);
            this.content.Name = "content";
            this.content.Size = new System.Drawing.Size(100, 22);
            this.content.TabIndex = 5;
            this.content.Text = "Content Text";
            // 
            // button
            // 
            this.button.Location = new System.Drawing.Point(24, 203);
            this.button.Name = "button";
            this.button.Size = new System.Drawing.Size(75, 23);
            this.button.TabIndex = 6;
            this.button.Text = "Button";
            this.button.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.button);
            this.Controls.Add(this.content);
            this.Controls.Add(this.pictureBox);
            this.Controls.Add(this.subtitle);
            this.Controls.Add(this.title);
            this.Controls.Add(this.btn2);
            this.Controls.Add(this.btn1);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn1;
        private System.Windows.Forms.Button btn2;
        private System.Windows.Forms.Label title;
        private System.Windows.Forms.Label subtitle;
        private System.Windows.Forms.PictureBox pictureBox;
        private System.Windows.Forms.TextBox content;
        private System.Windows.Forms.Button button;
    }
}

