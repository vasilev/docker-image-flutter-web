FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y bash curl file git unzip xz-utils zip \
    && touch /bin/google-chrome && chmod +x /bin/google-chrome \
    && git clone https://github.com/flutter/flutter.git -b beta --depth 1 \
    && export PATH=$PATH:/flutter/bin/ \
    && flutter --suppress-analytics config --no-analytics --enable-web \
    && cd /tmp; flutter create tmp_initiate_download_web_sdk \
    && cd tmp_initiate_download_web_sdk; flutter build web \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

ENTRYPOINT ["/bin/bash"]
