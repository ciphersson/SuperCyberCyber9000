#!/bin/bash

cat << "EOF"
 ____ _  _ ___  ____ ____   ____ _ _ ___  ____ ____   ____ _ _ ___  ____ ____  
 ==== |__| |--' |=== |--<   |___  Y  |==] |=== |--<   |___  Y  |==] |=== |--<   
                                                                      

      >>>>>  Super Cyber Cyber 9000 hardening script <<<<< 
           >>>>>  And other random shit <<<<<< 
         
                How to get this to work. 

     First, download file CyberLock9000.sh to (or were ever) desktop,  
     Second cd to your Desktop,  
     cd Desktop 
     Third, give this script permission to run  
     chmod +x SuperCyberCyber9000.sh 
     Forth, run  ./SuperCyberCyber9000.sh 

EOF



Install_LibCrack2() {
    sudo apt-get install libcrack2

}
scripts+=(Install_LibCrack2)

HowToCheckPassWithLibCrack() {
    cat << "EOF"
  
   Open another terminal and run 

              echo "password" | cracklib-check

                     Were password is the password you want to check.

EOF
}
scripts+=(HowToCheckPassWithLibCrack)

OpenSSLpassWordGenerator() {
    openssl rand -base64 42
}
scripts+=(OpenSSLpassWordGenerator)

SystemINFO() {
    LSB=/usr/bin/lsb_release

# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
  local message="$@"
  [ -z $message ] && message="Press [Enter] key to continue..."
  read -p "$message" readEnterKey
}

# Purpose  - Display a menu on screen
function show_menu(){
    date
    echo "---------------------------"
    echo "   Main Menu"
    echo "---------------------------"
  echo "1. Operating system info"
  echo "2. Hostname and dns info"
  echo "3. Network info"
  echo "4. Who is online"
  echo "5. Last logged in users"
  echo "6. Free and used memory info"
  echo "7. exit"
}

# Purpose - Display header message
# $1 - message
function write_header(){
  local h="$@"
  echo "---------------------------------------------------------------"
  echo "     ${h}"
  echo "---------------------------------------------------------------"
}

# Purpose - Get info about your operating system
function os_info(){
  write_header " System information "
  echo "Operating system : $(uname)"
  [ -x $LSB ] && $LSB -a || echo "$LSB command is not insalled (set \$LSB variable)"
  #pause "Press [Enter] key to continue..."
  pause
}

# Purpose - Get info about host such as dns, IP, and hostname
function host_info(){
  local dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
  write_header " Hostname and DNS information "
  echo "Hostname : $(hostname -s)"
  echo "DNS domain : $(hostname -d)"
  echo "Fully qualified domain name : $(hostname -f)"
  echo "Network address (IP) :  $(hostname -i)"
  echo "DNS name servers (DNS IP) : ${dnsips}"
  pause
}

# Purpose - Network inferface and routing info
function net_info(){
  devices=$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
  write_header " Network information "
  echo "Total network interfaces found : $(wc -w <<<${devices})"

  echo "*** IP Addresses Information ***"
  ip -4 address show

  echo "***********************"
  echo "*** Network routing ***"
  echo "***********************"
  netstat -nr

  echo "**************************************"
  echo "*** Interface traffic information ****"
  echo "**************************************"
  netstat -i

  pause 
}

# Purpose - Display a list of users currently logged on 
#           display a list of receltly loggged in users   
function user_info(){
  local cmd="$1"
  case "$cmd" in 
    who) write_header " Who is online "; who -H; pause ;;
    last) write_header " List of last logged in users "; last ; pause ;;
  esac 
}

# Purpose - Display used and free memory info
function mem_info(){
  write_header " Free and used memory "
  free -m
    
    echo "*********************************"
    echo "*** Virtual memory statistics ***"
    echo "*********************************"
  vmstat
    echo "***********************************"
    echo "*** Top 5 memory eating process ***"
    echo "***********************************"  
  ps auxf | sort -nr -k 4 | head -5 
  pause
}

# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
  local c
  read -p "Enter your choice [ 1 - 7 ] " c
  case $c in
    1)  os_info ;;
    2)  host_info ;;
    3)  net_info ;;
    4)  user_info "who" ;;
    5)  user_info "last" ;;
    6)  mem_info ;;
    7)  echo "Bye_bye_Please_type_./CyberLock9000.sh_to_return_to_CYBERlock9000"; exit 0 ;;
    *)  
      echo "Please select between 1 to 7 choice only."
      pause
  esac
}

# ignore CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
  clear
  show_menu # display memu
  read_input  # wait for user input
done
}
scripts+=(SystemINFO)

