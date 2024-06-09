# Install postgis extension
FROM alpine:3.16.2 AS check_postgis
ARG DATABASE_URL
RUN apk add --no-cache postgresql13-client
RUN psql -d ${DATABASE_URL}

# Set up pg_tileserv
FROM pramsey/pg_tileserv
ARG DATABASE_URL
COPY --from=check_postgis . .
