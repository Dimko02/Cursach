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
    public partial class FormClient : Form
    {
        public DataSet dst = new DataSet();

        SqlDataAdapter adapterGoods;
        SqlDataAdapter adapterSuppliers;

        public string connectionString = @"Data Source=DESKTOP-ELCV2UO\MSSQLSERVER1;" +
                                             "Integrated Security=SSPI;" +
                                             "Initial Catalog=curs";

        string selectedComboBox1;
        string selectedComboBox2;

        public FormClient()
        {
            InitializeComponent();

            tabPage1.Text = "Goods";
            tabPage2.Text = "Suppliers";

            adapterGoods = new SqlDataAdapter("SELECT * FROM Goods", connectionString);
            adapterGoods.Fill(dst, "Goods");
            dataGridView1.DataSource = dst.Tables["Goods"];

            

            for (int i = 0; i < dst.Tables["Goods"].Columns.Count; i++)
            {
                comboBox1.Items.Add(dst.Tables["Goods"].Columns[i].ToString());
            }

            comboBox2.Items.AddRange(new string[] { ">", "<","=" });

        }

        private void TabPage1_Click(object sender, EventArgs e)
        {

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                dst.Clear();
                adapterGoods = new SqlDataAdapter("SELECT * FROM Goods Where " + selectedComboBox1 + selectedComboBox2 + textBox1.Text, connectionString);
                adapterGoods.Fill(dst, "Goods");
                dataGridView1.DataSource = dst.Tables["Goods"];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void TabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch(tabControl1.SelectedIndex)
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
            }
        }

        public void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
           selectedComboBox1 = comboBox1.SelectedItem.ToString();
        }

        private void ComboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedComboBox2 = comboBox2.SelectedItem.ToString();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            // Error
            new SqlCommandBuilder(adapterGoods);

            adapterGoods.Update(dst, "Goods");
        }
    }
}
