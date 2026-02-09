#!/bin/sh
#findig a file exists not

read -p "enter filename:" file_name

if [ -f "$file_name" ]; then
        echo "file has been found,and filename is:"$file_name
        echo "print the contents of the file:" 
	cat "$file_name"
else
        echo "file not found creating a file"
        touch "$file_name"
        echo "file has been created and it's name is:"$file_name
fi



