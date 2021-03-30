FROM ubuntu:18.04

ENV PATH=$PATH:/flutter/bin/

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y bash curl file git unzip xz-utils zip \
    && touch /bin/google-chrome && chmod +x /bin/google-chrome \
    && git clone https://github.com/flutter/flutter.git -b stable --depth 1 \
    && flutter --suppress-analytics config --no-analytics --enable-web --no-enable-android \
    && flutter precache --web --verbose \
    && cd /tmp; flutter create --platforms=web tmp_initiate_download_web_assets \
    && cd tmp_initiate_download_web_assets; flutter build --verbose web \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash"]
