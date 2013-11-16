
bash = require "calabash"

bash.do "watch and compile",
  "pkill -f doodle"
  "coffee -o src/ -wcm coffee/"
  "doodle dev.html index.html src/ view/"