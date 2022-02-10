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

Features
========

- Modularity
- Autohide widgets
- Autostart windowless processes
- Fast MPD and volume shortcuts (first time this trick has been used in Awesome)
- Shortcuts for copying to the clipboard, toggle wiboxes, widgets popups, screenshots capture, moving and magnifying clients
- Quake drop-down terminal
- Calendar with current day highlighted and months switch with a click/scroll
- Notifications for new mails, current song, volume level, hdd critical state, low battery
- OpenWeatherMap integration
- Net carrier status notifier
- Symbolic tag names
- DWM-like textual layoutbox
- Cairo wibar
- Custom layouts
- No borders when there's only one visible client
- Freedesktop.org compliant menu and desktop icons
- Vi-like client focus
- Non-empty tag browsing
- On-the-fly useless gaps resize
- Dynamic tagging

Capturas de pantalla
=======

**Multicolor**, inspirado en  lucamanni_

.. image:: http://dotshare.it/public/images/uploads/650.png

**Powerarrow**, portado desde romockee_'s

.. image:: http://dotshare.it/public/images/uploads/1453.png

**Powerarrow Dark**

.. image:: http://dotshare.it/public/images/uploads/649.jpg

**Powerarrow Colors**



**Steamburn**, portado desde ok100_'s dwm

.. image:: http://dotshare.it/public/images/uploads/648.png

**Blackburn**

.. image:: http://dotshare.it/public/images/uploads/553.png

**Dremora**

.. image:: http://dotshare.it/public/images/uploads/652.png

**Rainbow**

.. image:: http://dotshare.it/public/images/uploads/606.png

**Holo**, pedido por amouly_

.. image:: http://dotshare.it/public/images/uploads/651.jpg

**Copland**, inspirado en foozer_

.. image:: http://dotshare.it/public/images/uploads/655.png

**Vertex**, pedido por swordfischer_

.. image:: http://dotshare.it/public/images/uploads/1432.jpg

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

Ahora simplemente debemos modificar la variable ``chosen_theme`` de nuestro ``rc.lua``
con tu tema preferido, puedes realizar tu configuración personal, y luego para aplicar
los cambios debes reiniciar tu Awesome (``Mod4 + ctrl + r``).

Comúnmente la tecla ``Mod4`` es la tecla que se encuentra entre Ctrl y Alt en la  parte inferior izquierda del teclado.

Para modificar un tema debes hacerlo en este archivo  ``themes/$tema/theme.lua``. 
Generalmente se encuentra en ``/home/nuestrousuario/.config/awesome/themes/$tema/theme.lua`` .

Otherwise, if you want to be synced with upstream, modify the theme path in ``rc.lua`` like this:

.. code-block:: diff

    -beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
    +beautiful.init(string.format("%s/.config/awesome/themes/%s/theme-personal.lua", os.getenv("HOME"), chosen_theme))

then, copy ``theme.lua`` to ``theme-personal.lua`` and do your customizations there.

This way, you can safely ``git pull`` anytime.

Notes
=====

Complements are provided by lain_ and freedesktop_. **Be sure** to satisfy their dependencies_. In particular, mail_ and weather_ widgets have **mandatory** arguments.

Las fuentes utilizadas en las capturas de pantall son: Terminus_ (Multicolor, Powerarrow, Powerarrow Dark,Powerarrow Colors), Roboto_ (Holo, Vertex) and Tamzen_ (other ones).

As taglist font, Blackburn and Dremora use Icons_, Vertex uses FontAwesome_: be sure to have bitmaps enabled if running under Debian or Ubuntu_.

Every theme has a colorscheme_.

Para utilizar los temas debemos tener instalado los siguientes programas: ::

    amixer dmenu librewolf mpc mpd scrot unclutter xbacklight xsel slock

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
