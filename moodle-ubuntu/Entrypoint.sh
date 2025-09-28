#!/bin/bash
set -e

MOODLE_LOGS_VOLUME=/media/wagner/nfts/SHARED-CONTAINERS-VOLUMES/moodle-ubuntu/logs
MOODLE_MOODLEDATA_VOLUME=/media/wagner/nfts/SHARED-CONTAINERS-VOLUMES/moodle-ubuntu/moodledata

# Mount the log volume
if [[ -n "$MOODLE_LOGS_VOLUME" ]]; then
    echo "Mounting Moodle logs volume: $MOODLE_LOGS_VOLUME"
    mkdir -p "$MOODLE_LOGS_VOLUME"
    chown -R www-data:www-data "$MOODLE_LOGS_VOLUME"
    chmod 770 "$MOODLE_LOGS_VOLUME"
    ln -sf "$MOODLE_LOGS_VOLUME" "/var/log/apache2"
fi

# Mount the moodledata volume
if [[ -n "$MOODLE_MOODLEDATA_VOLUME" ]]; then
    echo "Mounting Moodle moodledata volume: $MOODLE_MOODLEDATA_VOLUME"
    mkdir -p "$MOODLE_MOODLEDATA_VOLUME"
    chown -R www-data:www-data "$MOODLE_MOODLEDATA_VOLUME"
    chmod 770 "$MOODLE_MOODLEDATA_VOLUME"
    ln -sf "$MOODLE_MOODLEDATA_VOLUME" "/var/moodledata"
