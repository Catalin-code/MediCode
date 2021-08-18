using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MediCode
{
    public partial class MediCode : Form
    {
        int timerStart = 0;
        public MediCode()
        {
            InitializeComponent();
        }

        private void loadingTimer_Tick(object sender, EventArgs e)
        {
            timerStart += 2;
            loadingBar.Value = timerStart;
            if(loadingBar.Value == 100)
            {
                loadingBar.Value = 0;
                loadingTimer.Stop();
                Home home = new Home();
                this.Hide();
                home.Show();
            }
        }

        private void MediCode_Load(object sender, EventArgs e)
        {
            this.loadingTimer.Start();
        }
    }
}
