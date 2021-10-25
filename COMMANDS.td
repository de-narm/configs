################################Commands######################################
#audio loopback!
pactl load-module module-loopback latency_msec=100
pactl unload-module module-loopback

#multiple vim files
:find *name*
:ls - all open buffer
:b *name* - switch to buffer

#autocomplete
ctrl n/ctrl p

#syntax
:set syntax=clojure

#make .tar.gz
tar -czvf data.tar.gz data/
tar -xzvf data.tar.gz

#nested display
Xephyr -br -ac -noreset -screen 800x600 :1
DISPLAY=:1 i3

#squash git commits
git rebase -i HEAD~X

#multiple display presentation
pdfpdc - Presentation

find . -name *~* -exec rm {} \;

sudo openvpn /etc/openvpn/client/vpn-pool.conf

journalctl -p 3 -xb
systemctl --failed

#search from terminal
grep -R -i "Hello" .

#replace all instances vim
:%s/foo/bar/g

#manual spellcheck + shortcuts to add/remove spelling from lsit
:set spell spelllang=en_gb (zg zw z=)

#remove whitespaces at line end
:%s/\s\+$//

#highlight colour comments
:hi Comment ctermfg=darkgrey

#wenn java wieder fehlen sollte
export JAVA_CMD="/usr/lib/jvm/java-15-openjdk/bin/java"

#rekursive suche in allen files
grep -rnsI "JAVA_CMD" *

#start api server with clj ring
lein repl :headless
lein repl :connect nrepl://127.0.0.1:33521
lein ring server headless

#make it a jar
lein ring uberjar

#send request to api
curl -i -H "Content-Type: application/json" 
     --data-binary @basic-req.json http://127.0.0.1:8080/

#pipe
2>&1 | grep

#################################Programmierzeug###############################

Logo
    sprite.setTexture(peng);
    sprite.setPosition(sf::Vector2f(pews[i][0], pews[i][1]));

Clojure sleep
    (Thread/sleep 15000)

#################################Photonencounter###############################

 nvprof -f -o ../prof/a-2gpu.nvprof.nvprof ./jungfrau-photoncounter 

  1) infiniband/1.0.0
  2) /opt/modules/3.2.6/gnu482/mpi/openmpi/1.10.2
  3) /home/benner26/own.modules
  4) git/2.1.2
  5) cuda/7.5
  6) /opt/modules/3.2.6/gnu482/devel/boost/1.65.1
  7) alpaka-0.2.0-gcc-4.8-w2y4ih
  8) cmake/3.7.2
  9) gcc/4.9.2

./ap/spack/share/spack/setup-env.sh                         
spack load alpaka

################################Conexp#########################################

(use 'conexp.main :reload)                                                      
(use 'conexp.gui.draw :reload)                                                  
(use 'conexp.fca.lattices :reload)                                              
(use 'conexp.io.contexts :reload)                                               
(use 'conexp.fca.contexts :reload)                                               
(use 'conexp.gui.draw.control.parameters :reload)                               
(use 'conexp.fca.implications :reload)                                              
(use 'conexp.fca.incremental-ganter :reload)                                              
(draw-lattice (concept-lattice (read-context "../contexts/scale/example.ctx")))

################################Old############################################

#old hzdr stuff
makepkg -si
sshfs hypnos:/home/benner26/HOME/ HZDR/
fusermount -u HZDR/
xrandr --output HDMI2 --left-of eDP1 --auto
xrandr --output HDMI2 --off
feh --bg-scale /home/de/Files/xMisc/snek.jpg

#data42
Billo-Standard mit Groß,Zahl,Sonder und simpler Mindestlänge (10)

#Mail encrpytion
How would you encrypt?

#random collection
ahTui9ee

mf - standard mit n
mf Nummer: 15389394 2600066201
TREinzahlung - 8000

Nachsendeauftrag:  U6673566  (Bestell: 3207966933)

Waschmaschiene 104925357-SBAY7C

##################################Vimextensions################################

https://github.com/kien/rainbow_parentheses.vim
Vim.fireplace
