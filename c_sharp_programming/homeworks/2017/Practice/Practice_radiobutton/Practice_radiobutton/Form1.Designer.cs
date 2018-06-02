namespace Practice_radiobutton
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
            this.components = new System.ComponentModel.Container();
            this.pic = new System.Windows.Forms.PictureBox();
            this.radiobtn1 = new System.Windows.Forms.RadioButton();
            this.radiobtn2 = new System.Windows.Forms.RadioButton();
            this.btn = new System.Windows.Forms.Button();
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pic)).BeginInit();
            this.SuspendLayout();
            // 
            // pic
            // 
            this.pic.Location = new System.Drawing.Point(12, 12);
            this.pic.Name = "pic";
            this.pic.Size = new System.Drawing.Size(260, 187);
            this.pic.TabIndex = 0;
            this.pic.TabStop = false;
            // 
            // radiobtn1
            // 
            this.radiobtn1.AutoSize = true;
            this.radiobtn1.Location = new System.Drawing.Point(12, 219);
            this.radiobtn1.Name = "radiobtn1";
            this.radiobtn1.Size = new System.Drawing.Size(83, 16);
            this.radiobtn1.TabIndex = 1;
            this.radiobtn1.TabStop = true;
            this.radiobtn1.Text = "順時鐘輪迴";
            this.radiobtn1.UseVisualStyleBackColor = true;
            this.radiobtn1.Click += new System.EventHandler(this.radiobtn1_Click);
            // 
            // radiobtn2
            // 
            this.radiobtn2.AutoSize = true;
            this.radiobtn2.Location = new System.Drawing.Point(187, 219);
            this.radiobtn2.Name = "radiobtn2";
            this.radiobtn2.Size = new System.Drawing.Size(83, 16);
            this.radiobtn2.TabIndex = 2;
            this.radiobtn2.TabStop = true;
            this.radiobtn2.Text = "逆時鐘輪迴";
            this.radiobtn2.UseVisualStyleBackColor = true;
            this.radiobtn2.Click += new System.EventHandler(this.radiobtn2_Click);
            // 
            // btn
            // 
            this.btn.Location = new System.Drawing.Point(106, 219);
            this.btn.Name = "btn";
            this.btn.Size = new System.Drawing.Size(75, 23);
            this.btn.TabIndex = 3;
            this.btn.Text = "重置";
            this.btn.UseVisualStyleBackColor = true;
            this.btn.Click += new System.EventHandler(this.btn_Click);
            // 
            // timer
            // 
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(97, 249);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 12);
            this.label1.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(147, 249);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 12);
            this.label2.TabIndex = 5;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn);
            this.Controls.Add(this.radiobtn2);
            this.Controls.Add(this.radiobtn1);
            this.Controls.Add(this.pic);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pic)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pic;
        private System.Windows.Forms.RadioButton radiobtn1;
        private System.Windows.Forms.RadioButton radiobtn2;
        private System.Windows.Forms.Button btn;
        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}

