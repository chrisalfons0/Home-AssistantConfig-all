# logappend.sh
#
# This bash script will read the home-assistant.log file and APPEND todays
# log in /config/logs then clear the home-assistant.log, allowing the user
# to periodically clean up their log file throughout the day.
#
# @version: 1.0.0

# Create logs directory if it doesn't exist
mkdir -p "/config/logs"

# Current date
CURRENTDATE=`date +"%Y-%m-%d"`.log

# Summarize for debugging
echo Current Log File Name is: ${CURRENTDATE}

# Pipe current log into its file
cat home-assistant.log >> /config/logs/${CURRENTDATE}

# Clear the home-assistant.log
truncate -s 0 "/config/home-assistant.log"