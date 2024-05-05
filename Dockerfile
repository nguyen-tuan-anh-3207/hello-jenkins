# Sử dụng image node ổn định nhất
FROM node:20-alpine

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Copy các file cần thiết vào thư mục làm việc
COPY package.json .

# Cài đặt các dependencies
RUN npm install

# Copy toàn bộ mã nguồn của ứng dụng vào container
COPY . .

# Build ứng dụng
RUN npm run build

# Mở cổng 3000 để ứng dụng có thể được truy cập từ bên ngoài
EXPOSE 3000

# Khởi chạy ứng dụng khi container được khởi động
CMD ["npm", "start"]

# # Sử dụng image chứa Node.js để xây dựng ứng dụng Next.js
# FROM node:alpine AS builder

# # Thiết lập thư mục làm việc
# WORKDIR /app

# # Sao chép file package.json và yarn.lock vào thư mục làm việc
# COPY package.json ./

# # Cài đặt dependencies
# RUN npm install

# # Sao chép mã nguồn của ứng dụng vào thư mục làm việc
# COPY . .

# # Xây dựng ứng dụng Next.js
# RUN npm run build

# # Sử dụng image nginx
# FROM nginx:alpine

# # Sao chép tệp cấu hình của nginx
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Sao chép tệp được xây dựng từ builder stage (ứng dụng Next.js) vào thư mục chứa của nginx
# COPY --from=builder /app/out /usr/share/nginx/html

