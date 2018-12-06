using _1714DBrandes2g;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace _1714DBrandesex3B2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        PropertyManager2ModelContainer dbContext;
        System.Windows.Data.CollectionViewSource apartmentViewSource;
        System.Windows.Data.CollectionViewSource apartmentInvoicesLineItemsViewSource;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            apartmentViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("apartmentViewSource")));
            apartmentInvoicesLineItemsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("apartmentInvoicesLineItemsViewSource")));
            dbContext = new PropertyManager2ModelContainer();
            dbContext.People.Where(p => (p.Apartments1.Count > 0)).Load();
            dbContext.Apartments.Load();
            apartmentViewSource.Source = dbContext.Apartments.Local;
            dbContext.Configuration.AutoDetectChangesEnabled = true;
            // Load data by setting the CollectionViewSource.Source property:
            // apartmentViewSource.Source = [generic data source]
        }

        private void firstButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToFirst();
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToNext();
        }

        private void lastButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToLast();
        }

        private void firstInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesLineItemsViewSource.View.MoveCurrentToFirst();
        }

        private void backInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesLineItemsViewSource.View.MoveCurrentToPrevious();
        }

        private void nextInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesLineItemsViewSource.View.MoveCurrentToNext();
        }

        private void lastInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesLineItemsViewSource.View.MoveCurrentToLast();
        }
    }
}