Install-Neofetch_sys_info_tool() {
    sudo add-apt-repository ppa:dawidd0811/neofetch && sudo apt update && sudo apt install neofetch
}
scripts+=(Install-Neofetch_sys_info_tool)

Run_Neofetch() {
    neofetch
}
scripts+=(Run_Neofetch)

OpenSSL-GnuPG_AvailableEntropy() {
    cat /proc/sys/kernel/random/entropy_avail
    echo "If below 1000 pick option 6. to install haveged then recheck OpenSSL-GnuPG Available Entropy"
}
scripts+=(OpenSSL-GnuPG_AvailableEntropy)

INSTALL_haveged() {
    sudo apt-get install haveged
}
scripts+=(INSTALL_haveged)

WHATSinTheBOX!!() {
    echo "|================================================|"
    echo "| run                                            |"
    echo "| dpkg --list                                    |"
    echo "| To list installed packages on a system         |"
    echo "|================================================|"
    echo "| run                                            |"
    echo "| dpkg --info packageName                        |"
    echo "| to..wait for it... get info on package         |"
    echo "|================================================|"
    echo "| Remove the crap that you dont use...by running |" 
    echo "| sudo apt-get remove packageName                |"
    echo "|================================================|"
    echo "| You may want to set your terminals scrollback  |"
    echo "| to over a 1000 if you have a lot of junk       |"
    echo "| installed when useing dpkg --list              |"
    echo "|================================================="

}
scripts+=(WHATSinTheBOX!!)

UID-Permissions() {
    echo " ____________________________________________________________________________________________________ "
    echo "| Make Sure No Non-Root Accounts Have UID Set To 0                                                   |"
    echo "| You should only see one line as follows:                                                           |"
    echo "| root:x:0:0:root:/root:/bin/bash                                                                    |"
    echo "| Only root account/s have UID 0 with full permissions to access the system                          |"
    echo "| If you see other lines, delete them or make sure other accounts are authorized by you to use UID 0.|"
    echo "|____________________________________________________________________________________________________|"
    sleep 5
    awk -F: '($3 == "0") {print}' /etc/passwd
}
scripts+=(UID-Permissions)

Find_Listening_Network_Ports() {
    netstat -tulpn
}
scripts+=(Find_Listening_Network_Ports)

Install-Lynis() {
    echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" > /etc/apt/sources.list.d/cisofy-lynis.list
    sudo apt-get update && sudo apt-get install lynis 
}
scripts+=(Install-Lynis)

Lynis() {
    Lynis
}
scripts+=(Lynis)

View_List_of_Ubuntu_Crash_Reports() {
    cd /var/crash && ls && cd Desktop
    echo "Change Line 266 to were ever you have CyberLock9000.sh is stored. i.e. documents or downloads ect"
}
scripts+=(View_List_of_Ubuntu_Crash_Reports)

Download-More-Ram() {
    #!/bin/bash
# A sample shell script to display a progress bar
# set counter to 0 
counter=0
(
# set infinite while loop
while :
do
cat <<EOF
XXX
$counter
Conected to CyberR0m Serverz: Copying CyberRam to LocalRAMz ( $counter%):
XXX
EOF
# increase counter by 10
(( counter+=10 ))
[ $counter -eq 100 ] && break
# delay it a specified amount of time i.e 1 sec
sleep 1
done
) |
dialog --title "Download More Ram" --gauge "Please wait" 7 70 0
sleep 1 
echo "Your.."
sleep 2 
echo "Computer..."
sleep 3 
echo "speed....."
sleep 4 
echo "has....."
sleep 5 
echo "increased......"
sleep 6 
echo "by over....... ...... ... .. ."
sleep 7 
echo "9000!!!!!!" 
}
scripts+=(Download-More-Ram)

Bash-History() {
    cat ~/.bash_history
}
scripts+=(Bash-History)

Bash-History_Last_15_Commands() {
    history | tail -n 15
}
scripts+=(Bash-History_Last_15_Commands)

Clear-Bash-History() {
    history -c && history -w
}
scripts+=(Clear-Bash-History)

Get_Average_CPU_Temperature() {
    __=`sensors | grep Core` && echo \(`echo $__ | sed 's/.*+\(.*\).C\(\s\)\+(.*/\1/g' | tr "\n" "+" | head -c-1`\)\/`echo $__ | wc -l` | bc && unset __
}
scripts+=(Get_Average_CPU_Temperature)

Random_Corporate_Bullshit_quotes() {
    curl -s http://cbsg.sourceforge.net/cgi-bin/live | grep -Eo '^<li>.*</li>' | sed s,\</\\?li\>,,g | shuf -n 1
}
scripts+=(Random_Corporate_Bullshit_quotes)

