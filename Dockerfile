FROM jrottenberg/ffmpeg:4.4-alpine
ARG TARGETPLATFORM

# Extras
RUN apk add --no-cache curl wget unzip bash

# Timezone (TZ)
#RUN apt update && apt install tzdata -y
ENV TZ=Europe/Berlin
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Volumes
VOLUME /config
VOLUME /root/.xteve
VOLUME /tmp/xteve

# Add xTeve
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=amd64; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=arm64; fi; \
    wget "https://github.com/xteve-project/xTeVe-Downloads/raw/master/xteve_linux_$ARCHITECTURE.zip" -O temp.zip; unzip temp.zip -d /usr/bin/; rm temp.zip
ADD entrypoint.sh /

# Set executable permissions
RUN chmod +x /entrypoint.sh
#RUN chmod +x /cronjob.sh
RUN chmod +x /usr/bin/xteve

# Expose Port
EXPOSE 34400

# Entrypoint
ENTRYPOINT ["bash", "/entrypoint.sh"]
