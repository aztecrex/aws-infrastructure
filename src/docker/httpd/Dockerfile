FROM httpd:2.4

RUN echo '<html> <head> <title>We Rule</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Complicated Application</h1> <h2>Look!</h2> <p>CJ Is in a container!</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html

EXPOSE 80
CMD ["httpd-foreground"]
