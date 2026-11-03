#!/usr/bin/env bash

set -euo pipefail

# Adres urządzenia McLighting
IP="10.0.0.190"
PORT="81"

# Układ 50 LED:
# 0-11   czerwony
# 12-24  biały
# 25-36  biały
# 37-49  czerwony
KOMENDA="R0011ff0000R1224ffffffR2536ffffffR3749ff0000"

WEBSOCAT="$HOME/.cargo/bin/websocat"

if [[ ! -x "$WEBSOCAT" ]]; then
    if command -v websocat >/dev/null 2>&1; then
        WEBSOCAT="$(command -v websocat)"
    else
        echo "BŁĄD: Nie znaleziono websocat."
        echo "Zainstaluj go poleceniem: cargo install websocat"
        exit 1
    fi
fi

echo "Łączenie z McLighting: ws://${IP}:${PORT}/"

if printf '%s\n' "$KOMENDA" | timeout 5 "$WEBSOCAT" "ws://${IP}:${PORT}/"; then
    echo "Komenda wysłana."
else
    echo "BŁĄD: Nie udało się wysłać komendy."
    exit 1
fi
