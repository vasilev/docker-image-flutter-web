# Flutter Web dockerized
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
invoke `flutter run -d web-server` inside your project's folder,
and connect with browser installed in host system.
