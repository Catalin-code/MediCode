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
    public partial class DrugReports : Form
    {
        public DrugReports()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MediCode;Integrated Security=True");

        void getDrugs()
        {
            SqlCommand get = new SqlCommand("EXEC read_drugs", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            reportsGridView.DataSource = dt;
        }

        private void DrugReports_Load(object sender, EventArgs e)
        {
            getDrugs();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Drugs drugs = new Drugs();
            this.Hide();
            drugs.Show();
        }

        private void getButton_Click(object sender, EventArgs e)
        {
            DateTime startDate = DateTime.Parse(startDatePicker.Text);
            DateTime endDate = DateTime.Parse(endDatePicker.Text);
            SqlCommand get = new SqlCommand("EXEC get_drugs_report '" + startDate + "','" + endDate + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            reportsGridView.DataSource = dt;
        }
    }
}
