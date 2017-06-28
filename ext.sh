#! /bin/bash
grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" link > temp1.txt
sed 's/^/s = URL("/' temp1.txt > temp2.txt
sed 's/$/").download(); s = plaintext(s); print s.encode("utf-8")/' temp2.txt > ext.py
sed -i '1 i\import sys' ext.py
sed -i '2 i\sys.stdout=open("test.txt","w")' ext.py
sed -i '3 i\from pattern.web import URL, plaintext' ext.py
sed -i '$asys.stdout.close()' ext.py
python ext.py
cut -d\* -f1 test.txt > etxt.txt
rm -r temp1.txt temp2.txt test.txt ext.py
