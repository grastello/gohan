#!/bin/gawk -f
# timer.awk --- set a timer
#
# usage: timer.awk time [tone]
# The tone is played via mpv, but other options are configurable directly below.

BEGIN {
    # Configuration.
    player = "mpv"

    # Initial argument sanity checking.
    usage1 = "usage: timer.awk time [tone]"
    usage2 = sprintf("\t(%s) time ::= [:digits:][smh]", ARGV[1])

    if (ARGC < 2) {
        print usage1 > "/dev/stderr"
        print usage2 > "/dev/stderr"
        exit 1
    }

    if (ARGV[1] !~ /^[[:digit:]]+[mhs]$/) {
        print usage1 > "/dev/stderr"
        print usage2 > "/dev/stderr"
        exit 1
    }

    # Go through the arguments and update our timer's target.
    target = 0
    i = 1
    while (1) {
        if (i >= ARGC)
            break

        if (ARGV[i] ~ /^[[:digit:]]+[mhs]$/) {
            # Extract the value and the unit.
            value = gensub(/([[:digit:]]*)([mhs])/, "\\1", "g", ARGV[i]);
            unit  = gensub(/([[:digit:]]*)([mhs])/, "\\2", "g", ARGV[i]);

            # Update the target time accordingly.
            switch (unit) {
            case "s":
                target += value
                break
            case "m":
                target += value * 60
                break
            case "h":
                target += value * 3600
                break
            default:
                print "\\_(ツ)_/¯" > "/dev/stderr"
                exit 1
                break
            }

            ++i
        } else break
    }

    # From the remaining arguments, if any, take the first one to be the ringtone
    # and ignore any other (this will include possibly more times), but alert the
    # user if it happens.
    ringtone = ""
    ringtone_play = 0
    if (i < ARGC) {
        ringtone = ARGV[i]
        ringtone_play = 1
        ++i
    }

    if (i < ARGC)
        printf("Ignoring %d arguments after '%s'\n", ARGC - i, ARGV[i - 1])

    # Inform the user about the timer.
    hours   = int(target / 3600)
    minutes = int((target - hours * 3600) / 60)
    seconds = target - hours * 3600 - minutes * 60

    if (hours == 0) {hours = ""} else {hours = hours "h"}
    if (minutes == 0) {minutes = ""} else {minutes = minutes "m"}
    if (seconds == 0) {seconds = ""} else {seconds = seconds "s"}

    if (hours && minutes) hours = hours " "
    if (minutes && seconds) minutes = minutes " "
    if (hours && !minutes && seconds) hours = hours " "

    printf("Timer set for %s%s%s.\n", hours, minutes, seconds)

    # Zzzzzzzz... go away if interrupted.
    cmd = sprintf("sleep %d", target)
    if (system(cmd) != 0) {
        print "Timer interrupted."
        exit 1
    }

    # Notify.
    if (ringtone_play) {
        cmd = sprintf("%s %s > /dev/null 2>&1 &", player, ringtone)
        system(cmd)
    }
    print "Time's up!"

    exit 0
}
