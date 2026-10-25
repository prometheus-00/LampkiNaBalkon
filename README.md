# LampkiNaBalkon

Sterowanie oświetleniem LED na balkonie z wykorzystaniem projektu **McLighting** i wymaganych bibliotek.

## Opis projektu

`LampkiNaBalkon` to projekt oświetlenia balkonu oparty na McLighting — rozwiązaniu umożliwiającym sterowanie adresowalnymi diodami LED za pomocą mikrokontrolera z obsługą Wi-Fi.

Celem projektu jest stworzenie wygodnego systemu oświetlenia, który pozwala zarządzać kolorami i efektami świetlnymi bezpośrednio z poziomu sieci lokalnej.

### Możliwości

- Sterowanie oświetleniem LED przez Wi-Fi.
- Obsługa kolorów RGB i efektów animacji — zgodnie z konfiguracją firmware.
- Zarządzanie oświetleniem przez interfejs WWW.
- Możliwość rozbudowy o integrację MQTT i systemy automatyki domowej, jeśli zostały włączone w konfiguracji.
- Dostosowanie parametrów sterownika do zastosowanej instalacji LED.

## Architektura

```mermaid
flowchart TD
    A[Telefon lub komputer] -->|Wi-Fi| B[Sieć lokalna]
    B --> C[Mikrokontroler z McLighting]
    C --> D[Taśma LED]
    E[Zasilacz LED] --> D
    F[Opcjonalny broker MQTT] <--> C
```

## Wymagane komponenty

- Mikrokontroler kompatybilny z używaną wersją McLighting.
- Adresowalna taśma LED RGB, zgodna z konfiguracją projektu.
- Zasilacz dopasowany do napięcia i maksymalnego poboru prądu taśmy.
- Przewody i odpowiednie połączenia elektryczne.
- Komputer z Arduino IDE do przygotowania i wgrania firmware.
- Sieć Wi-Fi zapewniająca komunikację ze sterownikiem.

## Oprogramowanie

- Arduino IDE.
- Firmware McLighting oraz wymagane biblioteki.
- Sterowniki i pakiety dla wybranej płytki mikrokontrolera.
- Opcjonalnie broker MQTT i system automatyki domowej.

Biblioteki należy dobrać do wersji McLighting znajdującej się w repozytorium. W przypadku korzystania z forka lub zmodyfikowanej wersji mogą być wymagane inne wersje zależności.

## Instalacja i konfiguracja

### 1. Pobranie repozytorium

```bash
git clone https://github.com/prometheus-00/LampkiNaBalkon.git
cd LampkiNaBalkon
```

### 2. Przygotowanie środowiska

1. Zainstaluj Arduino IDE.
2. Skonfiguruj obsługę płytki mikrokontrolera.
3. Otwórz projekt w Arduino IDE.
4. Zainstaluj biblioteki wymagane przez dołączony kod.
5. Sprawdź konfigurację sieci Wi-Fi oraz parametry taśmy LED.

### 3. Konfiguracja sprzętu

Przed wgraniem programu sprawdź w plikach źródłowych:

- pin sygnałowy sterujący taśmą LED;
- liczbę diod LED;
- typ obsługiwanej taśmy;
- parametry połączenia Wi-Fi;
- opcjonalną konfigurację MQTT.

**Uwaga:** wartości pinów, liczby diod i ustawień sieciowych muszą odpowiadać faktycznie użytemu sprzętowi i wersji oprogramowania.

### 4. Wgranie firmware

1. Podłącz mikrokontroler do komputera przez USB.
2. Wybierz właściwą płytkę oraz port komunikacyjny w Arduino IDE.
3. Skompiluj projekt.
4. Wgraj firmware do mikrokontrolera.
5. Otwórz monitor portu szeregowego, jeśli jest potrzebny do diagnostyki.

### 5. Uruchomienie

Po uruchomieniu sterownika połącz się z siecią skonfigurowaną dla projektu i ustal adres IP urządzenia. Następnie otwórz interfejs WWW pod adresem sterownika.

Dokładny sposób pierwszej konfiguracji zależy od wersji McLighting oraz ustawień Wi-Fi zapisanych w projekcie.

## Integracja z automatyką domową

