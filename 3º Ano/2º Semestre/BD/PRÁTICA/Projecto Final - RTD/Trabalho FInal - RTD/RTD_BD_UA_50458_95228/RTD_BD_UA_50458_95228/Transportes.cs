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
    public partial class Transportes : Form
    {
        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Transportes()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodosTransportes_Click(object sender, EventArgs e)
        {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM TodosTransportes;";

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
                dgvTransportes.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvTransportes.AutoResizeColumns();
                dgvTransportes.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("Sucesso!");

            }

        }

        private void btnInserirTransporte_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
               
                sqlCon.Open();
                string insertQuery = "INSERT INTO TodosTransportes (id_transporte, id_quartel, matricula, lotação, tipologia, lista_recolha, id_local) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5, @Value6, @Value7);";

                try
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value1", textBox1.Text);
                        command.Parameters.AddWithValue("@Value2", textBox2.Text);
                        command.Parameters.AddWithValue("@Value3", textBox3.Text);
                        command.Parameters.AddWithValue("@Value4", textBox4.Text);
                        command.Parameters.AddWithValue("@Value5", textBox5.Text);
                        command.Parameters.AddWithValue("@Value6", textBox6.Text);
                        command.Parameters.AddWithValue("@Value7", textBox7.Text);

                        command.ExecuteNonQuery();

                        MessageBox.Show("Novo Transporte inserido com sucesso!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Transporte inserido já existe! Verifique novamente os dados!" + ex.Message);
                }
            }
        }

        private void BtnEliminarTransporte_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM TodosTransportes WHERE id_transporte = @Value1;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value1", textBox1.Text);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Transporte eliminado com sucesso!");
                        }
                        else
                        {
                            MessageBox.Show("Nenhum transporte encontrado com o número de identicação especificado.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ocorreu um erro ao eliminar este transporte: " + ex.Message);
                }
            }
        }

        private void btnProcurarTransporte_Click(object sender, EventArgs e)
        {
            string procurarNome = textBox3.Text.Trim();

            if (!string.IsNullOrEmpty(procurarNome))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    // SELECT THE QUERY TO EXECUTE
                    string queryToExecute = "SELECT * FROM TodasUnidades WITH(INDEX(idx_transporteMatricula)) WHERE nome LIKE @SearchName;";

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
                    dgvTransportes.AutoGenerateColumns = true;

                    // BIND DATA TO THE DATAGRIDVIEW
                    dgvTransportes.DataSource = dataTable;

                    // RESIZE THE DATAGRIDVIEW COLUMNS
                    dgvTransportes.AutoResizeColumns();
                    dgvTransportes.AutoResizeRows();

                    // SHOW A CONFIRMATION MESSAGE
                    MessageBox.Show("Sucesso!!!");
                }
            }
            else
            {
                MessageBox.Show("Por favor, digite uma Matricula para pesquisar.");
            }
        }

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvTransportes.RowCount)
            {
                dgvTransportes.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvTransportes.ColumnCount)
            {
                dgvTransportes.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }

    }
}
