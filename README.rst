Awesome WM Copycats (editado por Jaglux12)
===================

-------------------------
Temas para Awesome WM 4.x
-------------------------
:Editor: Jaglux12
:Creador: Luca CPZ
:Versión: git
:Licencia: BY-NC-SA_
:Fuente Original: https://github.com/lcpz/awesome-copycats

Descripción
===========

Pack de temas para  Awesome_ window manager, version 4.x.

Mira las  branches_ para versiones anteriores.

Propósito
=======

El propósito principal de este repositorio es compartir temas listos para utilizar
, y que pueda servir como un pequeño libro de configuraciones.

El objetivo secundario es compartir nuevos temas, únicamente cuando consituyan
diferentes diseños en la interfaz de usuario.

Características
========

- Modularidad
- Permite ocuptar widgets automáticamente
- Procesos de inicio automático
- MPD rápido y atajos para el volúmen
- Atajos para copiar al portapapeles,
- Alternar wiboxes, ventanas emergentes para widgets, capturas de pantalla, mover y ampliar ventanas de aplicaciones
- Terminal desplegable de Quake
- Calendario con el día actual resaltado y los meses pueden cambiarse con un desplazamiento
- Notificaciones de nuevos correos electrónicos, música que estás escuchando, nivel del volúmen, estado del disco y batería baja
- Integración con OpenWeatherMap
- Permite notificar el estado del operador de red
- Integración con símbolos para su utilización en nombres
- Cuadro para el diseño de texto similar a DWM
- Barra de widgets Cairo
- Disposiciones de ventana personalizadas
- No son visibles los bordes de una ventana, cuando hay una sola activa
- Iconos de escritorio y menús compatibles con Freedesktop.org
- Enfoque tipo Vi
- Navegación entre etiquetas
- Cambia el tamaño de las ventanas en uso
- Etiquetado dinámico

Capturas de pantalla
=======

**Powercolors**, portado desde romockee_'s (originamente llamado Powerarrow)

.. image:: https://github.com/jaglux12/awesome-copycats/blob/master/themes/powercolors/screenshots/powercolors-0.png


Instalación
============

.. code-block:: shell

    git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
    mv -bv awesome-copycats/{*,.[^.]*} ~/.config/awesome; rm -rf awesome-copycats

Si no quieres los archivos Git, utiliza el siguiente comando, como reemplazo del segundo que ejecutaste anteriormente.

.. code-block:: shell

    mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats

Configuración del tema
=====

Gracias a la estructura modular de awesome-copycats, nos permite:

* Cambiar variables de forma sencilla e intuitiva
* Definir procesos de inicio
* Modificar atajos y disposiciones de ventanas (layouts)
* Establecer nuevas propiedades del cliente

En ``rc.lua`` podemos:

* Configurar artilugios para las ventanas (más conocido como Widgets)
* Definir cajas para notificaciones y más ajustes para la pantalla
 
Ahora solo necesitas seguir los siguientes pasos:

.. code-block:: shell

    $ cd ~/.config/awesome
    $ cp rc.lua.template rc.lua

Para terminar, debemos modificar la variable ``chosen_theme`` de nuestro ``rc.lua``
con tu tema preferido.

La variable ``chosen_theme`` se encuentra debajo de la lista de temas que tenemos para elegír.
	
.. code-block:: lua
	
	-- {{{ Variable definitions

	local themes = {
    	"blackburn",       -- 1
    	"copland",         -- 2
    	"dremora",         -- 3
    	"holo",            -- 4
    	"multicolor",      -- 5
    	"powerarrow",      -- 6
    	"powerarrow-dark", -- 7
    	"rainbow",         -- 8
    	"steamburn",       -- 9
    	"vertex"           -- 10
	}

	local chosen_theme = themes[7]

Por ejemplo: si queremos elegir el tema ``vertex`` , sólo debemos modificar el 
número que se encuentra dentro de los corchetes. En este caso, es el número 10.

En cualquier caso, puedes realizar tu configuración personal, y luego para aplicar
los cambios debes reiniciar tu Awesome (``Mod4 + ctrl + r``). 
 
 Comúnmente la tecla ``Mod4``
 es la que se encuentra entre Ctrl y Alt en la  parte inferior izquierda del teclado.

Para modificar un tema debes hacerlo en este archivo  ``themes/$tema/theme.lua``. 
Generalmente se encuentra en ``/home/nuestrousuario/.config/awesome/themes/$tema/theme.lua`` .

Si ya eres un usuario avanzado y utilizas un tema personalizado, debes modificar el 
archivo ``rc.lua`` , en la siguiente línea:

.. code-block:: diff

    -beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
    +beautiful.init(string.format("%s/.config/awesome/themes/%s/theme-personal.lua", os.getenv("HOME"), chosen_theme))

Donde,  ``theme-personal.lua`` representa tu archivo de modificaciones.

De esta manera, puedes hacer ``git pull`` en cualquier momento.

Atajos
=====
Para utilizar adecuadamente esta gama de temas

Notes
=====

Complements are provided by lain_ and freedesktop_. **Be sure** to satisfy their dependencies_. In particular, mail_ and weather_ widgets have **mandatory** arguments.

Las fuentes utilizadas en las capturas de pantall son: Terminus_ (Multicolor, Powercolors, Powerarrow Dark,Powerainbow), Roboto_ (Holo, Vertex) and Tamzen_ (other ones).

As taglist font, Blackburn and Dremora use Icons_, Vertex uses FontAwesome_: be sure to have bitmaps enabled if running under Debian or Ubuntu_.

Every theme has a colorscheme_.

Para utilizar los temas debemos tener instalado los siguientes programas: ::

    amixer dmenu firefox mpc mpd scrot unclutter xbacklight xsel slock rofi

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0
.. _Awesome: http://github.com/awesomeWM/awesome
.. _branches: https://github.com/lcpz/awesome-copycats/branches
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _swordfischer: https://github.com/lcpz/awesome-copycats/issues/53
.. _foozer: http://dotshare.it/dots/499
.. _lain: https://github.com/lcpz/lain
.. _freedesktop: https://github.com/lcpz/awesome-freedesktop
.. _Terminus: http://terminus-font.sourceforge.net
.. _Roboto: https://fonts.google.com/specimen/Roboto
.. _Tamzen: https://github.com/sunaku/tamzen-font
.. _Icons: https://github.com/lcpz/dots/tree/master/.fonts
.. _FontAwesome: https://github.com/FortAwesome/Font-Awesome
.. _Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
.. _colorscheme: https://github.com/lcpz/dots/tree/master/.colors
.. _dependencies: https://github.com/lcpz/lain/wiki#dependencies
.. _mail: https://github.com/lcpz/lain/wiki/mail
.. _weather: https://github.com/lcpz/lain/wiki/weather
