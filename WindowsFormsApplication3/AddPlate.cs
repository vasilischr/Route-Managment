using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication3
{
    public partial class AddPlate : Form
    {
#pragma warning disable CS0618 // Type or member is obsolete
        static string connetionString = String.Format("server={0};database={1};uid={2};pwd={3};", ConfigurationSettings.AppSettings["Server"], ConfigurationSettings.AppSettings["Database"], ConfigurationSettings.AppSettings["User"], ConfigurationSettings.AppSettings["Pass"]);
#pragma warning restore CS0618 
        MySqlConnection cnn = new MySqlConnection(connetionString);
        private DataSet ds = new DataSet();
        private bool ch1;
        private bool ch2;

        public AddPlate()
        {
            InitializeComponent();
            textBox1.CharacterCasing = CharacterCasing.Upper;
            cnn.Open();
            refresh1();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (ch2)
                Addmeth();
        }

        private void Addmeth()
        {
            
                try
                {
                
                    MySqlCommand cmd = cnn.CreateCommand();
                    String a = String.Format("insert into Cars (Plate) values('{0}') ;", textBox1.Text);
                    cmd.CommandText = a;
                    //cmd.Parameters.AddWithValue("@a", textBox1.Text);
                    cmd.ExecuteNonQuery();
                    refresh1();
                
                }
                catch {}
         }
        private void refresh1()
        {
            ds.Clear();
            MySqlCommand cmd = cnn.CreateCommand();
            cmd.CommandText = "select ID_C as ID,Plate from Cars ;";
            MySqlDataAdapter adap = new MySqlDataAdapter(cmd);
            adap.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0].DefaultView;
            dataGridView1.Columns["Plate"].DefaultCellStyle.ForeColor = Color.Black;
            dataGridView1.Columns["ID"].DefaultCellStyle.ForeColor = Color.Black;
            DataGridViewColumn column0 = dataGridView1.Columns[0];
            column0.Width = 23;
            DataGridViewColumn column1 = dataGridView1.Columns[1];
            column1.Width = 132;

        }

        private void Delete_Click(object sender, EventArgs e)
        {
            if(ch1)
                DeleteMeth();
        }
        private void DeleteMeth()
        {
           
                try
                {
                    MySqlCommand cmd = cnn.CreateCommand();
                    cmd.CommandText = "Delete from Cars where ID_C=@id ;";
                    cmd.Parameters.AddWithValue("@id", textBox2.Text);
                    cmd.ExecuteNonQuery();
                    refresh1();
                }
                catch { }
            
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            int n;
            if (!int.TryParse(textBox2.Text, out n) )
            {
                textBox2.BackColor = Color.Red;
                ch1 = false;
                Delete.Hide();
            }
            else
            {
                textBox2.BackColor = Color.White;
                ch1 = true;
                Delete.Show();
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (textBox1.Text.Length > 20)
            {
                textBox1.BackColor = Color.Red;
                ch2 = false;
                button1.Hide();
            }
            else
            {
                textBox1.BackColor = Color.White;
                ch2 = true;
                button1.Show();
            }
        }
    }

    }

