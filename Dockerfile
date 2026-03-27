FROM php:8.2-cli

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Directorio de trabajo
WORKDIR /app

# Copiar proyecto
COPY . .

# Exponer puerto dinámico de Railway
EXPOSE 8080

# 🔥 SERVIDOR PHP NATIVO (CLAVE)
CMD php -S 0.0.0.0:8080
