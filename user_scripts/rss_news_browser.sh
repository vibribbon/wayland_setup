#!/bin/bash


# Clear old files
rm ${HOME}/.cache/rss_reader/*

# Download the rss files from their respective websites
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /02_bbc.xml --allow-overwrite=true https://feeds.bbci.co.uk/news/uk/rss.xml
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /05_verge.xml --allow-overwrite=true https://www.theverge.com/rss/index.xml
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /04_gol.xml --allow-overwrite=true https://www.gamingonlinux.com/article_rss.php
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /06_ns.xml --allow-overwrite=true https://www.newscientist.com/section/news/feed/
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /03_polygon.php --allow-overwrite=true https://www.polygon.com/rss/index.xml
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /01_met.atom --allow-overwrite=true https://www.metoffice.gov.uk/public/data/PWSCache/WarningsRSS/Region/wm
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /07_scmp.xml --allow-overwrite=true https://www.scmp.com/rss/91/feed
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /08_df.xml --allow-overwrite=true https://daringfireball.net/feeds/json
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /09_schneier.atom --allow-overwrite=true https://schneier.com/blog/index.rdf
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /10_mcvuk.xml --allow-overwrite=true https://feeds2.feedburner.com/mcvuk/oXMK
aria2c -D --dir=${HOME}/.cache/rss_reader/ -o /11_ifoss.xml --allow-overwrite=true https://feeds2.feedburner.com/itsfoss
sleep 1


# Pre process the xml files, insert new lines before <title> / <link> etc to prevent a 1 line xml files being rejected.
find ${HOME}/.cache/rss_reader/ -print0 -name "*.xml" -o -name "*.atom" -o -name "*.php"| sort -z | while read -d $'\0' filen; do
	# split the directory path / filename / filename prefix.
	f_path=${filen%/*}
	fn=${filen##*/}
	fn_pref=${fn%.*}

	# copy the file into a new file adding an e on the end of the name, and add newlines before / after <title> and <link>
	cat $filen | sed 's/<title>/\
	<title>/g' | sed 's/<\/title>/<\/title>\
	/g' | sed 's/<link>/\
	<link>/g' | sed 's/<\/link>/<\/link>\
	/g' > $f_path"/"$fn_pref"e.xml"
	rm "$filen"	# Remove the downloaded version
done
rm ${HOME}/.cache/rss_reader/e.xml	# slight bug remove the extra file


# Prep the html file headings and set colours
echo '-- RSS NEWS --' > ${HOME}/.cache/rss_reader/rssnews.html
echo '<meta name="color-scheme" content="dark light">' >> ${HOME}/.cache/rss_reader/rssnews.html
echo '<style> a {color: #f2f2f2;}</style>' >> ${HOME}/.cache/rss_reader/rssnews.html

# Loop through each file and process the <title> and <link> tags, and strip the xml.
find ${HOME}/.cache/rss_reader/ -print0 -name "*.xml" -o -name "*.atom" -o -name "*.php"| sort -z | while read -d $'\0' file; do
line_count=0
	while read -r line; do
		# xml compatability
		if [[ $line =~ '<title' ]]; then
			v_title=$(echo "$line" | sed 's/<title[^<]*>//' | sed 's/<!\[CDATA\[//g' | sed 's/<\/title>.*$//' | sed 's/\]\]>//g')
		elif [[ $line =~ '<link>' ]]; then
			v_link=$(echo "$line" | sed 's/<link>//g' | sed 's/<\/link>//g')
			echo "<a href=$v_link>$v_title</a><br>" >> ${HOME}/.cache/rss_reader/rssnews.html
			((line_count++))
		elif [[ $line =~ '<id>' ]]; then
			v_link=$(echo "$line" | sed 's/<id>//g' | sed 's/<\/id>//g')
			echo "<a href=$v_link>$v_title</a><br>" >> ${HOME}/.cache/rss_reader/rssnews.html
			((line_count++))
		fi

		# json compatability
		if [[ $line =~ '"title" : "' ]]; then
			v_title=$(echo "$line" | sed 's/"title" : "//' | sed 's/",.*$//')
		elif [[ $line =~ '"url" : "' ]]; then
			v_link=$(echo "$line" | sed 's/"url" : "//g' | sed 's/",.*$//g')
			echo "<a href=$v_link>$v_title</a><br>" >> ${HOME}/.cache/rss_reader/rssnews.html
			((line_count++))
		fi

		# counter to limit the numbers of articles included (24 as default)
		if [[ $line_count -gt 24 ]]; then
			break
		fi
	done <$file
echo "<br><hr><br>" >> ${HOME}/.cache/rss_reader/rssnews.html	# divide the sources
done

x-www-browser ${HOME}/.cache/rss_reader/rssnews.html &

