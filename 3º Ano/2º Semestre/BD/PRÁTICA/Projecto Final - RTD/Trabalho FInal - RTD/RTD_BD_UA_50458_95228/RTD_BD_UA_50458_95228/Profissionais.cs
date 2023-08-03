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
    public partial class Profissionais : Form
    {

        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Profissionais()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodosProfissionais_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM TodosProfissionais";

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

        private void btnConsultas_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.Consulta;";

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

        private void btnConsultas2oumais_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.ConsultasProfissionais";

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
                MessageBox.Show("Operação executada com sucesso!");
            }
        }

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

        private void btnInserirProfissional_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();

                // QUERY/INSERT:
                string insertQuery = "INSERT INTO RTD.Profissional (cc, num_utente, nome, morada, data_nasc, cedula, id_centro, funcao) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5, @Value6, @Value7, @Value8);";

                // Create a command object
                using (SqlCommand command = new SqlCommand(insertQuery, sqlCon))
                {
                    // PARAMETROS A INSERIR
                    command.Parameters.AddWithValue("@Value1", textBox1.Text);
                    command.Parameters.AddWithValue("@Value2", textBox2.Text);
                    command.Parameters.AddWithValue("@Value3", textBox3.Text);
                    command.Parameters.AddWithValue("@Value4", textBox4.Text);
                    command.Parameters.AddWithValue("@Value5", textBox5.Text);
                    command.Parameters.AddWithValue("@Value6", textBox6.Text);
                    command.Parameters.AddWithValue("@Value7", textBox7.Text);
                    command.Parameters.AddWithValue("@Value8", textBox8.Text);

                    // EXECUTAR COMANDO DE INSERT
                    command.ExecuteNonQuery();

                    // MENSAGEM DE CONFIRMAÇÃO
                    MessageBox.Show("Profissional introduzido com sucesso!");
                }
            }

        }


        private void label7_Click(object sender, EventArgs e){}

        private void btnEliminarProfissional_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM RTD.Profissional WHERE cedula = @Value2;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value2", textBox6.Text);

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
                    MessageBox.Show("Ocorreu um erro ao eliminar este profissinal: " + ex.Message);
                }
            }
        }
    }
}