Jeśli firmware ma włączoną obsługę MQTT, sterownik można wykorzystać w systemie automatyki domowej, na przykład Home Assistant.

Wymaga to odpowiedniej konfiguracji:

- brokera MQTT;
- danych połączenia i uwierzytelniania;
- tematów MQTT;
- integracji obsługiwanej przez daną wersję firmware.

Integracja MQTT jest opcjonalna i zależy od konfiguracji kompilacji.

## Bezpieczeństwo instalacji

- Dobierz zasilacz do napięcia znamionowego taśmy LED.
- Uwzględnij maksymalny pobór prądu wszystkich diod.
- Nie zasilaj długiej taśmy LED bezpośrednio z pinu mikrokontrolera.
- Zapewnij odpowiedni przekrój przewodów i stabilne połączenia.
- Zabezpiecz elektronikę przed wilgocią, deszczem i kondensacją pary wodnej.
- Nie umieszczaj niezabezpieczonych połączeń elektrycznych na zewnątrz.

## Rozwiązywanie problemów

| Problem | Co sprawdzić |
|---|---|
| Sterownik nie łączy się z Wi-Fi | Dane sieciowe, zasięg i konfigurację firmware |
| Interfejs WWW jest niedostępny | Adres IP, połączenie sieciowe i logi urządzenia |
| Diody nie świecą | Zasilanie, polaryzację, przewód DATA i konfigurację pinu |
| Nie wszystkie diody działają | Liczbę diod, połączenia i wydajność zasilania |
| Nie działają efekty | Wersje bibliotek i konfigurację firmware |
| MQTT nie działa | Adres brokera, port, uwierzytelnianie i tematy |

## Struktura repozytorium

Aktualną strukturę plików można sprawdzić poleceniem:

```bash
find . -maxdepth 3 -type f
```

Poszczególne katalogi i pliki należy opisać zgodnie z ich faktyczną zawartością w repozytorium.


## REST API


curl "http://10.0.0.14/set_mode?m=0&rgb=FF0000&p=255&s=128"
curl "http://10.0.0.190/set_mode?m=1&rgb=00FF00&p=255&s=128"
curl "http://10.0.0.189/set_mode?m=2&rgb=0000FF&p=255&s=128"


