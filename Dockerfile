FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
WORKDIR /app

# Menyalin file package.json dan package-lock.json
COPY package*.json ./

# Menginstall dependencies
RUN npm install

# Menyalin semua file dari direktori lokal ke container
COPY . .

# Menjalankan build aplikasi
RUN npm run build

# Menentukan port yang digunakan
EXPOSE 80

# Menjalankan aplikasi
CMD ["node", ".output/server/index.mjs"]

