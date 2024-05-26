function menu_grafica (obj, init)

  pkg load symbolic;

  h.main_frame = figure('name', 'Menu grafica','numbertitle','off');

  h.label_derivada = uicontrol (h.main_frame,'style', 'text',...
				'units', 'normalized',...
				'string', 'Funcion',...
				'Position', [0.05 0.9 0.2 0.09]);

  h.funcion = uicontrol(h.main_frame,'style', 'edit',...
			'units', 'normalized',...
			'Position', [0.05 0.8 0.2 0.09]);


  h.graficar_funcion = uicontrol (h.main_frame,'style', 'pushbutton',...
				  'units', 'normalized',...
				  'string', 'Graficar',...
				  'callback', {@actualizar_plot},...
				  'position', [0.05 0.7 0.2 0.09]);

  h.label_derivada = uicontrol (h.main_frame,'style', 'text',...
				'units', 'normalized',...
				'string', 'Orden derivacion',...
				'Position', [0.05 0.6 0.2 0.09]);

  h.grado_derivada = uicontrol(h.main_frame,'style', 'edit',...
			       'units', 'normalized',...
			       'value', 0,...
			       'Position', [0.05 0.5 0.2 0.09]);


  h.label_intervalo = uicontrol (h.main_frame,'style', 'text',...
				 'units', 'normalized',...
				 'string', 'Intervalo',...
				 'Position', [0.05 0.4 0.2 0.09]);

  h.intervalo1 = uicontrol(h.main_frame,'style', 'edit',...
			   'units', 'normalized',...
			   'value', -2,...
			   'Position', [0.05 0.3 0.1 0.09]);

  h.intervalo2 = uicontrol(h.main_frame,'style', 'edit',...
			   'units', 'normalized',...
			   'value',2,...
			   'Position', [0.15 0.3 0.1 0.09]);

  h.ejes = axes ('position', [0.5 0.2 0.4 0.7]);

  guidata(h.main_frame, h)

  set (gcf, 'color', get(0, 'defaultuicontrolbackgroundcolor'))

  function actualizar_plot (obj, init)
    h = guidata(obj);

    syms x
    y =  get(h.funcion, 'String');

    if (isempty(y))
      yy = sym('x^3');
    else
      yy = sym(y);
    end

    der_fixer = 1;

    grado = 0 + 1*str2num(get(h.grado_derivada, 'String'));

    int_inicio =  str2num(get(h.intervalo1, 'String'));
    int_fin =  str2num(get(h.intervalo2, 'String'));

    if (isempty(int_inicio))
      int_inicio = get(h.intervalo1, 'value');
    end

    if (isempty(int_fin))
      int_fin = get(h.intervalo2, 'value');
    end

    if (int_inicio > int_fin)
      [int_inicio int_fin] = deal(int_fin, int_inicio);
    end 

    if (isempty(grado))
      grado = 0;
    end

    dy = diff(yy,x,grado);

    if (isallconstant(dy))
      mensaje_error('La funcion no acepta ese orden de derivacion')
      while (isallconstant(dy))
	dy = diff(yy,x,grado - der_fixer);
	der_fixer = der_fixer + 1;
      end
    end
    h.grafica = ezplot(dy, [int_inicio int_fin]);
    guidata (obj, h);
  end

end