curl -s http://10.0.0.14/get_modes
curl -s http://10.0.0.190/get_modes
curl -s http://10.0.0.189/get_modes
[{"mode":"e131","name":"E131"},{"mode":0,"name":"Static"},{"mode":1,"name":"Blink"},{"mode":2,"name":"Breath"},{"mode":3,"name":"Color Wipe"},{"mode":4,"name":"Color Wipe Inverse"},{"mode":5,"name":"Color Wipe Reverse"},{"mode":6,"name":"Color Wipe Reverse Inverse"},{"mode":7,"name":"Color Wipe Random"},{"mode":8,"name":"Random Color"},{"mode":9,"name":"Single Dynamic"},{"mode":10,"name":"Multi Dynamic"},{"mode":11,"name":"Rainbow"},{"mode":12,"name":"Rainbow Cycle"},{"mode":13,"name":"Scan"},{"mode":14,"name":"Dual Scan"},{"mode":15,"name":"Fade"},{"mode":16,"name":"Theater Chase"},{"mode":17,"name":"Theater Chase Rainbow"},{"mode":18,"name":"Running Lights"},{"mode":19,"name":"Twinkle"},{"mode":20,"name":"Twinkle Random"},{"mode":21,"name":"Twinkle Fade"},{"mode":22,"name":"Twinkle Fade Random"},{"mode":23,"name":"Sparkle"},{"mode":24,"name":"Flash Sparkle"},{"mode":25,"name":"Hyper Sparkle"},{"mode":26,"name":"Strobe"},{"mode":27,"name":"Strobe Rainbow"},{"mode":28,"name":"Multi Strobe"},{"mode":29,"name":"Blink Rainbow"},{"mode":30,"name":"Chase White"},{"mode":31,"name":"Chase Color"},{"mode":32,"name":"Chase Random"},{"mode":33,"name":"Chase Rainbow"},{"mode":34,"name":"Chase Flash"},{"mode":35,"name":"Chase Flash Random"},{"mode":36,"name":"Chase Rainbow White"},{"mode":37,"name":"Chase Blackout"},{"mode":38,"name":"Chase Blackout Rainbow"},{"mode":39,"name":"Color Sweep Random"},{"mode":40,"name":"Running Color"},{"mode":41,"name":"Running Red Blue"},{"mode":42,"name":"Running Random"},{"mode":43,"name":"Larson Scanner"},{"mode":44,"name":"Comet"},{"mode":45,"name":"Fireworks"},{"mode":46,"name":"Fireworks Random"},{"mode":47,"name":"Merry Christmas"},{"mode":48,"name":"Fire Flicker"},{"mode":49,"name":"Fire Flicker (soft)"},{"mode":50,"name":"Fire Flicker (intense)"},{"mode":51,"name":"Circus Combustus"},{"mode":52,"name":"Halloween"},{"mode":53,"name":"Bicolor Chase"},{"mode":54,"name":"Tricolor Chase"},{"mode":55,"name":"TwinkleFOX"},{"mode":56,"name":"Custom 0"},{"mode":57,"name":"Custom 1"},{"mode":58,"name":"Custom 2"},{"mode":59,"name":"Custom 3"},{"mode":60,"name":"Custom 4"},{"mode":61,"name":"Custom 5"},{"mode":62,"name":"Custom 6"},{"mode":63,"name":"Custom 7"},{}][{"mode":"e131","name":"E131"},{"mode":0,"name":"Static"},{"mode":1,"name":"Blink"},{"mode":2,"name":"Breath"},{"mode":3,"name":"Color Wipe"},{"mode":4,"name":"Color Wipe Inverse"},{"mode":5,"name":"Color Wipe Reverse"},{"mode":6,"name":"Color Wipe Reverse Inverse"},{"mode":7,"name":"Color Wipe Random"},{"mode":8,"name":"Random Color"},{"mode":9,"name":"Single Dynamic"},{"mode":10,"name":"Multi Dynamic"},{"mode":11,"name":"Rainbow"},{"mode":12,"name":"Rainbow Cycle"},{"mode":13,"name":"Scan"},{"mode":14,"name":"Dual Scan"},{"mode":15,"name":"Fade"},{"mode":16,"name":"Theater Chase"},{"mode":17,"name":"Theater Chase Rainbow"},{"mode":18,"name":"Running Lights"},{"mode":19,"name":"Twinkle"},{"mode":20,"name":"Twinkle Random"},{"mode":21,"name":"Twinkle Fade"},{"mode":22,"name":"Twinkle Fade Random"},{"mode":23,"name":"Sparkle"},{"mode":24,"name":"Flash Sparkle"},{"mode":25,"name":"Hyper Sparkle"},{"mode":26,"name":"Strobe"},{"mode":27,"name":"Strobe Rainbow"},{"mode":28,"name":"Multi Strobe"},{"mode":29,"name":"Blink Rainbow"},{"mode":30,"name":"Chase White"},{"mode":31,"name":"Chase Color"},{"mode":32,"name":"Chase Random"},{"mode":33,"name":"Chase Rainbow"},{"mode":34,"name":"Chase Flash"},{"mode":35,"name":"Chase Flash Random"},{"mode":36,"name":"Chase Rainbow White"},{"mode":37,"name":"Chase Blackout"},{"mode":38,"name":"Chase Blackout Rainbow"},{"mode":39,"name":"Color Sweep Random"},{"mode":40,"name":"Running Color"},{"mode":41,"name":"Running Red Blue"},{"mode":42,"name":"Running Random"},{"mode":43,"name":"Larson Scanner"},{"mode":44,"name":"Comet"},{"mode":45,"name":"Fireworks"},{"mode":46,"name":"Fireworks Random"},{"mode":47,"name":"Merry Christmas"},{"mode":48,"name":"Fire Flicker"},{"mode":49,"name":"Fire Flicker (soft)"},{"mode":50,"name":"Fire Flicker (intense)"},{"mode":51,"name":"Circus Combustus"},{"mode":52,"name":"Halloween"},{"mode":53,"name":"Bicolor Chase"},{"mode":54,"name":"Tricolor Chase"},{"mode":55,"name":"TwinkleFOX"},{"mode":56,"name":"Custom 0"},{"mode":57,"name":"Custom 1"},{"mode":58,"name":"Custom 2"},{"mode":59,"name":"Custom 3"},{"mode":60,"name":"Custom 4"},{"mode":61,"name":"Custom 5"},{"mode":62,"name":"Custom 6"},{"mode":63,"name":"Custom 7"},{}][{"mode":"e131","name":"E131"},{"mode":0,"name":"Static"},{"mode":1,"name":"Blink"},{"mode":2,"name":"Breath"},{"mode":3,"name":"Color Wipe"},{"mode":4,"name":"Color Wipe Inverse"},{"mode":5,"name":"Color Wipe Reverse"},{"mode":6,"name":"Color Wipe Reverse Inverse"},{"mode":7,"name":"Color Wipe Random"},{"mode":8,"name":"Random Color"},{"mode":9,"name":"Single Dynamic"},{"mode":10,"name":"Multi Dynamic"},{"mode":11,"name":"Rainbow"},{"mode":12,"name":"Rainbow Cycle"},{"mode":13,"name":"Scan"},{"mode":14,"name":"Dual Scan"},{"mode":15,"name":"Fade"},{"mode":16,"name":"Theater Chase"},{"mode":17,"name":"Theater Chase Rainbow"},{"mode":18,"name":"Running Lights"},{"mode":19,"name":"Twinkle"},{"mode":20,"name":"Twinkle Random"},{"mode":21,"name":"Twinkle Fade"},{"mode":22,"name":"Twinkle Fade Random"},{"mode":23,"name":"Sparkle"},{"mode":24,"name":"Flash Sparkle"},{"mode":25,"name":"Hyper Sparkle"},{"mode":26,"name":"Strobe"},{"mode":27,"name":"Strobe Rainbow"},{"mode":28,"name":"Multi Strobe"},{"mode":29,"name":"Blink Rainbow"},{"mode":30,"name":"Chase White"},{"mode":31,"name":"Chase Color"},{"mode":32,"name":"Chase Random"},{"mode":33,"name":"Chase Rainbow"},{"mode":34,"name":"Chase Flash"},{"mode":35,"name":"Chase Flash Random"},{"mode":36,"name":"Chase Rainbow White"},{"mode":37,"name":"Chase Blackout"},{"mode":38,"name":"Chase Blackout Rainbow"},{"mode":39,"name":"Color Sweep Random"},{"mode":40,"name":"Running Color"},{"mode":41,"name":"Running Red Blue"},{"mode":42,"name":"Running Random"},{"mode":43,"name":"Larson Scanner"},{"mode":44,"name":"Comet"},{"mode":45,"name":"Fireworks"},{"mode":46,"name":"Fireworks Random"},{"mode":47,"name":"Merry Christmas"},{"mode":48,"name":"Fire Flicker"},{"mode":49,"name":"Fire Flicker (soft)"},{"mode":50,"name":"Fire Flicker (intense)"},{"mode":51,"name":"Circus Combustus"},{"mode":52,"name":"Halloween"},{"mode":53,"name":"Bicolor Chase"},{"mode":54,"name":"Tricolor Chase"},{"mode":55,"name":"TwinkleFOX"},{"mode":56,"name":"Custom 0"},{"mode":57,"name":"Custom 1"},{"mode":58,"name":"Custom 2"},{"mode":59,"name":"Custom 3"},{"mode":60,"name":"Custom 4"},{"mode":61,"name":"Custom 5"},{"mode":62,"name":"Custom 6"},{"mode":63,"name":"Custom 7"},{}]


## Licencja

Przed określeniem licencji projektu należy sprawdzić plik `LICENSE` oraz warunki licencyjne wykorzystanego kodu McLighting i dołączonych bibliotek.

## Autor i źródła

- **Autor projektu:** [prometheus-00](https://github.com/prometheus-00)
- **Repozytorium:** [LampkiNaBalkon](https://github.com/prometheus-00/LampkiNaBalkon)
- **Projekt bazowy:** [McLighting](https://github.com/toblum/McLighting)

---

Projekt przeznaczony do eksperymentowania z oświetleniem LED i automatyką domową.
