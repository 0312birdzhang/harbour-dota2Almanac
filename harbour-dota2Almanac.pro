# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-dota2Almanac

CONFIG += sailfishapp

SOURCES += src/harbour-dota2Almanac.cpp

OTHER_FILES += qml/harbour-dota2Almanac.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-dota2Almanac.changes.in \
    rpm/harbour-dota2Almanac.spec \
    rpm/harbour-dota2Almanac.yaml \
    translations/*.ts \
    harbour-dota2Almanac.desktop \
    qml/pages/ShowEvents.qml \
    qml/pages/files/API.js \
    harbour-dota2Almanac.png \
    qml/pages/files/icon-launcher-almanac.png

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-dota2Almanac-de.ts

