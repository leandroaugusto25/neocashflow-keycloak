# Imagem base do Keycloak
FROM quay.io/keycloak/keycloak:22.0.0 as builder

# Configurações de suporte à saúde e métricas
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configurar um banco de dados externo
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://hopper.proxy.rlwy.net:41793/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=yaAtKBhDBvCDynaKraZgkHByksRHxKRy

# Configurações de hostname e proxy
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=true
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# Porta dinâmica no Heroku
ENV KC_HTTP_PORT=8080

# Credenciais administrativas do Keycloak
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

WORKDIR /opt/keycloak

COPY themes/neocashflow /opt/keycloak/themes/neocashflow

# Build do Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expor porta
EXPOSE 8080

# Comando de inicialização
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--http-port=8080"]
