namespace Practice_OOXX
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
            this.btn1 = new System.Windows.Forms.Button();
            this.btn4 = new System.Windows.Forms.Button();
            this.btn5 = new System.Windows.Forms.Button();
            this.btn6 = new System.Windows.Forms.Button();
            this.btn2 = new System.Windows.Forms.Button();
            this.btn3 = new System.Windows.Forms.Button();
            this.btn7 = new System.Windows.Forms.Button();
            this.btn8 = new System.Windows.Forms.Button();
            this.btn9 = new System.Windows.Forms.Button();
            this.btn_reset = new System.Windows.Forms.Button();
            this.label_time = new System.Windows.Forms.Label();
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // btn1
            // 
            this.btn1.Location = new System.Drawing.Point(35, 26);
            this.btn1.Name = "btn1";
            this.btn1.Size = new System.Drawing.Size(52, 52);
            this.btn1.TabIndex = 0;
            this.btn1.UseVisualStyleBackColor = true;
            this.btn1.Click += new System.EventHandler(this.btn1_Click);
            // 
            // btn4
            // 
            this.btn4.Location = new System.Drawing.Point(35, 95);
            this.btn4.Name = "btn4";
            this.btn4.Size = new System.Drawing.Size(52, 52);
            this.btn4.TabIndex = 3;
            this.btn4.UseVisualStyleBackColor = true;
            // 
            // btn5
            // 
            this.btn5.Location = new System.Drawing.Point(107, 95);
            this.btn5.Name = "btn5";
            this.btn5.Size = new System.Drawing.Size(52, 52);
            this.btn5.TabIndex = 4;
            this.btn5.UseVisualStyleBackColor = true;
            // 
            // btn6
            // 
            this.btn6.Location = new System.Drawing.Point(193, 95);
            this.btn6.Name = "btn6";
            this.btn6.Size = new System.Drawing.Size(52, 52);
            this.btn6.TabIndex = 5;
            this.btn6.UseVisualStyleBackColor = true;
            // 
            // btn2
            // 
            this.btn2.Location = new System.Drawing.Point(107, 26);
            this.btn2.Name = "btn2";
            this.btn2.Size = new System.Drawing.Size(52, 52);
            this.btn2.TabIndex = 6;
            this.btn2.UseVisualStyleBackColor = true;
            // 
            // btn3
            // 
            this.btn3.Location = new System.Drawing.Point(193, 26);
            this.btn3.Name = "btn3";
            this.btn3.Size = new System.Drawing.Size(52, 52);
            this.btn3.TabIndex = 7;
            this.btn3.UseVisualStyleBackColor = true;
            // 
            // btn7
            // 
            this.btn7.Location = new System.Drawing.Point(35, 170);
            this.btn7.Name = "btn7";
            this.btn7.Size = new System.Drawing.Size(52, 52);
            this.btn7.TabIndex = 8;
            this.btn7.UseVisualStyleBackColor = true;
            // 
            // btn8
            // 
            this.btn8.Location = new System.Drawing.Point(107, 170);
            this.btn8.Name = "btn8";
            this.btn8.Size = new System.Drawing.Size(52, 52);
            this.btn8.TabIndex = 9;
            this.btn8.UseVisualStyleBackColor = true;
            // 
            // btn9
            // 
            this.btn9.Location = new System.Drawing.Point(193, 170);
            this.btn9.Name = "btn9";
            this.btn9.Size = new System.Drawing.Size(52, 52);
            this.btn9.TabIndex = 10;
            this.btn9.UseVisualStyleBackColor = true;
            // 
            // btn_reset
            // 
            this.btn_reset.Location = new System.Drawing.Point(56, 243);
            this.btn_reset.Name = "btn_reset";
            this.btn_reset.Size = new System.Drawing.Size(153, 37);
            this.btn_reset.TabIndex = 11;
            this.btn_reset.Text = "重置按鈕";
            this.btn_reset.UseVisualStyleBackColor = true;
            this.btn_reset.Click += new System.EventHandler(this.btn_reset_Click);
            // 
            // label_time
            // 
            this.label_time.AutoSize = true;
            this.label_time.Font = new System.Drawing.Font("新細明體", 14F);
            this.label_time.Location = new System.Drawing.Point(106, 292);
            this.label_time.Name = "label_time";
            this.label_time.Size = new System.Drawing.Size(46, 19);
            this.label_time.TabIndex = 12;
            this.label_time.Text = "30秒";
            // 
            // timer
            // 
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(285, 320);
            this.Controls.Add(this.label_time);
            this.Controls.Add(this.btn_reset);
            this.Controls.Add(this.btn9);
            this.Controls.Add(this.btn8);
            this.Controls.Add(this.btn7);
            this.Controls.Add(this.btn3);
            this.Controls.Add(this.btn2);
            this.Controls.Add(this.btn6);
            this.Controls.Add(this.btn5);
            this.Controls.Add(this.btn4);
            this.Controls.Add(this.btn1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn1;
        private System.Windows.Forms.Button btn4;
        private System.Windows.Forms.Button btn5;
        private System.Windows.Forms.Button btn6;
        private System.Windows.Forms.Button btn2;
        private System.Windows.Forms.Button btn3;
        private System.Windows.Forms.Button btn7;
        private System.Windows.Forms.Button btn8;
        private System.Windows.Forms.Button btn9;
        private System.Windows.Forms.Button btn_reset;
        private System.Windows.Forms.Label label_time;
        private System.Windows.Forms.Timer timer;
    }
}

