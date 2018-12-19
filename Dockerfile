FROM frapsoft/openssl
ENTRYPOINT /bin/sh
RUN apk --update add vim
ADD public.txt /public.txt
ADD script.sh /script.sh
