using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MediCode
{
    public partial class PatientReports : Form
    {
        public PatientReports()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MediCode;Integrated Security=True");
        void getReports()
        {
            SqlCommand get = new SqlCommand("EXEC read_patients", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            reportsGridView.DataSource = dt;
        }

        private void PatientReports_Load(object sender, EventArgs e)
        {
            getReports();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Patients patients = new Patients();
            this.Hide();
            patients.Show();
        }

        private void getButton_Click(object sender, EventArgs e)
        {
            DateTime startDate = DateTime.Parse(startDatePicker.Text);
            DateTime endDate = DateTime.Parse(endDatePicker.Text);
            SqlCommand get = new SqlCommand("EXEC get_patients_report '" + startDate + "','" + endDate + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            reportsGridView.DataSource = dt;
        }
    }
}
