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
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void patientsButton_Click(object sender, EventArgs e)
        {
            Patients patients = new Patients();
            this.Hide();
            patients.Show();
        }

        private void prescriptionsButton_Click(object sender, EventArgs e)
        {
            Prescriptions prescriptions = new Prescriptions();
            this.Hide();
            prescriptions.Show();
        }

        private void drugsButton_Click(object sender, EventArgs e)
        {
            Drugs drugs = new Drugs();
            this.Hide();
            drugs.Show();
        }
    }
}
