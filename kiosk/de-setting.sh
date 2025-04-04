#!/bin/bash

# Script per ripristinare le impostazioni normali di Ubuntu dopo aver usato il kiosk

# Ripristina le impostazioni del dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true

# Ripristina le impostazioni del pannello superiore (varia in base alla versione di GNOME)
if gsettings list-schemas | grep -q "org.gnome.shell.extensions.hide-top-bar"; then
    gsettings reset org.gnome.shell.extensions.hide-top-bar mouse-sensitive
    gsettings reset org.gnome.shell.extensions.hide-top-bar shortcut-toggles
    gsettings reset org.gnome.shell.extensions.hide-top-bar enable-intellihide
    gsettings reset org.gnome.shell.extensions.hide-top-bar enable-active-window
fi

if gsettings list-schemas | grep -q "org.gnome.shell.extensions.auto-hide-top-panel"; then
    gsettings reset org.gnome.shell.extensions.auto-hide-top-panel hide-panel
fi

# Ripristina screensaver e risparmio energetico
xset s on
xset +dpms

# Termina eventuali processi di background
pkill unclutter
pkill chromium

echo "Impostazioni desktop ripristinate con successo."