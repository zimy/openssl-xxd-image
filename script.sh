#!/bin/sh
#openssl rand -hex 16 > SEED
echo a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0 > /SEED
echo 00000000000000000000000000000000000000 | xxd -r -ps | openssl dgst -mac cmac -macopt cipher:aes-128-cbc -macopt hexkey:`cat /SEED` | cut -c 10-15  > /KCV
cat /SEED | xxd -r -ps | openssl rsautl -encrypt -pubin -inkey /public.txt | xxd -ps > /RSAED
echo -e "\033[0mPlaintext:      \033[0;31m" `cat /SEED`
echo -e "\033[0mKCV (checksum): \033[0;35m" `cat /KCV`
echo -e "\033[0mRSA encrypted:  \033[0;32m" `cat /RSAED`
echo -e "\033[0m"
