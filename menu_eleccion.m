function menu_eleccion(obj, init = false)
  clear h

  h = guidata(obj);


  h.boton_grafica = uicontrol ('style', 'pushbutton',
			       'units', 'normalized',
			       'string', 'Grafica de funciones',
			       'callback', @menu_grafica,
			       'position', [0.25 0.7 0.5 0.09]);

  h.boton_curvas = uicontrol ('style', 'pushbutton',
			      'units', 'normalized',
			      'string', 'Curvas de Bezier',
			      'callback', @actualizar_plot,
			      'position', [0.25 0.5 0.5 0.09]);

end
