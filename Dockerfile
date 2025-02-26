FROM node:16-alpine as base
WORKDIR /orion
COPY . .
RUN apk --no-cache add \
    python3 \
    make \
    g++ \
    gcc \
    && yarn

FROM base as prod
RUN yarn build
EXPOSE 3000
CMD [ "sh", "start.sh" ]
