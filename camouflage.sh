#!/bin/bash
if [[ -f "public/meow.html" ]]; then
	mv "public/meow.html" "public/meow.html.bak"
	mv "public/index.html" "public/meow.html"
	mv "public/meow.html.bak" "public/index.html"
	wget -O "public/assets/audio/world-execute-me-compressed.mp3" "https://world-execute-me.imzi.us.kg/assets/audio/world-execute-me-compressed.mp3"
fi