DAS_ls-THOR() {
    ls -thor
}
scripts+=(DAS_ls-THOR)
Bart_Simpson-ls() {
    ls -bart -simpson -ruls 
}
scripts+=(Bart_Simpson-ls)

LOTR-ls() {
    ls -lotr 
}
scripts+=(LOTR-ls)

Install_Snake_Game() {
    sudo apt-get install nsnake

}
scripts+=(Install_Snake_Game)

Play_Snake_Game() {
    nsnake
}
scripts+=(Play_Snake_Game)

Install_KDE_Plasma-Ubuntu() {
    sudo apt-add-repository ppa:kubuntu-ppa/next-backports && sudo apt-get update && sudo apt-get install kubuntu-plasma5-desktop plasma-workspace-wallpapers
}
scripts+=(Install_KDE_Plasma-Ubuntu)

Install_GNOME-Ubuntu() {
    sudo apt-get install gnome-shell && sudo apt-get install ubuntu-gnome-desktop
}
scripts+=(Install_GNOME-Ubuntu)

Install_MATE-UBUNTU() {
    sudo apt-add-repository ppa:ubuntu-mate-dev/ppa && sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate && sudo apt-get update && sudo apt-get upgrade && sudo apt-get install ubuntu-mate-core ubuntu-mate-desktop
}
scripts+=(Install_MATE-UBUNTU)

Install_Budgie-Ubuntu() {
    sudo add-apt-repository ppa:evolve-os/ppa && sudo apt-get update && sudo apt-get install budgie-desktop
}
scripts+=(Install_Budgie-Ubuntu)

Install_Xmonad-tiling-window-manager() {
    sudo apt-get install xmonad suckless-tools
    sleep 2
    echo "apon reboot once Xmonad is chosen Press Alt+Shift+Enter to launch a terminal."
    sleep 1
    echo "other keyboard shortcuts for Xmonad....."
    sleep 1
    echo "Alt+Shift+C – Close the focused window."
    sleep 1
    echo "Alt+. & Alt+, – Control the number of windows displayed in the master pane on the left."
    sleep 1
    echo "Alt+Enter – Move the focused window to the master pane on the left."
    sleep 1
    echo "Alt+Shift+J & Alt+Shift+K – Swap the focused window with an adjacent window."
    sleep 1
    echo "Alt+H & Alt+L – Resize the border between the master and secondary panes."
    sleep 1
    echo "Alt+Shift+Q – Log out."

}
scripts+=(Install_Xmonad-tiling-window-manager)

Install_Enlightenment_E20-Ubuntu() {
    sudo add-apt-repository ppa:enlightenment-git/ppa && sudo apt-get update && sudo apt-get install e20 terminology
}
scripts+=(Install_Enlightenment_E20-Ubuntu)

Install_paper-gtk-theme() {
    sudo add-apt-repository ppa:snwh/pulp && sudo apt-get update && sudo apt-get install paper-gtk-theme && sudo apt-get install paper-icon-theme && sudo apt-get install unity-tweak-tool && sudo apt-get install docky
 sleep 2
    echo "Open Unity tweak tool from search bar."
    echo "Under the Appearance section (third row), select Theme."
    echo "Select Paper from the list."
    echo "Now select icons tab. Select Paper from list."    
    echo "Next under cursor section select Paper from list."
}
scripts+=(Install_paper-gtk-theme)

Install_cpufreq() {
    sudo apt-get install indicator-cpufreq
    sleep 3
    echo "run indicator-cpufreq"
    sleep 2
    indicator-cpufreq
}
scripts+=(Install_cpufreq)

Install_ATOM_text_editor() {
    sudo add-apt-repository ppa:webupd8team/atom && sudo apt-get update && sudo apt install atom
}
scripts+=(Install_ATOM_text_editor)

Install_SublimeText_3() {
    sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt-get update && sudo apt-get install sublime-text-installer
}
scripts+=(Install_SublimeText_3)

Install_GhostWriter_Markdown_editor() {
    sudo add-apt-repository ppa:wereturtle/ppa && sudo apt-get update && sudo apt-get install ghostwriter
}
scripts+=(Install_GhostWriter_Markdown_editor)

Install_Shutter_screenshot_tool() {
    sudo add-apt-repository -y ppa:shutter/ppa && sudo apt-get update && sudo apt-get install shutter
}
scripts+=(Install_Shutter_screenshot_tool)

Instal_STACER_system_optimizer() {
    echo "STACER - Ubuntu System Optimizer"
    sleep 1
    echo "go grab it at...."
    sleep 1
    echo "https://github.com/oguzhaninan/Stacer/releases"
    sleep 2
    echo "It's AWESOME!!!"
}
scripts+=(Instal_STACER_system_optimizer)

