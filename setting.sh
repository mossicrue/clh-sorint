#!/bin/bash

# Script per avviare Chromium in modalità a schermo intero nascondendo le barre di Ubuntu
# URL del sito da avviare
URL="http://localhost:3000"  # Sostituisci con l'URL del tuo sito

# Nascondi il dock e il pannello superiore di GNOME
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

# Imposta la visibilità del pannello superiore
gsettings set org.gnome.shell.extensions.auto-move-windows application-list "['chromium-browser.desktop:1']"

# Disabilita screensaver e risparmio energetico
xset s off
xset -dpms
xset s noblank

# Nascondi il cursore del mouse (richiede il pacchetto unclutter)
if command -v unclutter &> /dev/null; then
    unclutter -idle 1 &
else
    echo "Per nascondere il cursore, installa unclutter: sudo apt install unclutter"
fi

# Avvia Chromium in modalità kiosk (schermo intero)
chromium-browser --start-fullscreen --kiosk --no-first-run --disable-pinch --overscroll-history-navigation=0 $URL
