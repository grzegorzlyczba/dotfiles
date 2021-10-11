#!/bin/bash

# <bitbar.title>Timezones+</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Aaron Edell</bitbar.author>
# <bitbar.author.github>aaronedell</bitbar.author.github>
# <bitbar.desc>Rotates current time through four common timezones </bitbar.desc>
# <bitbar.image>http://i.imgur.com/Y4nhdZo.png</bitbar.image>
# <bitbar.dependencies>Bash GNU AWK</bitbar.dependencies>


font="Menlo"
size=13
color="white"

################################################################################################
# Status bar
#
# CET and PDT in status bar
echo `TZ=":Europe/Warsaw" date +'%a %-d %b, %-H:%M CET, '` `TZ=":US/Pacific" date +' %-H:%M PDT'`"| size=14 font=$font"

# Only CET time in status bar
#echo `date +'%a %-d %b, %-H:%M'` "| size=14 font=$font"

echo "---"

################################################################################################
# Wordwide clock
#
#echo "Krakow      (CET): " `TZ=":Europe/Warsaw" date +'%H:%M'` " | font=$font color=$color size=$size"
#echo "Los Angeles (PDT): " `TZ=":US/Pacific" date +'%H:%M'` "| font=$font color=$color size=$size"
#echo "---"


################################################################################################
# Three months calendar
#
/usr/local/bin/gcal --starting-day=1 . |awk 'NF'|sed 's/ $//' |while IFS= read -r i; do echo " $i|trim=false font=$font size=$size color=$color"|  perl -pe '$b="\b";s/ _$b(\d)_$b(\d) /(\1\2)/' |perl -pe '$b="\b";s/_$b _$b(\d) /(\1)/'  ; done

