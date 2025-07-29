# cronlog_cleaner.awk --- clean the ~/.cronlog file
#
# Remove any record in our cronjob log file older than a week.

BEGIN {
    # Configuration.
    day = 86400
    min = systime() - day * 7

	# Make a temporary file to swap with the original.
    "mktemp" | getline tmpfile
    close("mktemp")
}

function unixtime(s) {
    # Transform the YYYY-MM-DD format we use in the log file to YYYY MM DD HH SS
    # which can safely be fed to mktime in order to get unix time.
    gsub(/-/, " ", s)
    s = s " 00 00 00"
    return mktime(s)
}

{
    # Save line only if it isn't older than now - one week.
    time = unixtime($1)
	if (time >= min) print $0 > tmpfile
}

END {
	# Swap temporary file and the original one.
	cmd = sprintf("cp %s %s", tmpfile, FILENAME)
	system(cmd)

    # Delete the temporary file.i
	cmd = sprintf("rm %s", tmpfile)
	system(cmd)
}
