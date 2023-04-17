#!/bin/sh

# React
if [ ! -d ./frontend ]; then
	echo "There's no React! Download Now...🚀"
	# React(frontend) 설치
	git clone https://github.com/OverRaddit/React_frontend frontend
	echo "Download complete ✅"
else
	echo "You already installed React App in your folder! ✅"
fi

# Nest
if [ ! -d ./backend ]; then
	echo "There's no Nest! Download Now...🚀"
	# React(frontend) 설치
	git clone https://github.com/codewhite7777/ft_transcendence backend
	echo "Download complete ✅"
else
	echo "You already installed Nest in your folder! ✅"
fi
