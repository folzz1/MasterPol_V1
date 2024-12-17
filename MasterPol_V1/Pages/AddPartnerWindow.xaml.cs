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
using System.Windows.Shapes;

namespace MasterPol_V1.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPartnerWindow.xaml
    /// </summary>
    public partial class AddPartnerWindow : Window
    {
        Entities db = Entities.GetContext();

        Partners _currentpartner;

        public event Action<Partners> OnPartnerAdded;

        public AddPartnerWindow(Partners partner)
        {
            InitializeComponent();

            if (partner != null)
            {
                _currentpartner = partner;
            }
            else _currentpartner = new Partners();

            PartnerType.ItemsSource = db.PartnerTypes.ToList();
            DataContext = _currentpartner;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(PartnerName.Text)
                            || PartnerType.SelectedIndex == -1
                            || string.IsNullOrEmpty(PartnerRate.Text)
                            || string.IsNullOrEmpty(PartnerAddress.Text)
                            || string.IsNullOrEmpty(DirectorSurname.Text)
                            || string.IsNullOrEmpty(DirectorName.Text)
                            || string.IsNullOrEmpty(DirectorLastName.Text)
                            || string.IsNullOrEmpty(PartnerPhone.Text)
                            || string.IsNullOrEmpty(PartnerEmail.Text))
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }
            if (_currentpartner.ID == 0)
            {
                db.Partners.Add(_currentpartner);
                OnPartnerAdded.Invoke(_currentpartner);
            }
            try
            {
                db.SaveChanges();
                MessageBox.Show("Информация сохранена!");
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void PartnerRate_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            TextBox textBox = sender as TextBox;
            textBox.Text = textBox.Text.Replace(" ", string.Empty);
            textBox.SelectionStart = textBox.Text.Length;
            if (!IsValidInput(textBox.Text, e.Text[0]))
            {
                e.Handled = true;
            }
        }

        private bool IsValidInput(string text, char input)
        {
            // разрешаем только цифры
            if (!char.IsDigit(input))
                return false;

            // ограничение длины текста
            if (text.Length > 2)
                return false;

            return true;
        }
    }
}
