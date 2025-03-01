frontend main
    bind *:80
    bind *:443 ssl crt /etc/ssl/haproxy/haproxy.pem
    
    # Redirection HTTP -> HTTPS
    redirect scheme https code 301 if !{ ssl_fc }
    
    # head security
    http-response set-header Strict-Transport-Security "max-age=16000000; includeSubDomains; preload;"
    http-response set-header X-Frame-Options