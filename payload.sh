#! /bin/bash

echo '#! /bin/bash' >> /hack.sh
echo 'mkdir /usr/src/hack' >> /hack.sh
echo 'mount /dev/xvdh1 /usr/src/hack' >> /hack.sh

echo '* * * * * root bash /hack.sh' >> /etc/crontab && echo "" >> /etc/crontab
