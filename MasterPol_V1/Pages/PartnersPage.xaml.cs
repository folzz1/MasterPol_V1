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
    /// Логика взаимодействия для PartnersPage.xaml
    /// </summary>
    public partial class PartnersPage : Page
    {
        AddPartnerWindow addPartnerWindow;
        PartnersProductsPage partnersProductsPage;

        public event Action<PartnersProductsPage> ShowPartnersSales;

        Entities db = Entities.GetContext();
        public PartnersPage()
        {
            InitializeComponent();
            CountDiscountByPartners();
            ListPartners.Items.Clear();
            ListPartners.ItemsSource = db.Partners.ToList();
        }

        private void CountDiscountByPartners()
        {
            var partnerSales = db.PartnerProducts
                            .GroupBy(x => x.Partners)
                            .Select(group => new
                            {
                                Partner = group.Key,
                                TotalSales = group.Sum(p => p.ProductsNumber ?? 0)
                            })
                            .ToList();

            foreach (var partner in db.Partners)
            {
                partner.Discount = 0;
                var salesData = partnerSales.FirstOrDefault(ps => ps.Partner == partner);
                if (salesData != null)
                {
                    partner.Discount = 0;
                    if (salesData.TotalSales >= 10000 && salesData.TotalSales < 50000)
                    {
                        partner.Discount = 5;
                    }
                    else if (salesData.TotalSales >= 50000 && salesData.TotalSales < 300000)
                    {
                        partner.Discount = 10;
                    }
                    else if (salesData.TotalSales >= 300000)
                    {
                        partner.Discount = 15;
                    }
                }
            }
            db.SaveChanges();
        }

        private void AddPartner_Click(object sender, RoutedEventArgs e)
        {
            addPartnerWindow = new AddPartnerWindow(null);
            addPartnerWindow.Show();

            addPartnerWindow.OnPartnerAdded += (newPartner) =>
            {
                var list = db.Partners.ToList();
                list.Add(newPartner);
                ListPartners.ItemsSource = list;
            };
        }

        private void ListPartners_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListPartners.SelectedItem is Partners selectedPartner)
            {
                addPartnerWindow = new AddPartnerWindow(selectedPartner);
                addPartnerWindow.Show();
            }
            ListPartners.SelectedItem = null;
        }

        private void PartnerProductsButton_Click(object sender, RoutedEventArgs e)
        {
            partnersProductsPage = new PartnersProductsPage((sender as Button).DataContext as Partners);
            ShowPartnersSales.Invoke(partnersProductsPage);
        }
    }
}
