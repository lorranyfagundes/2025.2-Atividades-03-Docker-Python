## 📝 Relatório de Lorrany Fagundes Campos da Silva sobre a Atividade 03 - Docker com Python - Sistemas Operacionais - 2025.2

## 6.1 Introdução ao Docker e Python

O foco desta atividade foi **praticar a criação e o gerenciamento de *containers* Docker** para aplicações Python, utilizando o Docker como ferramenta de isolamento de ambientes de execução. Essa abordagem garante que o aplicativo funcione de maneira idêntica, independentemente do sistema onde será executado, promovendo consistência entre o desenvolvimento e a produção.

Esta experiência prática com Docker e Python foi fundamental para consolidar os seguintes conceitos:

  * **Containers Docker**: Ambientes leves e isolados que empacotam o código e todas as suas dependências.
  * **Dockerfile**: O *blueprint* que instrui o Docker sobre como construir a imagem do *container*.
  * **Compartilhamento de Volumes (*Volume Mapping*)**: Um mecanismo essencial que sincroniza arquivos entre o sistema *host* (seu computador/Codespace) e o interior do *container*, permitindo desenvolvimento em tempo real.

-----

## 6.2 Detalhamento das Etapas Executadas

### Parte 1: Configuração Inicial

  * Iniciei com o ***fork*** do repositório base da atividade no GitHub.
  * Em seguida, realizei a clonagem do repositório bifurcado para o ambiente de desenvolvimento (Codespace):



```bash
git clone https://github.com/lorranyfagundes/2025.2-Atividades-03-Docker-Python.git
cd 2025.2-Atividades-03-Docker-Python
```

### Parte 2: Implementação dos Scripts Python

  * Desenvolvi o script **`alomundo.py`** (programa simples de boas-vindas):


```python
print("Alô, Mundo!")
print("Bem-vindo ao container Docker com Python!")
print("Sistemas Operacionais - 2025.2")
```

  * Criei o script **`calculadora.py`** para simular uma aplicação mais complexa, focada em operações básicas:



```python
def somar(a, b):
    return a + b

def subtrair(a, b):
    return a - b

def multiplicar(a, b):
    return a * b

def dividir(a, b):
    if b != 0:
        return a / b
    else:
        return "Erro: Divisão por zero!"

print("=== Calculadora Simples ===")
print(f"10 + 5 = {somar(10, 5)}")
print(f"10 - 5 = {subtrair(10, 5)}")
print(f"10 * 5 = {multiplicar(10, 5)}")
print(f"10 / 5 = {dividir(10, 5)}")

```

### Parte 3: Definição da Imagem com o Dockerfile

  * O arquivo **`Dockerfile`** foi criado para usar a distribuição Fedora como base e instalar o Python:



```dockerfile
FROM fedora:latest
RUN dnf install -y python3 python3-pip && dnf clean all
RUN mkdir -p /app
WORKDIR /app
CMD ["python3"]
```

### Parte 4: Construção, Teste e Execução

  * Construção da imagem local com a *tag* específica:



```bash
docker build -t minha-python-app-fedora .
```

  * Confirmação da criação da imagem (**Mudei o nome da tag**):



```bash
docker images | grep minha-python-app-fedora
```

  * Execução dos scripts, utilizando o mapeamento de volume para acessar os arquivos do *host*:



```bash
docker run --rm -v $(pwd):/app minha-python-app-fedora python3 /app/alomundo.py
docker run --rm -v $(pwd):/app minha-python-app-fedora python3 /app/calculadora.py
```

  * O teste final de **mapeamento de volumes** foi realizado ao modificar o texto do `alomundo.py` e reexecutá-lo, confirmando a sincronização em tempo real.

### Parte 5: Registro das Mudanças (Versionamento)

  * Finalizei o processo adicionando os arquivos, realizando o *commit* e enviando as alterações para o repositório remoto:


```bash
git add Dockerfile alomundo.py calculadora.py
git commit -m "Implementação do Dockerfile e dos scripts Python"
git push origin main
```

-----

## 6.3 Conclusões da Atividade

  * **Principais Desafios Encontrados:**
      * A etapa de **configurar o ambiente e o *volume mapping*** no Codespace exigiu atenção extra para garantir o correto compartilhamento de arquivos.
      * Houve a necessidade de lidar com algumas mensagens de **advertência do `dnf`** durante a instalação de pacotes no Fedora, mas que não comprometeram a funcionalidade do *container*.
  * **Conhecimento Adquirido:**
      * Aprofundei meu entendimento sobre a **portabilidade** que o Docker oferece, isolando o ambiente de execução.
      * Aprendi a diferença prática entre os comandos do Dockerfile (como `RUN` e `CMD`) e como eles moldam a **estrutura da imagem**.
      * Gostei especialmente de ver o **mapeamento de volumes** em ação, facilitando o ciclo de desenvolvimento/teste de *scripts* em Python.

-----

**Sumário:**
Esta atividade prática foi um passo importante para a compreensão de como o Docker pode ser integrado a projetos Python para criar ambientes de desenvolvimento e produção robustos e consistentes, reforçando minhas habilidades em gerenciamento de sistemas isolados.

<br>