Install_Ubuntu_Cleaner() {
    sudo add-apt-repository ppa:gerardpuig/ppa && sudo apt-get update && sudo apt-get install ubuntu-cleaner
}
scripts+=(Install_Ubuntu_Cleaner)

Install_BleachBit() {
    echo "Hillary Clinton's top ten all time fave Linux program!!!"
    sleep 3
    sudo apt-get install bleachbit
}
scripts+=(Install_BleachBit)

Install_TOR() {
    sudo apt-get install tor 
}
scripts+=(Install_TOR)

Install_I2P() {
    sudo apt-add-repository ppa:i2p-maintainers/i2p && sudo apt-get update && sudo apt-get install i2p
}
scripts+=(Install_I2P)

GRAB_xkcd() {
    wget `lynx --dump http://xkcd.com/|grep png`
}
scripts+=(GRAB_xkcd)

Check_32bit_or_64bit() {
    getconf LONG_BIT
}
scripts+=(Check_32bit_or_64bit)

The_Matrix_is_Real() {
    tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"
}
scripts+=(The_Matrix_is_Real)

Have_A_Peak_at_Your_RAM() {
    sudo dd if=/dev/mem | cat | strings
}
scripts+=(Have_A_Peak_at_Your_RAM)

Pi-1000() {
     echo "scale=1000; 4*a(1)" | bc -l
}
scripts+=(Pi-1000)

Pi-5000() {
     echo "scale=5000; 4*a(1)" | bc -l
}
scripts+=(Pi-5000)

Pi-10000() {
     echo "scale=10000; 4*a(1)" | bc -l
}
scripts+=(Pi-10000)

Pi-100000() {
    echo "scale=100000; 4*a(1)" | bc -l
}
scripts+=(Pi-100000)

Fibonacci-50() {
    seq 50| awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'
}
scripts+=(Fibonacci-50)

Fibonacci-200() {
    seq 200| awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'
}
scripts+=(Fibonacci-200)

Fibonacci-700() {
    seq 700| awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'
}
scripts+=(Fibonacci-700)

Fibonacci-9001() {
    seq 9001| awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'
}
scripts+=(Fibonacci-9001)



Update() {
    sudo apt-get update
}
scripts+=(Update)

Update-and-Upgrade() {
    sudo apt-get update && apt-get upgrade
}
scripts+=(Update-and-Upgrade)

Update-Upgrade-and-Reboot() {
     sudo apt-get update && apt-get upgrade -y && reboot
}
scripts+=(Update-Upgrade-and-Reboot)

About_BEEP() {
     cat << "EOF"

     Some guy named John made beep a long time ago......

     From: http://www.johnath.com/beep/ 
     I just got so tired of being limited to printf("\a"); when I wanted a terminal beep. 
     This program isn't supposed to be anything stupendous, it's just supposed to get the job done. 
     Its intended purpose in life is to live inside shell/perl scripts, and allow a little more 
     granularity than you get with the default terminal bell. Maybe I'm the only one who thinks 
     this is useful. :)

     The latest version of beep is v1.3, released July 13, 2010. [beep-1.3.tar.gz]
     The last version before 1.3 was v1.2.2, released sometime in 2002. [beep-1.2.2.tar.gz]

     I'll try to keep beep-current.tar.gz pointing to the right thing.
     There is a github repository of this code at: git://github.com/johnath/beep.git, or 
     you could browse the source, such as it is, on the web.

     I hope you find it useful. I never, never expected, when I wrote it nearly a decade 
     ago, that it would become as popular as it has, or have the enduring appeal that it seems to. 
     Thanks for your patches, your song-playing shell scripts, and your notes just to say thanks. 
     Sorry it took so long to get another release out there.

                                                                                        -- johnath

Beeps found all over the series of tubes...

 https://www.kirrus.co.uk/2010/09/linux-beep-music/

 https://www.reddit.com/r/linux/comments/18h8v5/does_anyone_have_or_know_a_source_for_beep_scripts/

 http://lime-technology.com/forum/index.php?topic=10749.20;wap2

 https://ubuntuforums.org/showthread.php?t=1157670&page=4

 and collections on github... 
EOF


}
scripts+=(About_BEEP)

AboutMe() {
    echo  Hi, Im Frank Say hi to me on Twitter.... https://keybase.io/ciphersson
}
scripts+=(AboutMe)



if [[ ! $COLUMNS || ! $LINES ]]; then
    # If select will know height and width of terminal,
    # it will be able to print prettier menus.
    COLUMNS=$(TERM=${TERM:-dumb} tput cols)
    LINES=$(TERM=${TERM:-dumb} tput lines)
fi
PS3='Select script (number): '
select script in "${scripts[@]}" quit; do
    if [[ $script == quit ]]; then
        break
    fi
    "$script"
done