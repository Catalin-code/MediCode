
namespace MediCode
{
    partial class MediCode
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
            this.components = new System.ComponentModel.Container();
            this.homeLabel = new System.Windows.Forms.Label();
            this.versionLabel = new System.Windows.Forms.Label();
            this.loadingTimer = new System.Windows.Forms.Timer(this.components);
            this.loadingBar = new Bunifu.UI.WinForms.BunifuCircleProgress();
            this.SuspendLayout();
            // 
            // homeLabel
            // 
            this.homeLabel.AutoSize = true;
            this.homeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 40F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.homeLabel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.homeLabel.Location = new System.Drawing.Point(76, 9);
            this.homeLabel.Name = "homeLabel";
            this.homeLabel.Size = new System.Drawing.Size(344, 76);
            this.homeLabel.TabIndex = 0;
            this.homeLabel.Text = "MediCode";
            // 
            // versionLabel
            // 
            this.versionLabel.AutoSize = true;
            this.versionLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.versionLabel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.versionLabel.Location = new System.Drawing.Point(362, 85);
            this.versionLabel.Name = "versionLabel";
            this.versionLabel.Size = new System.Drawing.Size(73, 29);
            this.versionLabel.TabIndex = 1;
            this.versionLabel.Text = "v 1.0";
            // 
            // loadingTimer
            // 
            this.loadingTimer.Tick += new System.EventHandler(this.loadingTimer_Tick);
            // 
            // loadingBar
            // 
            this.loadingBar.Animated = true;
            this.loadingBar.AnimationInterval = 1;
            this.loadingBar.AnimationSpeed = 1;
            this.loadingBar.BackColor = System.Drawing.Color.Transparent;
            this.loadingBar.CircleMargin = 10;
            this.loadingBar.Font = new System.Drawing.Font("Microsoft Sans Serif", 40F, System.Drawing.FontStyle.Bold);
            this.loadingBar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.loadingBar.IsPercentage = true;
            this.loadingBar.LineProgressThickness = 5;
            this.loadingBar.LineThickness = 10;
            this.loadingBar.Location = new System.Drawing.Point(157, 192);
            this.loadingBar.Name = "loadingBar";
            this.loadingBar.ProgressAnimationSpeed = 200;
            this.loadingBar.ProgressBackColor = System.Drawing.Color.Gainsboro;
            this.loadingBar.ProgressColor = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.loadingBar.ProgressColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.loadingBar.ProgressEndCap = Bunifu.UI.WinForms.BunifuCircleProgress.CapStyles.Round;
            this.loadingBar.ProgressFillStyle = Bunifu.UI.WinForms.BunifuCircleProgress.FillStyles.Solid;
            this.loadingBar.ProgressStartCap = Bunifu.UI.WinForms.BunifuCircleProgress.CapStyles.Round;
            this.loadingBar.SecondaryFont = new System.Drawing.Font("Microsoft Sans Serif", 16F);
            this.loadingBar.Size = new System.Drawing.Size(184, 184);
            this.loadingBar.SubScriptColor = System.Drawing.Color.FromArgb(((int)(((byte)(166)))), ((int)(((byte)(166)))), ((int)(((byte)(166)))));
            this.loadingBar.SubScriptMargin = new System.Windows.Forms.Padding(5, -20, 0, 0);
            this.loadingBar.SubScriptText = ".00";
            this.loadingBar.SuperScriptColor = System.Drawing.Color.FromArgb(((int)(((byte)(179)))), ((int)(((byte)(74)))), ((int)(((byte)(0)))));
            this.loadingBar.SuperScriptMargin = new System.Windows.Forms.Padding(5, 50, 0, 0);
            this.loadingBar.SuperScriptText = "%";
            this.loadingBar.TabIndex = 16;
            this.loadingBar.Text = "30";
            this.loadingBar.TextMargin = new System.Windows.Forms.Padding(0, 5, 0, 0);
            this.loadingBar.Value = 30;
            this.loadingBar.ValueByTransition = 30;
            this.loadingBar.ValueMargin = new System.Windows.Forms.Padding(0, 5, 0, 0);
            // 
            // MediCode
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(24)))), ((int)(((byte)(26)))), ((int)(((byte)(27)))));
            this.ClientSize = new System.Drawing.Size(500, 500);
            this.Controls.Add(this.loadingBar);
            this.Controls.Add(this.versionLabel);
            this.Controls.Add(this.homeLabel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "MediCode";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MediCode";
            this.Load += new System.EventHandler(this.MediCode_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label homeLabel;
        private System.Windows.Forms.Label versionLabel;
        private System.Windows.Forms.Timer loadingTimer;
        private Bunifu.UI.WinForms.BunifuCircleProgress loadingBar;
    }
}

