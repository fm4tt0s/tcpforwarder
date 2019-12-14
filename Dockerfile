FROM scratch
LABEL version="0.1"
LABEL author="felipe mattos"
COPY tcpforward /
ENTRYPOINT ["/tcpforward"]
