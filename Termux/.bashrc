PS1='\e[38;5;27m╭\e[48;5;197m 🐹\e[48;5;63;38;5;197m\e[48;5;63;38;5;232myuan@Termux\e[48;5;112;38;5;63m\e[48;5;112;38;5;232m\w\e[48;5;244;38;5;112m\e[00m\e[38;5;244m\
\
`if [ $? -eq 0 ]; then
	echo "\e[38;2;0;255;0m ✓"
else
	echo "\e[38;2;255;0;0m ✘"
fi`\
\
\r\e[$(($COLUMNS-9))C\e[38;2;95;95;255m* \e[38;5;25m\e[48;5;25;38;5;27m\e[48;5;27;38;5;253m\A\e[0m\n\[\e[38;5;27m\]╰>\[\e[38;5;198m\]>\[\e[38;5;214m\]>\[\e[00m\]'