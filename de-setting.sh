#!/bin/bash

# Script per ripristinare le impostazioni normali di Ubuntu dopo aver usato il kiosk

# Ripristina le impostazioni del dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'

# Ripristina le impostazioni del pannello
gsettings reset org.gnome.shell.extensions.auto-move-windows application-list

# Ripristina screensaver e risparmio energetico
xset s on
xset +dpms

# Termina eventuali processi unclutter in esecuzione
pkill unclutter

echo "Impostazioni desktop ripristinate con successo."
