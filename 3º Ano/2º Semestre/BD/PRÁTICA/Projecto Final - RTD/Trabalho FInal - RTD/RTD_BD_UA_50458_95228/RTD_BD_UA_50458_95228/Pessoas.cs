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
    public partial class Pessoas : Form
    {

        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Pessoas()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodasPessoas_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.Pessoa;";

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
                dgvPessoas.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvPessoas.AutoResizeColumns();
                dgvPessoas.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("SQL Executada com sucesso!");

            }
        }


        private void btnInserirPessoa_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                // Open the database connection
                sqlCon.Open();

                // Create the INSERT statement
                string insertQuery = "INSERT INTO RTD.Pessoa (Cc, num_utente, nome, morada, data_nasc) " +
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
                        MessageBox.Show("Pessoa Inserida!");
                    }
                }
                catch(Exception ex)
                {
                    MessageBox.Show("Pessoa Inserida já existente! Verifique novamente bem o número de Cc e o número de Utente que são únicos!" + ex.Message);
                }
            }

        }


        private void dgvPessoas_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {}

        private void btnEliminarPessoa_Click(object sender, EventArgs e)
        {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string deleteQuery = "DELETE FROM RTD.Pessoa WHERE Cc = @Value1;";

                    try
                    {
                        using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                        {
                            command.Parameters.AddWithValue("@Value1", textBox1.Text);

                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                MessageBox.Show("Pessoa eliminada com sucesso!");
                            }
                            else
                            {
                                MessageBox.Show("Nenhuma pessoa encontrada com o número de Cc especificado.");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ocorreu um erro ao eliminar esta pessoa: " + ex.Message);
                    }
                }
            }

        private void btnProcurarPessoa_Click(object sender, EventArgs e)
        {
            string procurarNome = textBox3.Text.Trim();

            if (!string.IsNullOrEmpty(procurarNome))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    // SELECT THE QUERY TO EXECUTE
                    string queryToExecute = "SELECT * FROM RTD.Pessoa WITH(INDEX(idx_pessoaNome)) WHERE nome LIKE @SearchName;";

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
                    dgvPessoas.AutoGenerateColumns = true;
                    // SET COLUMN NAMES FOR THE DATA TABLE
                    dataTable.Columns[0].ColumnName = "Cc";
                    dataTable.Columns[1].ColumnName = "num_utente";
                    dataTable.Columns[2].ColumnName = "nome";
                    dataTable.Columns[3].ColumnName = "morada";
                    dataTable.Columns[4].ColumnName = "data_nasc";

                    // BIND DATA TO THE DATAGRIDVIEW
                    dgvPessoas.DataSource = dataTable;

                    // RESIZE THE DATAGRIDVIEW COLUMNS
                    dgvPessoas.AutoResizeColumns();
                    dgvPessoas.AutoResizeRows();

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
            if (e.NewValue >= 0 && e.NewValue < dgvPessoas.RowCount)
            {
                dgvPessoas.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvPessoas.ColumnCount)
            {
                dgvPessoas.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }
    }
    }