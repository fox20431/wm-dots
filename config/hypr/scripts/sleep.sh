# unit: sec
# 1800s = 30min
# 2400s = 40min
swayidle -w timeout 1800 'swaylock -f -c 000000' \
            timeout 2400 'systemctl suspend' \
            before-sleep 'swaylock -f -c 000000' &
