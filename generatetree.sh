#! /bin/bash
# All credits of the regex kung-fu to @nibble_ds

recurse() {
    for i in "$1"/*;do
        if [ -d "$i" ];then
            echo "<html>
<head>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=2.0\">
    <title>[red.cow.cat] $i </title>
</head>
<body>
<pre>" > $i/index.html
            tree -h -I "index.html*" -L 1 --dirsfirst $i | sed -E 's/(.*?\] +)(.*)/\1\<a href=\"\2\"\>\2\<\/a\>/' | sed -E '1!b;s/(.*)/<a href="..">.\1<\/a>/' >> $i/index.html
            echo "</pre>
</body>
</html>" >> $i/index.html
            recurse "$i"
        fi
    done
}

read -p "This will overwrite all the \"index.html\" files. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    recurse .
fi

