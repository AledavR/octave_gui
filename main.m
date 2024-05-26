set(0, 'defaultlinelinewidth', 2);
set (0, 'defaulttextfontname', 'TimesNewRoman')
set (0, 'defaulttextfontsize', 20)
set (0, 'DefaultAxesFontName', 'TimesNewRoman')
set(0, 'DefaultAxesFontSize', 20)

clear h

h = guidata (gcf);
menu_eleccion (gcf, true);
set (gcf, 'color', get(0, 'defaultuicontrolbackgroundcolor'))
set (gcf, 'name', 'Menu Inicio')
set (gcf, 'numbertitle', 'off')
set (gcf, 'toolbar', 'none')
set (gcf, 'menubar', 'none')
