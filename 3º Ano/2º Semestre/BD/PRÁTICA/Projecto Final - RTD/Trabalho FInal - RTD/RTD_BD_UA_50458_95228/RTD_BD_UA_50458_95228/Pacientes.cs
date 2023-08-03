using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;


namespace RTD_BD_UA_50458_95228
{
    public partial class Pacientes : Form
    {

        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public Pacientes()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodosPacientes_Click(object sender, EventArgs e)
        {
           using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.Paciente;";

                // EXECUTAR A QUERY SELECIONADA
                DataTable dataTable = new DataTable();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(queryToExecute, connection))
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }

                // BIND DADOS AO DATAGRIDVIEW
                dgvPacientes.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvPacientes.AutoResizeColumns();
                dgvPacientes.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("Sucesso!");

            }
        }
        private void eventosClinicos_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.EventoClinico; ";

                // EXECUTAR A QUERY SELECIONADA
                DataTable dataTable = new DataTable();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(queryToExecute, connection))
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }

                // BIND DADOS AO DATAGRIDVIEW
                dgvPacientes.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvPacientes.AutoResizeColumns();
                dgvPacientes.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("SQL Executada com sucesso!");

            }
        }

        private void label4_Click(object sender, EventArgs e){}
        private void dgvPacientes_CellContentClick(object sender, DataGridViewCellEventArgs e){}
        private void dataPanel_Paint(object sender, PaintEventArgs e){}

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvPacientes.RowCount)
            {
                dgvPacientes.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvPacientes.ColumnCount)
            {
                dgvPacientes.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }

        private void btnInserirPaciente_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
             
                sqlCon.Open();

                // QUERY/INSERT:
                string insertQuery = "INSERT INTO RTD.Paciente (Cc, num_utente, nome, morada, data_nasc, id_local) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5, @Value6);";

                using (SqlCommand command = new SqlCommand(insertQuery, sqlCon))
                {
                    // PARAMETROS A INSERIR
                    command.Parameters.AddWithValue("@Value1", textBox1.Text);
                    command.Parameters.AddWithValue("@Value2", textBox2.Text);
                    command.Parameters.AddWithValue("@Value3", textBox3.Text);
                    command.Parameters.AddWithValue("@Value4", textBox4.Text);
                    command.Parameters.AddWithValue("@Value5", textBox5.Text);
                    command.Parameters.AddWithValue("@Value6", textBox6.Text);

                    // EXECUTAR COMANDO DE INSERT
                    command.ExecuteNonQuery();

                    // MENSAGEM DE CONFIRMAÇÃO
                    MessageBox.Show("Paciente introduzido com sucesso!");
                }
            }
        }

        private void btnEliminarPaciente_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM RTD.Paciente WHERE num_utente = @Value2;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value2", textBox2.Text);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Paciente eliminado com sucesso!");
                        }
                        else
                        {
                            MessageBox.Show("Nenhum paciente encontrado com o número de utente especificado.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ocorreu um erro ao eliminar este paciente: " + ex.Message);
                }
            }
        }

        private void Pacientes_Load(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }
    }
}
