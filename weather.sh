time=`cat config.ini | sed -e 's/Timeout=//'` 

while [ true ]
do
	wget www.gismeteo.by/weather-minsk-4248/ -q 'index.html'
	grep '<dd class=' 'index.html' | grep 'value m_temp c' | head -n 1 | sed 's/[><]/ /g' | awk ' {print $5} '
	rm 'index.html'
	sleep $time
done
