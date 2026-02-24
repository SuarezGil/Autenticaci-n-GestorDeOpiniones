Esto va en el  .env
# Server
NODE_ENV=development
PORT=3005

# Database PostgreSQL
DB_HOST=localhost
DB_PORT=5436
DB_NAME=InicioSesionDB
DB_USERNAME=root
DB_PASSWORD=admin
DB_SQL_LOGGING=false

# JWT Configuration
JWT_SECRET=MyVerySecretKeyForJWTTokenAuthenticationWith256Bits!
JWT_EXPIRES_IN=30m
JWT_REFRESH_EXPIRES_IN=7d
JWT_ISSUER=AuthService
JWT_AUDIENCE=AuthService

# SMTP Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_ENABLE_SSL=false
SMTP_USERNAME=iossg8@gmail.com
SMTP_PASSWORD=nybg zlgc vllv leiw
EMAIL_FROM=iossg8@gmail.com
EMAIL_FROM_NAME=AuthDotnet App

# Cloudinary (upload de perfiles)
CLOUDINARY_CLOUD_NAME=dxwodvknq
CLOUDINARY_API_KEY=315137646775675
CLOUDINARY_API_SECRET=5_UHfg54EkMdNq8z030tYdrJtVY
CLOUDINARY_BASE_URL=https://res.cloudinary.com/dxwodvknq/image/upload/
CLOUDINARY_FOLDER=auth_service/profiles
CLOUDINARY_DEFAULT_AVATAR_FILENAME=default-avatar_ewzxwx.png

# File Upload
UPLOAD_PATH=./uploads

# Frontend URL
FRONTEND_URL=http://localhost:5173

# Security
ALLOWED_ORIGINS=http://localhost:5173,http://localhost:3000
ADMIN_ALLOWED_ORIGINS=http://localhost:5173

# Verification Tokens (en horas)
VERIFICATION_EMAIL_EXPIRY_HOURS=24
PASSWORD_RESET_EXPIRY_HOURS=1







Esto va en el docker-compose.yml
services:
  db:
    image: postgres:15
    environment:
      - POSTGRES_USER=root
      - POSTGRES_PASSWORD=admin
      - POSTGRES_DB=InicioSesionDB
    ports:
      - "5436:5432"
    volumes:
      - db_data:/var/lib/postgresql/data

  app:
    build: .
    command: node index.js
    ports:
      - "3129:3005"
    environment:
      - NODE_ENV=development
      - PORT=3005
      - DB_HOST=db
      - DB_PORT=5432
      - DB_NAME=InicioSesionDB
      - DB_USERNAME=root
      - DB_PASSWORD=admin
    depends_on:
      - db
    volumes:
      - .:/usr/src/app
      - /usr/src/app/node_modules

volumes:
  db_data:
