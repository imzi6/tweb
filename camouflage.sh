#!/bin/bash
if [[ -f "public/zh/meow.html" ]]; then
	mv "public/index.html" "public/meow.html"
	mv "public/zh/meow.html" "public/index.html"
	wget -O "public/assets/audio/world-execute-me-compressed.mp3" "https://world-execute-me.imzi.us.kg/assets/audio/world-execute-me-compressed.mp3"
fi

if [[ -f "public/zh/index.html" ]]; then
	if [[ ! -f "public/assets/audio/world-execute-me-compressed.mp3" ]]; then
		wget -O "public/assets/audio/world-execute-me-compressed.mp3" "https://world-execute-me.imzi.us.kg/assets/audio/world-execute-me-compressed.mp3"
	fi
fi
