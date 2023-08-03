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
    public partial class Cuidadores : Form
    {
        string connectionString = @"Data Source=tcp:mednat.ieeta.pt\SQLSERVER,8101;Initial Catalog=p10g9;User ID=p10g9;Password=BennyCat2023?;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Cuidadores()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void btnTodosCuidadores_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // SELECTIONAR A QUERY QUE SE PRETENDE
                string queryToExecute = "SELECT * FROM RTD.Cuidador;";

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
                dgvCuidadors.DataSource = dataTable;

                // ATUALIZAR O TAMANHO DO DATAGRIDVIEW
                dgvCuidadors.AutoResizeColumns();
                dgvCuidadors.AutoResizeRows();

                // MENSAGEM DE CONFIRMAÇÃO
                MessageBox.Show("Sucesso!");

            }
        }

        private void vScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvCuidadors.RowCount)
            {
                dgvCuidadors.FirstDisplayedScrollingRowIndex = e.NewValue;
            }
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            if (e.NewValue >= 0 && e.NewValue < dgvCuidadors.ColumnCount)
            {
                dgvCuidadors.FirstDisplayedScrollingColumnIndex = e.NewValue;
            }
        }

        private void bntInserirCuidador_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();

                // QUERY/INSERT:
                string insertQuery = "INSERT INTO RTD.Cuidador (cc_cuidador, num_utente, nome, morada, data_nasc) " +
                                     "VALUES (@Value1, @Value2, @Value3, @Value4, @Value5);";

                using (SqlCommand command = new SqlCommand(insertQuery, sqlCon))
                {
                    // PARAMETROS A INSERIR
                    command.Parameters.AddWithValue("@Value1", textBox1.Text);
                    command.Parameters.AddWithValue("@Value2", textBox2.Text);
                    command.Parameters.AddWithValue("@Value3", textBox3.Text);
                    command.Parameters.AddWithValue("@Value4", textBox4.Text);
                    command.Parameters.AddWithValue("@Value5", textBox5.Text);

                    // EXECUTAR COMANDO DE INSERT
                    command.ExecuteNonQuery();

                    // MENSAGEM DE CONFIRMAÇÃO
                    MessageBox.Show("Cuidador introduzido com sucesso!");
                }
            }
        }

        private void btnEliminarCuidador_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string deleteQuery = "DELETE FROM RTD.Cuidador WHERE cc_cuidador = @Value1;";

                try
                {
                    using (SqlCommand command = new SqlCommand(deleteQuery, sqlCon))
                    {
                        command.Parameters.AddWithValue("@Value1", textBox1.Text);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Cuidador eliminado com sucesso!");
                        }
                        else
                        {
                            MessageBox.Show("Nenhum cuidador encontrado com o número de utente especificado.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ocorreu um erro ao eliminar este Cuidador: " + ex.Message);
                }
            }
        }
    }
}
