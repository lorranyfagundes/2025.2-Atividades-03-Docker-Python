# Imagem base Fedora
FROM fedora:latest

# Instalar Python
RUN dnf install -y python3 python3-pip && dnf clean all

# Criar e definir o diretório de trabalho
RUN mkdir -p /app
WORKDIR /app

# Comando padrão (opcional)
CMD ["python3"]
