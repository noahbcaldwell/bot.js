sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev libnotify-dev libgconf2-dev libasound2-dev libcap-dev libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib
sudo mkdir ~/automation && cd ~/automation
npm init -y
npm install --save nightmare
touch ~/automation/bot.js
echo "
    const Nightmare = require('nightmare');
    const nightmare = Nightmare({show: true});


    nightmare
        .goto('https://delightfulinsights.com')
        .then((gotoResult) => {
            console.log(gotoResult.code); //prints out the HTTP status for the request
        })
        .catch(function(e)  {
                console.log(e);
        });
" >> bot.jsxvfb
xvfb-run node bot.js