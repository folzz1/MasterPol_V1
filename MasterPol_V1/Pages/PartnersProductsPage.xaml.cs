using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterPol_V1.Pages
{
    /// <summary>
    /// Логика взаимодействия для PartnersProductsPage.xaml
    /// </summary>
    public partial class PartnersProductsPage : Page
    {
        Entities db = Entities.GetContext();
        Partners _currentpartner;

        public PartnersProductsPage(Partners partner)
        {
            InitializeComponent();
            if (partner != null) _currentpartner = partner;
            else MessageBox.Show("Необходимо передать параметр выборки!");
            DataContext = _currentpartner;
            PartnersSales.Items.Clear();
            foreach (PartnerProducts sale in db.PartnerProducts)
            {
                if (sale.Partners == _currentpartner)
                {
                    PartnersSales.Items.Add(sale);
                }
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (NavigationService.CanGoBack)
            {
                NavigationService.GoBack();
            }
        }
    }
}
