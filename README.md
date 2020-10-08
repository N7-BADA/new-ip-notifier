# new-ip-reporter
Setup:

1. Get your bot API key from [Telegram's BotFather](https://t.me/BotFather)
2. Get your CHAT_ID from [Telegram's MissRose_bot](https://t.me/@MissRose_bot) by typing `/id`
3. Assign BOT API Key and CHAT_ID in `info.conf`
4. Edit the correct paths in `check.sh`on line 4, 15, 24, 25

## Usage

To run the script : `./check.sh` or `bash check.sh`

To run the script automatically :

`crontab -e`

Add:

`*/1 * * * * bash /path/to/check.sh`

This will run the script every minute.

OR

`0 */1 * * * bash /path/to/check.sh`

This will run the script every hour.
