set(0, 'defaultlinelinewidth', 2);
set (0, 'defaulttextfontname', 'TimesNewRoman')
set (0, 'defaulttextfontsize', 20)
set (0, 'DefaultAxesFontName', 'TimesNewRoman')
set(0, 'DefaultAxesFontSize', 20)

clear h

## h.menu = uifigure();
h = guidata (gcf);
menu_eleccion (gcf, true);
set (gcf, 'color', get(0, 'defaultuicontrolbackgroundcolor'))
