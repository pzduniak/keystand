FROM golang:1.12.4-stretch AS build
RUN apt-get update && apt-get install -y git
RUN mkdir -p $GOPATH/src/github.com/keybase && \
	git clone https://github.com/keybase/client.git $GOPATH/src/github.com/keybase/client && \
	cd $GOPATH/src/github.com/keybase/client && \
	git checkout c61be13a22110f5d2a96f2d4211c6134aa2296e9 && \
	go install -v github.com/keybase/client/go/keybase

FROM ubuntu:18.04

RUN useradd -ms /bin/bash keybase
RUN apt-get update && \
	apt-get install -y sudo && \
	rm -rf /var/lib/apt/lists/*
VOLUME [ "/home/keybase/.config/keybase", "/home/keybase/.local/share/keybase" ]

COPY --from=build /go/bin/keybase /usr/bin/keybase
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
CMD [ "service" ]
