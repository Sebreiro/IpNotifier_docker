IpNotifier_docker
==
[Docker image](https://hub.docker.com/r/sebreiro/ip_notifier) of [IpNotifier](https://github.com/Sebreiro/IpNotifier)

### **Note **
Application has no environment variables, all settings are located in the config file `appsettings.json`  
Information about confg files could be found in [IpNotifier repository](https://github.com/Sebreiro/IpNotifier#config)

When container starts, it's copy default config (if not exists) to `/app/Config`

# docker-compose
```yml
ipnotifier:
    image: sebreiro/ip_notifier:1.0
    container_name: ip_notifier
    restart: unless-stopped
    volumes:
      - /home/apps/ipnotifier/Config:/app/Config
```

