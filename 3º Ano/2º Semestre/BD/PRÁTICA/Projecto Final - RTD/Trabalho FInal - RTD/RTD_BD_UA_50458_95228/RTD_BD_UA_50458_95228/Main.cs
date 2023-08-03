using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RTD_BD_UA_50458_95228
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e){}

        private void btnPessoas_Click(object sender, EventArgs e)
        {
            Pessoas menu = new Pessoas();
            menu.Show();
            Visible = false;
        }

        private void btnCuidadores_Click(object sender, EventArgs e)
        {
            Cuidadores menu = new Cuidadores();
            menu.Show();
            Visible = false;
        }

        private void btnPacientes_Click(object sender, EventArgs e)
        {
            Pacientes menu = new Pacientes();
            menu.Show();
            Visible = false;
        }

        private void btnProfissionais_Click(object sender, EventArgs e)
        {
            Profissionais menu = new Profissionais();
            menu.Show();
            Visible = false;
        }

        private void btnBombeiros_Click(object sender, EventArgs e)
        {
            Bombeiros menu = new Bombeiros();
            menu.Show();
            Visible = false;
        }

        private void btnUnidades_Click(object sender, EventArgs e)
        {
            UnidadesTratamento menu = new UnidadesTratamento();
            menu.Show();
            Visible = false;
        }

        private void btnConsultas_Click(object sender, EventArgs e)
        {
            Consultas menu = new Consultas();
            menu.Show();
            Visible = false;
        }

        private void btnQuarteis_Click_1(object sender, EventArgs e)
        {
            Quartéis menu = new Quartéis();
            menu.Show();
            Visible = false;
        }

        private void btnTransportes_Click(object sender, EventArgs e)
        {
            Transportes menu = new Transportes();
            menu.Show();
            Visible = false;
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Login menu = new Login();
            menu.Show();
            Visible = false;
        }

        private void label2_Click(object sender, EventArgs e){}
        private void label3_Click(object sender, EventArgs e){}
        private void panel2_Paint(object sender, PaintEventArgs e){}
        private void label2_Click_1(object sender, EventArgs e){}
    }
}
