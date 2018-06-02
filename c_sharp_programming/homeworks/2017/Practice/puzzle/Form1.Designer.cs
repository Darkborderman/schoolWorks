namespace puzzle
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
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器
        /// 修改這個方法的內容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.btn33 = new System.Windows.Forms.Button();
            this.imgCats = new System.Windows.Forms.ImageList(this.components);
            this.btn23 = new System.Windows.Forms.Button();
            this.btn13 = new System.Windows.Forms.Button();
            this.btn32 = new System.Windows.Forms.Button();
            this.btn22 = new System.Windows.Forms.Button();
            this.btn12 = new System.Windows.Forms.Button();
            this.btn31 = new System.Windows.Forms.Button();
            this.btn21 = new System.Windows.Forms.Button();
            this.btn11 = new System.Windows.Forms.Button();
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.time = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btn33
            // 
            this.btn33.ImageList = this.imgCats;
            this.btn33.Location = new System.Drawing.Point(170, 168);
            this.btn33.Name = "btn33";
            this.btn33.Size = new System.Drawing.Size(80, 80);
            this.btn33.TabIndex = 1;
            this.btn33.UseVisualStyleBackColor = true;
            this.btn33.Click += new System.EventHandler(this.btn33_Click);
            // 
            // imgCats
            // 
            this.imgCats.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imgCats.ImageStream")));
            this.imgCats.TransparentColor = System.Drawing.Color.Transparent;
            this.imgCats.Images.SetKeyName(0, "cat11.jpg");
            this.imgCats.Images.SetKeyName(1, "cat12.jpg");
            this.imgCats.Images.SetKeyName(2, "cat13.jpg");
            this.imgCats.Images.SetKeyName(3, "cat21.jpg");
            this.imgCats.Images.SetKeyName(4, "cat22.jpg");
            this.imgCats.Images.SetKeyName(5, "cat23.jpg");
            this.imgCats.Images.SetKeyName(6, "cat31.jpg");
            this.imgCats.Images.SetKeyName(7, "cat32.jpg");
            this.imgCats.Images.SetKeyName(8, "cat33.jpg");
            // 
            // btn23
            // 
            this.btn23.ImageList = this.imgCats;
            this.btn23.Location = new System.Drawing.Point(170, 90);
            this.btn23.Name = "btn23";
            this.btn23.Size = new System.Drawing.Size(80, 80);
            this.btn23.TabIndex = 2;
            this.btn23.UseVisualStyleBackColor = true;
            this.btn23.Click += new System.EventHandler(this.btn23_Click);
            // 
            // btn13
            // 
            this.btn13.ImageList = this.imgCats;
            this.btn13.Location = new System.Drawing.Point(170, 13);
            this.btn13.Name = "btn13";
            this.btn13.Size = new System.Drawing.Size(80, 80);
            this.btn13.TabIndex = 3;
            this.btn13.UseVisualStyleBackColor = true;
            this.btn13.Click += new System.EventHandler(this.btn13_Click);
            // 
            // btn32
            // 
            this.btn32.ImageList = this.imgCats;
            this.btn32.Location = new System.Drawing.Point(92, 168);
            this.btn32.Name = "btn32";
            this.btn32.Size = new System.Drawing.Size(80, 80);
            this.btn32.TabIndex = 4;
            this.btn32.UseVisualStyleBackColor = true;
            this.btn32.Click += new System.EventHandler(this.btn32_Click);
            // 
            // btn22
            // 
            this.btn22.ImageList = this.imgCats;
            this.btn22.Location = new System.Drawing.Point(92, 90);
            this.btn22.Name = "btn22";
            this.btn22.Size = new System.Drawing.Size(80, 80);
            this.btn22.TabIndex = 5;
            this.btn22.UseVisualStyleBackColor = true;
            this.btn22.Click += new System.EventHandler(this.btn22_Click);
            // 
            // btn12
            // 
            this.btn12.ImageList = this.imgCats;
            this.btn12.Location = new System.Drawing.Point(92, 12);
            this.btn12.Name = "btn12";
            this.btn12.Size = new System.Drawing.Size(80, 80);
            this.btn12.TabIndex = 6;
            this.btn12.UseVisualStyleBackColor = true;
            this.btn12.Click += new System.EventHandler(this.btn12_Click);
            // 
            // btn31
            // 
            this.btn31.ImageList = this.imgCats;
            this.btn31.Location = new System.Drawing.Point(15, 168);
            this.btn31.Name = "btn31";
            this.btn31.Size = new System.Drawing.Size(80, 80);
            this.btn31.TabIndex = 7;
            this.btn31.UseVisualStyleBackColor = true;
            this.btn31.Click += new System.EventHandler(this.btn31_Click);
            // 
            // btn21
            // 
            this.btn21.ImageList = this.imgCats;
            this.btn21.Location = new System.Drawing.Point(14, 90);
            this.btn21.Name = "btn21";
            this.btn21.Size = new System.Drawing.Size(80, 80);
            this.btn21.TabIndex = 8;
            this.btn21.UseVisualStyleBackColor = true;
            this.btn21.Click += new System.EventHandler(this.btn21_Click);
            // 
            // btn11
            // 
            this.btn11.ImageList = this.imgCats;
            this.btn11.Location = new System.Drawing.Point(14, 12);
            this.btn11.Name = "btn11";
            this.btn11.Size = new System.Drawing.Size(80, 80);
            this.btn11.TabIndex = 9;
            this.btn11.UseVisualStyleBackColor = true;
            this.btn11.Click += new System.EventHandler(this.btn11_Click);
            // 
            // checkedListBox1
            // 
            this.checkedListBox1.FormattingEnabled = true;
            this.checkedListBox1.Location = new System.Drawing.Point(302, 12);
            this.checkedListBox1.Name = "checkedListBox1";
            this.checkedListBox1.Size = new System.Drawing.Size(230, 225);
            this.checkedListBox1.TabIndex = 10;
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(15, 277);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 11;
            this.button1.Text = "開始計時";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(302, 277);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 12;
            this.button2.Text = "移除所選";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // time
            // 
            this.time.AutoSize = true;
            this.time.Font = new System.Drawing.Font("新細明體", 12F);
            this.time.Location = new System.Drawing.Point(122, 282);
            this.time.Name = "time";
            this.time.Size = new System.Drawing.Size(28, 16);
            this.time.TabIndex = 13;
            this.time.Text = "0.0";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(563, 312);
            this.Controls.Add(this.time);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.checkedListBox1);
            this.Controls.Add(this.btn33);
            this.Controls.Add(this.btn23);
            this.Controls.Add(this.btn13);
            this.Controls.Add(this.btn32);
            this.Controls.Add(this.btn22);
            this.Controls.Add(this.btn12);
            this.Controls.Add(this.btn31);
            this.Controls.Add(this.btn21);
            this.Controls.Add(this.btn11);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn33;
        private System.Windows.Forms.Button btn23;
        private System.Windows.Forms.Button btn13;
        private System.Windows.Forms.Button btn32;
        private System.Windows.Forms.Button btn22;
        private System.Windows.Forms.Button btn12;
        private System.Windows.Forms.Button btn31;
        private System.Windows.Forms.Button btn21;
        private System.Windows.Forms.Button btn11;
        private System.Windows.Forms.ImageList imgCats;
        private System.Windows.Forms.CheckedListBox checkedListBox1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label time;
    }
}

