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

namespace Cursovaya
{
    public partial class FormEmployee : Form
    {
        public DataSet dst = new DataSet();

        SqlDataAdapter adapterGoods;
        SqlDataAdapter adapterSuppliers;
        SqlDataAdapter adapterClients;

        public string connectionString = @"Data Source=DESKTOP-ELCV2UO\MSSQLSERVER1;" +
                                             "Integrated Security=SSPI;" +
                                             "Initial Catalog=curs";
        public FormEmployee()
        {
            InitializeComponent();

            tabPage1.Text = "Goods";
            tabPage2.Text = "Suppliers";
            tabPage3.Text = "Clients";

            adapterGoods = new SqlDataAdapter("SELECT * FROM Goods", connectionString);
            adapterGoods.Fill(dst, "Goods");
            dataGridView1.DataSource = dst.Tables["Goods"];

        }

        private void FormEmployee_Load(object sender, EventArgs e)
        {

        }

        private void TabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (tabControl1.SelectedIndex)
            {
                case 0:

                    dst.Clear();
                    adapterGoods = new SqlDataAdapter("SELECT * FROM Goods", connectionString);
                    adapterGoods.Fill(dst, "Goods");
                    dataGridView1.DataSource = dst.Tables["Goods"];
                    break;

                case 1:

                    dst.Clear();
                    adapterSuppliers = new SqlDataAdapter("SELECT * FROM Suppliers", connectionString);
                    adapterSuppliers.Fill(dst, "Suppliers");
                    dataGridView2.DataSource = dst.Tables["Suppliers"];
                    break;

                case 2:

                    dst.Clear();
                    adapterClients = new SqlDataAdapter("SELECT * FROM Clients", connectionString);
                    adapterClients.Fill(dst, "Clients");
                    dataGridView3.DataSource = dst.Tables["Clients"];
                    break;
            }
        }
    }
}
