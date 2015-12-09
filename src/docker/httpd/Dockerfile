FROM httpd:2.4

RUN   apt-get update \
   && apt-get install less

RUN   sed -i 's/LogFormat "%h/LogFormat "%v %h/' \
          /usr/local/apache2/conf/httpd.conf \
   && sed -i 's/^\( *\)CustomLog.*$/\1CustomLog "| \/usr\/bin\/logger -t httpd -p local6.info -n cloudwatchlogs -P 514" combined/' \
          /usr/local/apache2/conf/httpd.conf \
   && sed -i 's/^\( *\)ErrorLog.*$/\1ErrorLog "| \/usr\/bin\/logger -t httpd -p local7.info -n cloudwatchlogs -P 514"/' \
          /usr/local/apache2/conf/httpd.conf \
   && echo 'ErrorLogFormat "%v [%t] [%l] [pid %P] %F: %E: [client %a] %M"' \
          >> /usr/local/apache2/conf/httpd.conf \
   && echo '<html> <head> <title>We Rule</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Complicated Application</h1> <h2>Look!</h2> <p>CJ Is in a container!</p> </div></body></html>' \
          >  /usr/local/apache2/htdocs/index.html

EXPOSE 80
CMD ["httpd-foreground"]
