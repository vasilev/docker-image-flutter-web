FROM ubuntu:22.04

ENV PATH=$PATH:/flutter/bin/

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y bash curl file git libglu1-mesa unzip xz-utils zip \
    && touch /bin/google-chrome && chmod +x /bin/google-chrome \
    && git clone https://github.com/flutter/flutter.git -b stable --depth 1 \
    && flutter --suppress-analytics config --no-analytics --enable-web --no-enable-android --no-enable-linux-desktop \
    && flutter precache --web --verbose \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash"]
