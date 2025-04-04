#!/bin/bash

# Script per avviare Chromium in modalità a schermo intero nascondendo tutte le barre
# URL del sito da avviare
URL="http://localhost:3000"  # Sostituisci con l'URL del tuo sito

# Verifica se sono installati i pacchetti necessari
if ! command -v unclutter &> /dev/null; then
    echo "Installando unclutter per nascondere il cursore..."
    sudo apt install -y unclutter
fi

if ! command -v wmctrl &> /dev/null; then
    echo "Installando wmctrl per gestire le finestre..."
    sudo apt install -y wmctrl
fi

# Nascondi il dock e il pannello superiore di GNOME
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Prova a nascondere il pannello superiore (varia in base alla versione di GNOME)
# Metodo 1: per GNOME Shell con l'estensione hide-top-bar
if gsettings list-schemas | grep -q "org.gnome.shell.extensions.hide-top-bar"; then
    gsettings set org.gnome.shell.extensions.hide-top-bar mouse-sensitive false
    gsettings set org.gnome.shell.extensions.hide-top-bar shortcut-toggles false
    gsettings set org.gnome.shell.extensions.hide-top-bar enable-intellihide false
    gsettings set org.gnome.shell.extensions.hide-top-bar enable-active-window false
fi

# Metodo 2: per Ubuntu con auto-hide-top-panel
if gsettings list-schemas | grep -q "org.gnome.shell.extensions.auto-hide-top-panel"; then
    gsettings set org.gnome.shell.extensions.auto-hide-top-panel hide-panel true
fi

# Disabilita screensaver e risparmio energetico
xset s off
xset -dpms
xset s noblank

# Nascondi il cursore del mouse
unclutter -idle 0.1 &

# Avvia Chromium in modalità kiosk VERA (non solo fullscreen) senza barre
chromium-browser --kiosk --app=$URL --no-first-run --disable-pinch --overscroll-history-navigation=0 --disable-infobars --disable-translate --no-default-browser-check --disable-sync

# Attendi che la finestra si apra
sleep 2

# Usa wmctrl per massimizzare ulteriormente e rimuovere decorazioni della finestra
wmctrl -r :ACTIVE: -b add,fullscreen

# Passa alla modalità F11 dopo un secondo per assicurare che siano nascoste tutte le barre
sleep 1
xdotool key F11