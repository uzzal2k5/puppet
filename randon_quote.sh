#!/usr/bin/env bash
url="https://www.quotedb.com/quote/quote.php?action=random_quote"
content=$(lynx -dump $url )
echo $content | grep 'document.write' | cut -d"'" -f2,4 | awk -F"'" '{ print $1 $2 }' | sed 's/\[1]/- /g'


##!/bin/bash
#url="https://www.quotedb.com/quote/quote.php?action=random_quote"
#content=$(lynx -dump $url)
#echo $content | grep 'document.write' | cut -d"'" -f2,4 | awk -F"'" '{ print $1 $2 }' | sed 's/\[1]/-/g'
