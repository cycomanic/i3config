#!/bin/bash

STATE_SCREENSAVER="/tmp/wm-screensaver-`whoami`.state"

run_screensaver() {
    exec xautolock -time 5 \
    -locker "/home/jschrod/.local/bin/screenlocker.sh"\
    -detectsleep\
    -notify 30 \
    -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" >/dev/null 2>&1 &
    echo 'enable' > $STATE_SCREENSAVER
}

presentation_mode_on() {
    xset -dpms
    xset s off
    xautolock -disable
    echo 'disable' > $STATE_SCREENSAVER
    notify-send -t 10000 'presentation mode on'
}

presentation_mode_off() {
    xset +dpms
    xset s on
    xautolock -enable
    echo 'enable' > $STATE_SCREENSAVER
    notify-send -t 10000 'presentation mode off'
}

case "$1" in
    presentation_mode)
        case "$2" in
            on)
                presentation_mode_on
            ;;
            off)
                presentation_mode_off
            ;;
            toggle)
                state=`cat $STATE_SCREENSAVER 2>/dev/null`
                if [ $state == 'disable' ]; then
                    presentation_mode_off
                elif [ $state == 'enable' ]; then
                    presentation_mode_on
                else
                    notify-send -u critical -t 10000 'state of presentation mode is unknown'
                fi
             ;;
            *)
                echo "on / off / toggle"
            ;;
        esac
    ;;
    autostart)
        run_screensaver
        compton &
        #feh --bg-scale /usr/share/backgrounds/Spring_by_Peter_Apas.jpg &
        /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
        setxkbmap -option 'compose:caps' &
        #unity-settings-daemon &
        udiskie -T -a &
        davmail &
        nm-applet &
        emacs --daemon &
        gdfs -o big_writes ~/.confg/gdfs/gdfs.cred ~/Gdrive &
        ~/.dropbox-dist/dropboxd &
        #synapse -s &

        #kbdd &
        #setxkbmap -layout 'us,ru' -option 'grp:caps_toggle' &
        #clipmenud &
        #(sleep 20; pavucontrol) &
        #screencloud &
        #megasync &
    ;;
    startlock)
        run_screensaver
    ;;
    *)
        echo "presentation_mode / autostart"
    ;;
esac
