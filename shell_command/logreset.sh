# logreset.sh
#
# This bash script is intended as a midnight reset to clean the log
# each day.  It will first take all of the current contents of the
# home-assistant.log file and append YESTERDAYS log (considering
# a midnight action represents a fresh log for TODAY) then clear the
# log.  Additionally it will create a new log file for TODAY so we
# can have that as a reference.
#
# @version: 1.0.0

# Create logs directory if it doesn't exist
mkdir -p "/config/logs"

# Current date
CURRENTDATE=`date +"%Y-%m-%d"`.log

# Calculate yesterday with BusyBox
YESTERDAY=`date +%s`
YESTERDAY=$(($YESTERDAY - 86400))
YESTERDAY=`date -d@${YESTERDAY} +"%Y-%m-%d"`.log

# Summarize for debugging
echo Current Log File Name is: ${CURRENTDATE}
echo Yesterday Log File Name is: ${YESTERDAY}

# Pipe yesterdays log into its file
cat home-assistant.log >> "/config/logs/${YESTERDAY}"

# Create new file for today (in case we want to do regular purging throughout the day
touch "/config/logs/${CURRENTDATE}"

# Clear the home-assistant.log
truncate -s 0 "/config/home-assistant.log"
