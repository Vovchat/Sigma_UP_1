   M S B A M L   `   `   `  ����C  ?WpfHotel, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:WpfHotel.pagesWpfHotel.pages  5      !    WpfHotel.pages.PageServices   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      .localclr-namespace:WpfHotel.pages     5        N� Title$  PageServices��5	      .��5
      �  � ColumnDefinitions 5   
   �� 5      $
��1.2* �6   �� 5      $��3* �6   .+�5   
   ��  �� Orientation$ Vertical=�6   $��Center=�5      $��Center=�5      .+�5      �� $ Vertical=�6   $
��Left=�5      $��Center=�5      .+�5      �� $��Заселён с��6   
�������5      (  "System.Windows.Controls.DatePicker  5      -   5        $��dtpDateStart��5      $	��240��5      $��40��6)   5      5      �� 5      $ Vertical=�6   $
��Left=�5      $��Center=�5      .+�5      �� $��Выселение��6   
�������5        5      -   5        $��dtpDateOver��5       $	��240��5      $��40��6)   5       5!      �� 5"      $ Vertical=�6   $
��Left=�5#      $��Center=�5$      .+�5%      �� $��Номер комнаты��6   
�������5&      �� 5'      -   5        $��cmbRoom��5(      $	��240��5'      $��40��6'   5(      5)      �� 5*      $ Vertical=�6   $
��Left=�5+      $��Center=�5,      .+�5-      �� $#��Имя заселяемого��6   
�������5.      �� 5/      -   5        $��cmbCustomer��50      $	��240��5/      $��40��6'   50      51      �� 52      $ 
Horizontal=�6   .+�53      �� -   5        $��btnAddS��53      $��Добавить��6(   $	��100��55      $��35��6%   �� 56      -   5        $��btnRedS��56      $��Изменить��6(   $	��100��58      $��35��6%   59      �� 5:      $��Center=�6   $(��"-=-=-=-=-=-=Поиск=-=-=-=-=-=-��5;      
�������5<      �� 5=      $ Vertical=�6   .+�5>      �� $ 
Horizontal=�6   $��2q�66   .+�5?      �� $��Дата начала��6    $	��125��63   
�������5@         5A      -   5        $��dtpFltDS��5B      $	��105��5A   !   $��40��6-   5B      5C      �� 5D      $ 
Horizontal=�6   $��2q�66   .+�5E      �� $��Дата кончала��6    $	��125��64   
�������5F         5G      -   5        $��dtpFltDO��5H      $	��105��5G   !   $��40��6-   5H      5I      �� 5J      $ 
Horizontal=�6   $��2q�66   .+�5K      �� $��Номер комнаты��6    $	��125��65   
�������5L       �� 5M      -	   5        $��txtFltRN��5N      $	��105��5M      $��40��6*   5N      5O      5P      �� 5Q      $��Center=�6   
�������$*��$-=-=-=-=-=-=Прочее=-=-=-=-=-=-��5R      �� 5S      $ 
Horizontal=�6   .+�5T      �� -
   5        $��btnDelS��5T      $��Удалить��6(   $	��100��5V      $��35��6%   �� 5W      -   5        $��btnFlt��5W      $��
Найти��6'   $	��100��5Y      $��35��6%   5Z      5[      �� 5\   
   -   5        $��	LVService��5\      
���   �$��1��5]      ��5^      �� 5_       �� ImageSource$ /pages/img2.png��6   ��5a      �� 5b      .R�5c      � $��5q�6    5d      �� 5e      $��40��6/   $��* �6=   �� 5f      $	��100��6/   $��* �6>   �� 5g      $	��110��6/   $��* �6>   �� 5h      $	��120��6/   $��* �6>   �� 5i      $��10��6/   $��* �6=   �� 5j      $	��270��6/   $��* �6>   �� 5k      $��40��6/   $��* �6=   .+�5m      �� $��0��6$   $��16(�5o      $��5q�5p      
���������5n      �� *
IdServices+5p   $   �� 5q      $��1��6$   $��16(�5s      $��5q�5t      
���������5r      �� *	DateStart+5t   $   �� 5u      $��2��6$   $��16(�5w      $��5q�5x      
���������5v      �� *
DateOver+5x   $   �� 5y      $��3��6$   $��16(�5{      $��5q�5|      
���������5z      �� *Days+5|   $   �� 5}      $��4��6$   $��16(�5      $��5q�5�      
���������5~      �� *Sum+5�   $   �� 5�      $��5��6$   $��16(�5�      $��5q�5�      
���������5�      �� *CustomerName+5�   $   �� 5�      $��6��6$   $��16(�5�      $��5q�5�      
���������5�      �� *
RoomNumber+5�   $   5�      5�      5�      5�      5�      