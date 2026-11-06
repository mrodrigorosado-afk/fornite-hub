FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production PORT=3000
COPY --from=build /app/dist ./dist
COPY server ./server
COPY package.json ./
EXPOSE 3000
CMD ["node", "server/index.js"]
