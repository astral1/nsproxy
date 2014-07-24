FROM astral1/trusty
# Let's install go just like Docker (from source).
RUN apt-get update -q
RUN apt-get install -qy git
RUN curl -s https://go.googlecode.com/files/go1.2.src.tar.gz | tar -v -C /usr/local -xz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1
ENV PATH /usr/local/go/bin:$PATH
ADD . /opt/nsproxy
RUN cd /opt/nsproxy && ./build
ADD proxy-amb.sh /usr/bin/proxy-amb.sh
ENTRYPOINT ["/usr/bin/proxy-amb.sh"]
