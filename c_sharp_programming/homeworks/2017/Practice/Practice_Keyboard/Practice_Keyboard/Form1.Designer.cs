namespace Practice_Keyboard
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
            this.label_key = new System.Windows.Forms.Label();
            this.label_mouse = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label_key
            // 
            this.label_key.AutoSize = true;
            this.label_key.Location = new System.Drawing.Point(117, 84);
            this.label_key.Name = "label_key";
            this.label_key.Size = new System.Drawing.Size(0, 12);
            this.label_key.TabIndex = 0;
            // 
            // label_mouse
            // 
            this.label_mouse.AutoSize = true;
            this.label_mouse.Location = new System.Drawing.Point(117, 186);
            this.label_mouse.Name = "label_mouse";
            this.label_mouse.Size = new System.Drawing.Size(0, 12);
            this.label_mouse.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.label_mouse);
            this.Controls.Add(this.label_key);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyUp);
            this.MouseClick += new System.Windows.Forms.MouseEventHandler(this.Form1_MouseClick);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label_key;
        private System.Windows.Forms.Label label_mouse;
    }
}

