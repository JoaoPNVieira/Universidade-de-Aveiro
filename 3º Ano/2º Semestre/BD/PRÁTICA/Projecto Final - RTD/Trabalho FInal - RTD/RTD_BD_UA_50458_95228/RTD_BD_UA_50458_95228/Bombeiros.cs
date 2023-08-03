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
    public partial class Bombeiros : Form
    {
        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Bombeiros()
        {
            InitializeComponent();
        }

        private void bñtTodosBombeiros_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.Bombeiro";

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
                dgvBombeiro.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvBombeiro.AutoResizeColumns();
                dgvBombeiro.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("Sucesso!");
            }
        }

        private void bntInserirBombeiro_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string insertQuery = "INSERT INTO RTD.Bombeiro (cc, num_utente, nome, morada, data_nasc, id_bombeiro, id_quartel, patente, valencias) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5, @Value6, @Value9, @Value7, @Value8);";

                try
                {
                    // Create a command object
                    using (SqlCommand command = new SqlCommand(insertQuery, sqlCon))
                    {
                        // Set the parameter values
                        command.Parameters.AddWithValue("@Value1", textBox1.Text);
                        command.Parameters.AddWithValue("@Value2", textBox2.Text);
                        command.Parameters.AddWithValue("@Value3", textBox3.Text);
                        command.Parameters.AddWithValue("@Value4", textBox4.Text);
                        command.Parameters.AddWithValue("@Value5", textBox5.Text);
                        command.Parameters.AddWithValue("@Value6", textBox6.Text);
                        command.Parameters.AddWithValue("@Value7", textBox7.Text);
                        command.Parameters.AddWithValue("@Value8", textBox8.Text);
                        command.Parameters.AddWithValue("@Value9", textBox9.Text);

                        // Execute the INSERT command
                        command.ExecuteNonQuery();

                        // Show a confirmation message
                        MessageBox.Show("Bombeiro Inserido!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Bombeiro Inserido já existente!" + ex.Message);
                }
            }
        }

        private void btnEliminarBombeiro_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM RTD.Bombeiro WHERE num_utente = @Value6;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value6", textBox6.Text);

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

        private void label8_Click(object sender, EventArgs e) { }
        private void label10_Click(object sender, EventArgs e) { }

        private void btnProcurarBombeiro_Click(object sender, EventArgs e)
        {
            string procurarNome = textBox3.Text.Trim();

            if (!string.IsNullOrEmpty(procurarNome))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    // SELECT THE QUERY TO EXECUTE
                    string queryToExecute = "SELECT * FROM RTD.Bombeiro WITH(INDEX(idx_BombeiroNome)) WHERE nome LIKE @SearchName;";

                    // EXECUTE THE SELECTED QUERY WITH THE SEARCH PARAMETER
                    DataTable dataTable = new DataTable();
                    using (SqlCommand command = new SqlCommand(queryToExecute, sqlCon))
                    {
                        command.Parameters.AddWithValue("@SearchName", "%" + procurarNome + "%");

                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                    dgvBombeiro.AutoGenerateColumns = true;
                    // SET COLUMN NAMES FOR THE DATA TABLE
                    dataTable.Columns[0].ColumnName = "Cc";
                    dataTable.Columns[1].ColumnName = "num_utente";
                    dataTable.Columns[2].ColumnName = "nome";
                    dataTable.Columns[3].ColumnName = "morada";
                    dataTable.Columns[4].ColumnName = "data_nasc";
                    dataTable.Columns[5].ColumnName = "id_bombeiro";
                    dataTable.Columns[6].ColumnName = "id_quartel";
                    dataTable.Columns[7].ColumnName = "patente";
                    dataTable.Columns[8].ColumnName = "valencias";

                    // BIND DATA TO THE DATAGRIDVIEW
                    dgvBombeiro.DataSource = dataTable;

                    // RESIZE THE DATAGRIDVIEW COLUMNS
                    dgvBombeiro.AutoResizeColumns();
                    dgvBombeiro.AutoResizeRows();

                    // SHOW A CONFIRMATION MESSAGE
                    MessageBox.Show("SQL Executada com sucesso!");
                }
            }
            else
            {
                MessageBox.Show("Por favor, digite um nome para pesquisar.");
            }
        }

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvBombeiro.RowCount)
            {
                dgvBombeiro.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvBombeiro.ColumnCount)
            {
                dgvBombeiro.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }
    }
}
