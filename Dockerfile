FROM alpine:3.10 AS verify
RUN apk add --no-cache curl tar xz

RUN ROOTFS=$(curl -sfOJL -w "al2023-container-2023.5.20240805.0-x86_64.tar.xz" "https://amazon-linux-docker-sources.s3.amazonaws.com/al2023/2023.5.20240805.0/al2023-container-2023.5.20240805.0-x86_64.tar.xz") \
  && echo 'a0f5a0a7f773714d3d891304ca282a44084d1b47531e8adc3017754d915b1243  al2023-container-2023.5.20240805.0-x86_64.tar.xz' >> /tmp/al2023-container-2023.5.20240805.0-x86_64.tar.xz.sha256 \
  && cat /tmp/al2023-container-2023.5.20240805.0-x86_64.tar.xz.sha256 \
  && sha256sum -c /tmp/al2023-container-2023.5.20240805.0-x86_64.tar.xz.sha256 \
  && mkdir /rootfs \
  && tar -C /rootfs --extract --file "${ROOTFS}"

FROM scratch AS root
COPY --from=verify /rootfs/ /


# Add sample application
ADD server.py /tmp/application.py

CMD ["/bin/bash"]

