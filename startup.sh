# apt update
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev libnotify-dev libgconf2-dev libasound2-dev libcap-dev libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib

# Make automation directory
sudo mkdir ~/automation && cd ~/automation

# Create package.json
npm init -y

# Install nightmare
npm install --save nightmare

# Create bot file
touch ~/automation/bot.js

# Create bot
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


# Run the traffic bot
xvfb-run node bot.js