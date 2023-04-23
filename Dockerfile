FROM trinodb/trino:403

USER root

RUN mkdir -p /usr/lib/trino/plugin/trino-opa-authorizer

COPY access-control.properties /etc/trino/
COPY password.db /data/trino/password.db

COPY password-authenticator.properties  /etc/trino
COPY config.properties  /etc/trino/
COPY certs/trino-coordinator.pem  /etc/trino/
COPY target/out/ /usr/lib/trino/plugin/trino-opa-authorizer/

RUN chown -R trino:trino /usr/lib/trino/plugin/trino-opa-authorizer
RUN chown -R trino:trino /etc/trino
RUN chown -R trino:trino /data/trino/password.db

USER trino
