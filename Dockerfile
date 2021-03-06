# update

FROM debian:buster-slim

ENV LC_ALL="C" \
    DEBIAN_FRONTEND="noninteractive" \
    MINIMAL_APT_GET_INSTALL="apt-get install -y --no-install-recommends"

COPY ./entrypoint.sh /container/entrypoint.sh

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y slapd ldap-utils openssl krb5-kdc-ldap procps

ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

EXPOSE 389 636

ENTRYPOINT ["/container/entrypoint.sh"]
