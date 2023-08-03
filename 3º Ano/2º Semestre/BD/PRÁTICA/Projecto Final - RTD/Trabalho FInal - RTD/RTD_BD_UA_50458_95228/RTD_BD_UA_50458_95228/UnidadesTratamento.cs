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
    public partial class UnidadesTratamento : Form
    {
        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public UnidadesTratamento()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodasUnidades_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM TodasUnidades;";

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
                dgvUnidades.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvUnidades.AutoResizeColumns();
                dgvUnidades.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("Sucesso!");

            }
        }

        private void btnInsertUnidade_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                // Open the database connection
                sqlCon.Open();

                // Create the INSERT statement
                string insertQuery = "INSERT INTO TodasUnidades (id_centro, id_local, nome, morada, GPS) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5);";

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

                        // Execute the INSERT command
                        command.ExecuteNonQuery();

                        // Show a confirmation message
                        MessageBox.Show("Nova Unidade de Tratamento Inserida com sucesso!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Unidade de tratamento inserida já existe! Verifique novamente os dados!" + ex.Message);
                }
            }
        }

        private void btnEliminarUnidade_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM TodasUnidades WHERE id_centro = @Value1;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value1", textBox1.Text);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Unidade de Tratamento eliminada com sucesso!");
                        }
                        else
                        {
                            MessageBox.Show("Nenhuma Unidade de Tratamento encontrada com o número de identicação especificado.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ocorreu um erro ao eliminar esta unidade de tratamento: " + ex.Message);
                }
            }
        }

        private void btnProcurarUnidade_Click(object sender, EventArgs e)
        {
            string procurarNome = textBox3.Text.Trim();

            if (!string.IsNullOrEmpty(procurarNome))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    // SELECT THE QUERY TO EXECUTE
                    string queryToExecute = "SELECT * FROM TodasUnidades WITH(INDEX(idx_unidadeNome)) WHERE nome LIKE @SearchName;";

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
                    dgvUnidades.AutoGenerateColumns = true;
                    // SET COLUMN NAMES FOR THE DATA TABLE
                    dataTable.Columns[0].ColumnName = "id_centro";
                    dataTable.Columns[1].ColumnName = "id_local";
                    dataTable.Columns[2].ColumnName = "nome";
                    dataTable.Columns[3].ColumnName = "morada";
                    dataTable.Columns[4].ColumnName = "GPS";

                    // BIND DATA TO THE DATAGRIDVIEW
                    dgvUnidades.DataSource = dataTable;

                    // RESIZE THE DATAGRIDVIEW COLUMNS
                    dgvUnidades.AutoResizeColumns();
                    dgvUnidades.AutoResizeRows();

                    // SHOW A CONFIRMATION MESSAGE
                    MessageBox.Show("Sucesso!!!");
                }
            }
            else
            {
                MessageBox.Show("Por favor, digite um nome para pesquisar.");
            }
        }

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvUnidades.RowCount)
            {
                dgvUnidades.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvUnidades.ColumnCount)
            {
                dgvUnidades.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }
    }
}
