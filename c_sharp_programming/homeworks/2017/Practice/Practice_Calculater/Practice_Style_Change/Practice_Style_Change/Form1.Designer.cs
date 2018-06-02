namespace Practice_Style_Change
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.Div = new System.Windows.Forms.TextBox();
            this.BDiv = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.Ans = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 44);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "除數";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(37, 88);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 12);
            this.label2.TabIndex = 1;
            this.label2.Text = "被除數";
            // 
            // Div
            // 
            this.Div.Location = new System.Drawing.Point(88, 41);
            this.Div.Name = "Div";
            this.Div.Size = new System.Drawing.Size(100, 22);
            this.Div.TabIndex = 2;
            // 
            // BDiv
            // 
            this.BDiv.Location = new System.Drawing.Point(88, 88);
            this.BDiv.Name = "BDiv";
            this.BDiv.Size = new System.Drawing.Size(100, 22);
            this.BDiv.TabIndex = 3;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(88, 150);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "計算";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Ans
            // 
            this.Ans.AutoSize = true;
            this.Ans.Location = new System.Drawing.Point(88, 196);
            this.Ans.Name = "Ans";
            this.Ans.Size = new System.Drawing.Size(0, 12);
            this.Ans.TabIndex = 5;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.Ans);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.BDiv);
            this.Controls.Add(this.Div);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox Div;
        private System.Windows.Forms.TextBox BDiv;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label Ans;
    }
}

