FROM alpine:3.4

EXPOSE 8080

RUN apk add --update go git \
  ## Next line add other packages you want in your gotty instance.
  zsh curl && \
  mkdir -p /tmp/gotty && \
  GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
  mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
  # apk del go git && \
  rm -rf /tmp/gotty /var/cache/apk/* && \
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/zsh"]
