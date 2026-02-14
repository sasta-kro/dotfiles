#!/bin/bash

# Defining Colors using tput (Command Substitution)
# using raw colour notation such as `\e[31m` works but it might not work for all terminals.
# thus it is encouraged to use `tput setaf <number>`. 'setaf' = Set ANSI Foreground
# `setaf` asks the terminal what a specific colour code is for this terminal. 
# That's why `setaf` is more portable than raw colour code. 

# `tput` = terminal put (terminal interaction)

# ANSI color codes
# Blue corresponds to setaf 4.
BLUE=$(tput setaf 4)

# White corresponds to setaf 7 in the standard ANSI palette.
WHITE=$(tput setaf 7)

# sgr0 resets all attributes (colors, bold, etc.) to the terminal default. 
# (or else the terminal might be coloured even after the program ends)
RESET=$(tput sgr0)

# clear # clear here to just in case



# Array of frames containing the ASCII art of Fedora logo.
# The variable expansion requires quotes to preserve newlines and spacing.
frames=(
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;      ;        ;cccccccccccc:
cccccc;        ;        ;cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;      ;    ${WHITE}.0k.${BLUE};cccccccccccc:
cccccc;        ;    ${WHITE}.dc.${BLUE};cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;      ;  ${WHITE}.000k.${BLUE};cccccccccccc:
cccccc;        ;  ${WHITE}.kddc.${BLUE};cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;      ;${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;        ;${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;   ${WHITE}.Oo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;     ${WHITE}.d:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}.xOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;   ${WHITE}.xdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;    ;cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;  ${WHITE}''${BLUE};cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;   ;ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;     ccc     ;ccccccccccccccc;
cccccc;           ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MN'${BLUE} ccc     ;ccccccccccccccc;
cccccc;${WHITE}d'${BLUE}         ;cccccccccccccc:,
cccccccc;       ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc     ;ccccccccccccccc;
cccccc;${WHITE}dNM${BLUE}        ;cccccccccccccc:,
cccccccc;${WHITE}'${BLUE}      ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc     ;ccccccccccccccc;
cccccc;${WHITE}dNMWX.${BLUE}     ;cccccccccccccc:,
cccccccc;${WHITE}.:o${BLUE}    ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc     ;ccccccccccccccc;
cccccc;${WHITE}dNMWXX.${BLUE}    ;cccccccccccccc:,
cccccccc;${WHITE}.:odl${BLUE}  ;cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc     ;ccccccccccccccc;
cccccc;${WHITE}dNMWXXXW.${BLUE}  ;cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;    ;ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.x.${BLUE}  ;ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;    ;cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc${WHITE};MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;    ;cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;    ;cc;    ;ccccccc:.
,cccccccccccccc;    ;cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;        ;ccccccc;.
 .:ccccccccccccc;          ;ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;    ;ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;${WHITE}..${BLUE}      ;ccccccc;.
 .:ccccccccccccc;${WHITE}OWM.${BLUE}      ;ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;    ;ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;${WHITE}.:dd.${BLUE}   ;ccccccc;.
 .:ccccccccccccc;${WHITE}OWMKO${BLUE}     ;ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;    ;ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;${WHITE}.:dddl'${BLUE} ;ccccccc;.
 .:ccccccccccccc;${WHITE}OWMKOOX${BLUE}   ;ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;    ;ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;${WHITE}.:dddl:.${BLUE};ccccccc;.
 .:ccccccccccccc;${WHITE}OWMKOOXMWd${BLUE};ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;${WHITE}'${BLUE}   ;ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;    ;cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
"${BLUE}             .',;::::;,'.
         .';:cccccccccccc:;,.
      .;cccccccccccccccccccccc;.
    .:cccccccccccccccccccccccccc:.
  .;ccccccccccccc;${WHITE}.:dddl:.${BLUE};ccccccc;.
 .:ccccccccccccc;${WHITE}OWMKOOXMWd${BLUE};ccccccc:.
.:ccccccccccccc;${WHITE}KMc.${BLUE};cc;${WHITE}xMMc${BLUE};ccccccc:.
,cccccccccccccc;${WHITE}MMM.${BLUE};cc;${WHITE};WW:${BLUE};cccccccc,
:cccccccccccccc;${WHITE}MMM.${BLUE};cccccccccccccccc:
:ccccccc;${WHITE}oxOOOo${BLUE};${WHITE}MMM000k.${BLUE};cccccccccccc:
cccccc;${WHITE}0MMKxdd:${BLUE};${WHITE}MMMkddc.${BLUE};cccccccccccc;
ccccc;${WHITE}XMO'${BLUE};cccc;${WHITE}MMM.${BLUE};cccccccccccccccc'
ccccc;${WHITE}MMo${BLUE};ccccc;${WHITE}MMW.${BLUE};ccccccccccccccc;
ccccc;${WHITE}0MNc.${BLUE}ccc${WHITE}.xMMd${BLUE};ccccccccccccccc;
cccccc;${WHITE}dNMWXXXWM0:${BLUE};cccccccccccccc:,
cccccccc;${WHITE}.:odl:.${BLUE};cccccccccccccc:,.
ccccccccccccccccccccccccccccc:'.
:ccccccccccccccccccccccc:;,..
 ':cccccccccccccccc::;,.${RESET}"
)

# to print when the animation ends
# Since Mac's Bash doesn't understand [-1] array access notation, it has to be implemented manually
# This calculate the index of the last frame (Total count - 1)
last_index=$((${#frames[@]} - 1))
final_frame="${frames[last_index]}"
# final_frame="${frames[-1]}" # modern bash


# Clearing the screen (pervious texts in the terminal) provides a blank canvas for the animation
clear

# `civis` (Cursor Invisible) hides the block/line cursor to prevent flickering.
# will be reverted with `cnorm` when the script ends
tput civis 

# `sc`` (Save Cursor) marks the current position (0,0 after clear) as the anchor point.
tput sc

# Terminal input buffer is gonna be changed to process input immediately later with `stty`
# `stty` = set tty (teletypewriter/terminal) which controls terminal driver settings.
# `stty` -g prints the current terminal settings in a form suitable for reloading (a single string).
# Save current settings so it can restored later
old_stty=$(stty -g)

# Disable 'Canonical Mode' (buffering) and Echo
# -icanon : Send input immediately (don't wait for Enter)
# time 0 min 0 : Make 'read' non-blocking (don't pause the script)
# -echo : Don't show typed characters on screen
stty -icanon time 0 min 0 -echo


# Trap executes cleanup commands when SIGINT (Ctrl+C) or TERM signals occur.
# 'tput cnorm' restores the cursor visibility before exiting.
# `stty sane` = not a acronym, just a name of command to restore terminal to a 'sane' state
trap 'tput cnorm; stty sane; echo; exit' INT TERM

# the infinite loop
while true; do
    # Cycles through the frames array.
    for frame in "${frames[@]}"; do
        
        # rc (Restore Cursor) moves the cursor back to the saved anchor point (top-left).
        # This ensures the new frame overwrites the old frame exactly.
        tput rc

        # Prints the frame and fastfetch info. Newlines inside the string move the cursor down naturally.
        # no need for `-e` since there are no escape characters.
        # pipes frame into fastfetch and fastfetch handles the layout. 
        echo -n "$frame" | fastfetch --file-raw -
        # fastfetch config ("-c ~/.config/fastfetch/config.jsonc") if exists
        # `--file-raw -`` tells fastfetch to read the logo from this program's pipe
        # `-` is for linux standard input (stdin) it grabs whatever the pipe sends

        sleep 0.05

        # Because of the 'stty' above, standard 'read' becomes non-blocking
        # It grabs a key if present, or moves on immediately if not
        read key # doesn't have any delay or timeout
        
        # check if key exists (not empty), if 'key' is NOT empty (meaning something is typed)
        if [[ -n "$key" ]]; then
            break 2  # Break 'for' loop AND 'while' loop (2 levels)
            # if just break then it will only break the inner loop and not the outer one
        fi
    done
done

# Cleanup after animation ends

# Restore original terminal settings
stty "$old_stty"

# forces the final finished frame so it looks complete
tput rc
echo "$final_frame" | fastfetch --file-raw -

# move cursor below the animation
echo ""

# restores the cursor visibility 
tput cnorm


# print the typed key to stop the program (optional)
# echo "Stopped. Pressed: $key"
