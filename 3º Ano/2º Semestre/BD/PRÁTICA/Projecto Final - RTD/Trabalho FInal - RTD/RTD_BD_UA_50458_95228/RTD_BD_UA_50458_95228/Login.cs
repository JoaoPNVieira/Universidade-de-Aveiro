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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btnLigar_Click(object sender, EventArgs e)
        {
            Main menu = new Main();
            menu.Show();
            Visible = false;
        }

        private void textBox1_TextChanged(object sender, EventArgs e){}
        private void button1_Click(object sender, EventArgs e){}
        private void label4_Click(object sender, EventArgs e){}
        private void label2_Click(object sender, EventArgs e){}
    }
}
