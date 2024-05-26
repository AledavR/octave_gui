function menu_grafica (obj, init = false)

  pkg load symbolic;

  h.main_frame = figure();

  h.graficar_funcion = uicontrol (h.main_frame,"style", "pushbutton",
				  "units", "normalized",
				  "string", "Derivar función",
				  "callback", {@actualizar_plot},
				  "position", [0.05 0.7 0.3 0.09]);

  h.label_funcion = uicontrol (h.main_frame,"style", "text",
			       "units", "normalized",
			       "string", "Grado",
			       "Position", [0.05 0.6 0.3 0.09]);

  h.grado_derivada = uicontrol(h.main_frame,"style", "edit",
			       "units", "normalized",
			       "value", 0,
			       "Position", [0.05 0.5 0.3 0.09]);


  h.ejes = axes ("position", [0.5 0.25 0.4 0.7]);

  guidata(h.main_frame, h)

  set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))

  function actualizar_plot (obj, init = false)
    h = guidata(obj);

    syms x
    y = x^3;
    yy = y;

    grado = 0 + 1*str2num(get(h.grado_derivada, 'String'))

    if (isempty(grado))
      grado = 0;
    end

    dy = diff(yy,x,grado)
    h.grafica = ezplot(dy, [-10 10]);
    guidata (obj, h);
  end

end
