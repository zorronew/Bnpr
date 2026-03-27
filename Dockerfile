FROM php:8.2-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilitar mod_rewrite
RUN a2enmod rewrite

# 🔥 CONFIGURAR PUERTO DINÁMICO DE RAILWAY
ENV PORT=8080

# 🔥 FORZAR APACHE A ESCUCHAR EN 8080
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

# Copiar archivos
COPY . /var/www/html/

# Permisos
RUN chown -R www-data:www-data /var/www/html

# Exponer puerto
EXPOSE 8080

# 🔥 FORZAR ARRANQUE DE APACHE
CMD ["apache2-foreground"]
