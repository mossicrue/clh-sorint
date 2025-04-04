#!/bin/bash

# Script per installare tutte le dipendenze necessarie per il kiosk

# Aggiorna gli indici dei pacchetti
sudo apt update

# Installa Chromium se non è già installato
if ! command -v chromium-browser &> /dev/null; then
    echo "Installando Chromium Browser..."
    sudo apt install -y chromium-browser
fi

# Installa gli strumenti necessari
echo "Installando strumenti necessari per il kiosk..."
sudo apt install -y unclutter wmctrl xdotool

echo "Tutte le dipendenze sono state installate correttamente."