# docker-image-flutter-web
Run Flutter Web SDK interactively in isolated offline environment.

*Currently beta*

Build:
```
docker build -t flutterweb .
```

Run:
```
docker run -it --net=host flutterweb
```
and connect with browser installed in host system.