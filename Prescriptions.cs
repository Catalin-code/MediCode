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
    public partial class Prescriptions : Form
    {
        public Prescriptions()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MediCode;Integrated Security=True");

        void getPrescriptions()
        {
            SqlCommand get = new SqlCommand("EXEC read_prescriptions", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            prescriptionsGridView.DataSource = dt;
        }

        private void Prescriptions_Load(object sender, EventArgs e)
        {
            getPrescriptions();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Home home = new Home();
            this.Hide();
            home.Show();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(prescriptionIdTextbox.Text);
            string series = seriesTextbox.Text;
            string number = numberTextbox.Text;
            DateTime issueDate = DateTime.Parse(issueDatePicker.Text);
            int patientId = int.Parse(patientIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC create_prescription '" + id + "','" + series + "','" + number + "','" + issueDate + "','" + patientId + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully added prescription...");
            getPrescriptions();
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(prescriptionIdTextbox.Text);
            string series = seriesTextbox.Text;
            string number = numberTextbox.Text;
            DateTime issueDate = DateTime.Parse(issueDatePicker.Text);
            int patientId = int.Parse(patientIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC update_prescription '" + id + "','" + series + "','" + number + "','" + issueDate + "','" + patientId + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully updated prescription...");
            getPrescriptions();
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(prescriptionIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC delete_prescription '" + id + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully deleted prescription...");
            getPrescriptions();
        }
    }
}
