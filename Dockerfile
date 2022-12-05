FROM frapsoft/openssl
ENTRYPOINT /bin/sh
RUN apk --update add vim
RUN apk --update add jq
ADD public.txt /public.txt
ADD script.sh /script.sh
ENTRYPOINT ["sh","-c","/script.sh"]
