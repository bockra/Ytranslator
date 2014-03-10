#!/bin/bash
#
# simple example of comandline translator using Yandex Translate API
#

if [ $# -le 1 ];
then
        echo -e '---- ytranslator cmd ----
Using: Translate.sh [to lang] [frase or word]
Example: Translate.sh fr apple (translate word to French lang)
Example: Translate.sh en 'bonjour monsieur' (translate pharase to english)'
fi


to=$1
text=$2

link='https://translate.yandex.net/api/v1.5/tr.json/translate?key='
key='get your API key at http://api.yandex.com/key/form.xml?service=trnsl'
wget -q -O - "$link$key&lang=$to&text=$text" | awk -F'"' {' print $10 '}
