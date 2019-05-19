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
    public partial class Form1 : Form
    {
       
        public DataSet dst = new DataSet();

        SqlDataAdapter adapterUsers;

        public string connectionString = @"Data Source=DESKTOP-ELCV2UO\MSSQLSERVER1;" +
                                             "Integrated Security=SSPI;" +
                                             "Initial Catalog=curs";

        FormAdm formAdm = new FormAdm();
        FormEmployee formEmployee = new FormEmployee();
        FormClient formClient = new FormClient();

        public Form1()
        {
            InitializeComponent();

            adapterUsers = new SqlDataAdapter("SELECT * FROM Users", connectionString);
            adapterUsers.Fill(dst, "Users");

        }

        private void Button1_Click(object sender, EventArgs e)
        {   
            for (int i = 0; i < dst.Tables["Users"].Rows.Count; i++)
            {
                if ((dst.Tables["Users"].Rows[i][0].ToString() == textBox1.Text) && (dst.Tables["Users"].Rows[i][1].ToString() == textBox2.Text))
                {
                    switch (dst.Tables["Users"].Rows[i][2].ToString())
                    {
                        case "1":
                            {
                                this.Hide();
                                formAdm.Show();
                                break;
                            }
                        case "2":
                            {
                                this.Hide();
                                formEmployee.Show();
                                break;
                            }
                        case "3":
                            {
                                this.Hide();
                                formClient.Show();
                                break;
                            }     
                    }
                }
                //else
                //{
                //    MessageBox.Show("Wrong");
                //    break;
                //}
            }
            
        }

        private void FormAut_Load(object sender, EventArgs e)
        {

        }
    }
}
