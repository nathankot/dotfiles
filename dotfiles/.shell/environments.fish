### Browser testing

set -x CHROME_BIN ~/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
set -x OPERA_BIN ~/Applications/Opera.app/Contents/MacOS/Opera

### Ledger

set -x LEDGER ~/Documents/Personal/Accounts/current.ledger

# MONGODB

set -x BOXEN_MONGODB_HOST 127.0.0.1
set -x BOXEN_MONGODB_PORT 27017
set -x BOXEN_MONGODB_URL mongodb://$BOXEN_MONGODB_HOST:$BOXEN_MONGODB_PORT/
