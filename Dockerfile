# 1️⃣ Base image (Node.js runtime)
FROM node:20-alpine

# 2️⃣ Set working directory inside container
WORKDIR /app

# 3️⃣ Copy package files first (for caching)
COPY package*.json ./

# 4️⃣ Install only production dependencies
RUN npm install --production

# 5️⃣ Copy compiled JS and static files
COPY dist ./dist
COPY public ./public

# 6️⃣ Cloud Run uses port 8080
ENV PORT=8080
EXPOSE 8080

# 7️⃣ Start the app
CMD ["node", "dist/index.js"]
