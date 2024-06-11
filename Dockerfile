# FROM node:alpine as frontend
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# CMD ["npm", "run", "build"]

# FROM nginx
# EXPOSE 80
# COPY --from=frontend /app/dist /usr/share/nginx/html

FROM node:alpine as frontend
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=frontend /app/dist /usr/share/nginx/html


