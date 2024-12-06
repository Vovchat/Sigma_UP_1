using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfHotel.Models
{
    public static class ClassHelper
    {
        public static NavigationService? NavigationService { get; set; }
        public static void NavigateTo(this Frame frame, Page page)
        {
            NavigationService?.Navigate(page);
        }
    }
}
