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
    public partial class Drugs : Form
    {
        public Drugs()
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
            drugsGridView.DataSource = dt;
        }

        private void Drugs_Load(object sender, EventArgs e)
        {
            getDrugs();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Home home = new Home();
            this.Hide();
            home.Show();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(drugIdTextbox.Text);
            string name = nameTextbox.Text;
            int quantity = int.Parse(quantityTextbox.Text);
            int dosage = int.Parse(dosageTextbox.Text);
            int prescriptionId = int.Parse(prescriptionIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC create_drug '" + id + "','" + name + "','" + quantity + "','" + dosage + "','" + prescriptionId + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully added drug...");
            getDrugs();
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(drugIdTextbox.Text);
            string name = nameTextbox.Text;
            int quantity = int.Parse(quantityTextbox.Text);
            int dosage = int.Parse(dosageTextbox.Text);
            int prescriptionId = int.Parse(prescriptionIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC update_drug '" + id + "','" + name + "','" + quantity + "','" + dosage + "','" + prescriptionId + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully updated drug...");
            getDrugs();
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(drugIdTextbox.Text);
            con.Open();
            SqlCommand create = new SqlCommand("EXEC delete_drug '" + id + "'", con);
            create.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Successfully deleted drug...");
            getDrugs();
        }

        private void reportsButton_Click(object sender, EventArgs e)
        {
            DrugReports drugReports = new DrugReports();
            this.Hide();
            drugReports.Show();
        }
    }
}
