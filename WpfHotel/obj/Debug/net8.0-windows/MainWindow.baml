   M S B A M L   `   `   `  ����C  ?WpfHotel, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:WpfHotelWpfHotel  5   	       WpfHotel.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:WpfHotel     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � WindowState$ 	Maximized=�5	   	    � WindowStyle$
 None=�6!   .��5
      � ��5   
   �� 5       �� ImageSource$ 	/img1.png��6    � RowDefinitions 5   
   �� 5      $��2* �6   �� 5      $��7* �6   �� 5      $
��0.5* �6    � ColumnDefinitions 5   
   .+�5   
    � -   5        $��	MainFrame��5   -   $��1��6   $��1��6   $��10q�6>     � NavigationUIVisibility$ Hidden=�5       � 5   
   -   5        $��
MainFrameR��5   -   $��1��6   $��1��6   $��10q�6?   $ Hidden=�5       � 5   
   -   5        $��
MainFrameC��5   -   $��1��6   $��1��6   $��10q�6?   $ Hidden=�5      �� 5   
    �� Orientation$ 
Horizontal=�6   $��0��6.   $��1��6;   $��Center=�5      $��Center=�62   .+�5      �� -   5         ��Name$ 
btnService��5      $��Услуги��5      �� 5      -   5        $ btnCustomers��5      $��Посетители��5       �� 5!      -   5        $ btnRooms��5!      $��Комнаты��5"      5#      5$      5%      