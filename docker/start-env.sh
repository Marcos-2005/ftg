#!/bin/bash

# Colores
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🔧 Cambiando permisos de ./docker/sql...${NC}"
if chmod -R 755 ./docker/sql && chown -R 999:999 ./docker/sql; then
  echo -e "${GREEN}✅ Permisos aplicados correctamente.${NC}"
else
  echo -e "${RED}❌ Error cambiando permisos.${NC}"
  exit 1
fi

echo -e "${GREEN}🛑 Limpiando contenedores anteriores...${NC}"
docker-compose -f docker/docker-compose.yml down -v

echo -e "${GREEN}🚀 Iniciando contenedores Docker...${NC}"
if docker-compose -f docker/docker-compose.yml up -d; then
  echo -e "${GREEN}✅ Docker levantado.${NC}"
else
  echo -e "${RED}❌ Error iniciando Docker.${NC}"
  exit 1
fi

# Esperar a que MySQL esté disponible
echo -e "${GREEN}⏳ Esperando MySQL (proy_repdis)...${NC}"
TIMEOUT=30
until docker exec proy_repdis mysqladmin ping -h"localhost" -urepdis_user -prepdis_pass --silent; do
  echo -n "."
  sleep 1
  TIMEOUT=$((TIMEOUT-1))
  if [ $TIMEOUT -le 0 ]; then
    echo -e "\n${RED}❌ Timeout esperando MySQL.${NC}"
    exit 1
  fi
done

echo -e "\n${GREEN}✅ MySQL está listo.${NC}"

# Ejecutar Spring Boot
echo -e "${GREEN}🚀 Ejecutando Spring Boot desde /boot...${NC}"
cd boot
./mvnw spring-boot:run
cd ..
