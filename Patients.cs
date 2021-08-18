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
    public partial class Patients : Form
    {
        public Patients()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MediCode;Integrated Security=True");

        void getPatients()
        {
            SqlCommand get = new SqlCommand("EXEC read_patients", con);
            SqlDataAdapter sd = new SqlDataAdapter(get);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            patientsGridView.DataSource = dt;
        }

        private void Patients_Load(object sender, EventArgs e)
        {
            getPatients();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Home home = new Home();
            this.Hide();
            home.Show();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(patientIdTextbox.Text);
            string lastName = lastNameTextbox.Text;
            string firstName = firstNameTextbox.Text;
            DateTime birthDate = DateTime.Parse(birthDatePicker.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC create_patient '" + id + "','" + lastName + "','" + firstName + "','" + birthDate + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully added patient...");
            getPatients();
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(patientIdTextbox.Text);
            string lastName = lastNameTextbox.Text;
            string firstName = firstNameTextbox.Text;
            DateTime birthDate = DateTime.Parse(birthDatePicker.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC update_patient '" + id + "','" + lastName + "','" + firstName + "','" + birthDate + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully updated patient...");
            getPatients();
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(patientIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC delete_patient '" + id + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully deleted patient...");
            getPatients();
        }

        private void reportsButton_Click(object sender, EventArgs e)
        {
            PatientReports patientReports = new PatientReports();
            this.Hide();
            patientReports.Show();
        }
    }
}
