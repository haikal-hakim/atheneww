#!/bin/bash
cmd="firefox --new-tab"

case "$1" in
--gh) $cmd "https://github.com" ;;
--ig) $cmd "https://instagram.com" ;;
--wa) $cmd "https://whatsapp.com/" ;;
--inc) firefox --private-window ;;
--mail) $cmd "https://mail.google.com" ;;
esac
