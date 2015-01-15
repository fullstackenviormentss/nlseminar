#!/bin/sh

# Set working, storage, and seminar-data directories
SEMINAR_HOME=/nfs/isd/damghani/nlseminar
SEMINAR_LIVE=/nfs/web/htdocs/division3/natural-language/nl-seminar
BACKUP=$SEMINAR_HOME/backup
DATA=$SEMINAR_HOME/data

# Set output filenames
WEBSITE=$SEMINAR_HOME/index.php
CALENDAR=$SEMINAR_HOME/nl.ics

# Set mailer used to send announcements
MAILER=/usr/sbin/sendmail

# BACKUP
cp $SEMINAR_HOME/index.php $SEMINAR_HOME/nl.ics $BACKUP

# GENERATE DATE
# yanggao20130808 added recipient: all current usc cs students
python $SEMINAR_HOME/seminar.py --data $DATA \
                                --website $WEBSITE \
                                --ical $CALENDAR \
                                --mailer $MAILER \
                                --sender_name "Nima Pourdamghani" \
                                --sender_email "damghani@isi.edu" \
                                --recipient "damghani@isi.edu" \
                                --public_url  "http://www.isi.edu/natural-language/nl-seminar/"

# COPY TO LIVE LOCATION
cp $WEBSITE $CALENDAR $SEMINAR_LIVE/
