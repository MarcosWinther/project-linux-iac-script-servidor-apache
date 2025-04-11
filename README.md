# 🚀 Desafio de Projeto DIO: Infraestrutura como Código - Provisionamento Apache 📜

![Apache Logo](https://img.shields.io/badge/Apache-2.4-red.svg?style=for-the-badge&logo=apache) ![Shell Script](https://img.shields.io/badge/Shell_Script-Bash-blue.svg?style=for-the-badge&logo=gnu-bash) ![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=for-the-badge&logo=ubuntu) ![VirtualBox](https://img.shields.io/badge/VirtualBox-Oracle-orange.svg?style=for-the-badge&logo=virtualbox)

<br>


## 📝 Sobre o Projeto

Este repositório contém a solução para o desafio de projeto "Infraestrutura como Código - Script de Provisionamento de um Servidor Web (Apache)", proposto pelo professor **[Denilson Bonatti](https://www.linkedin.com/in/denilsonbonatti/)** durante o **Bootcamp Santander ([Santander Open Academy](https://www.linkedin.com/company/santander-open-academy/posts/?feedView=all)) - Linux para Iniciantes** na plataforma da **[DIO (Digital Innovation One)](https://www.dio.me/)**.

O objetivo principal era colocar em prática os conceitos de Infraestrutura como Código (IaC) utilizando Shell Script para automatizar a configuração de um servidor web Apache e o deploy de uma aplicação simples. ⚙️

<br>


## 🎯 Desafio Proposto

A missão, caso decidisse aceitá-la (e eu aceitei! 💪), consistia em:

1.  👻 **Restaurar o Snapshot:** Voltar a VM no VirtualBox para um estado limpo pré-definido.
2.  🔄 **Atualizar o Servidor:** Garantir que todos os pacotes estejam na última versão.
3.  🌐 **Instalar o Apache2:** Provisionar o servidor web.
4.  📦 **Instalar o Unzip:** Adicionar a ferramenta para descompactar arquivos.
5.  📥 **Baixar a Aplicação:** Obter o código-fonte de exemplo do GitHub (`linux-site-dio`) para o diretório `/tmp`.
6.  🚚 **Copiar Arquivos:** Mover os arquivos da aplicação para o diretório raiz do Apache (`/var/www/html/`).
7.  ☁️ **Subir o Script:** Compartilhar a solução (este script!) em um repositório no GitHub.

<br>


## 🛠️ Ambiente Utilizado

*   **Sistema Operacional:** Linux Ubuntu 24.04.2 LTS (Live Server) 🐧
*   **Virtualizador:** Oracle VirtualBox
*   **Linguagem de Script:** Bash Shell

<br>


## ✨ A Solução Mágica: `script-iac.sh`

Para automatizar todo o processo, criei o script `script-iac.sh`. Abaixo está o passo a passo implementado no código:

1.  **Preparação:**
    *   Restaurei o snapshot inicial da VM Ubuntu no VirtualBox para garantir um ambiente limpo. ✅

2.  **Criação do Script (`script-iac.sh`):**
    *   O script executa as seguintes tarefas sequencialmente:
        *   **Atualização:** Executa `apt-get update` e `apt-get upgrade -y` para atualizar os pacotes do sistema.
        *   **Instalação do Apache:** Instala o servidor web Apache2 com `apt-get install apache2 -y`.
        *   **Instalação do Unzip:** Instala a ferramenta `unzip` com `apt-get install unzip -y`.
        *   **Download da Aplicação:** Navega até `/tmp`, baixa o arquivo `.zip` do repositório do Denilson Bonatti usando `wget`.
        *   **Descompactação:** Extrai o conteúdo do arquivo `.zip` baixado.
        *   **Deploy:** Navega para o diretório descompactado e copia **todo** o seu conteúdo (`*`) recursivamente (`-R`) para o diretório web padrão do Apache (`/var/www/html/`), sobrescrevendo o conteúdo existente.

```bash
#!/bin/bash

echo "🔄 Atualizando servidor..."
apt-get update
apt-get upgrade -y

echo "🌐 Instalando Apache2..."
apt-get install apache2 -y

echo "📦 Instalando unzip..."
apt-get install unzip -y

echo "📥 Baixando e 🚀 copiando os arquivos da aplicação..."

# Navega para o diretório temporário
cd /tmp

# Baixa o arquivo zip da aplicação
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompacta o arquivo
unzip main.zip

# Navega para o diretório da aplicação descompactado
cd linux-site-dio-main

# Copia todo o conteúdo para o diretório raiz do Apache
# A flag -R garante a cópia de diretórios e seus conteúdos
cp -R * /var/www/html/

echo "🎉 Processo concluído! Servidor Apache configurado e site no ar!"

```

3.  **Execução e Verificação:**
    *   Tornei o script executável com o comando: `chmod +x script-iac.sh`. 🔑
    *   **(Passo Extra de Segurança):** Criei um novo snapshot da VM antes de executar o script, só por precaução! 😉
    *   Executei o script como superusuário: `sudo ./script-iac.sh`.
    *   **Resultado:** Sucesso! 🎉 O script rodou sem erros, e ao acessar o endereço IP da VM no navegador, a página web do projeto `linux-site-dio` foi exibida corretamente.

<br>


## 🚀 Como Usar/Reproduzir

1.  Clone este repositório ou baixe o arquivo `script-iac.sh`.
2.  Certifique-se de estar em um ambiente Linux baseado em Debian/Ubuntu.
3.  Abra um terminal.
4.  Navegue até o diretório onde o script foi salvo.
5.  Torne o script executável: `chmod +x script-iac.sh`
6.  Execute o script com privilégios de superusuário: `sudo ./script-iac.sh`
7.  Aguarde a conclusão do script.
8.  Abra seu navegador e acesse o endereço IP do seu servidor Linux. Você deverá ver a página web do projeto!

**⚠️ Atenção:** Este script instala pacotes e modifica o diretório `/var/www/html/`. Execute-o com cautela e preferencialmente em um ambiente de teste ou máquina virtual dedicada.

<br>


## 🙏 Agradecimentos

*   Ao instrutor **[Denilson Bonatti](https://www.linkedin.com/in/denilsonbonatti/)** pela proposta do desafio.
*   À **[DIO (Digital Innovation One)](https://www.dio.me/)** e ao **Santander ([Santander Open Academy](https://www.linkedin.com/company/santander-open-academy/posts/?feedView=all))** pela oportunidade de aprendizado no Bootcamp.

<br>


## 👨‍💻 Expert

<p>
    <img 
      align=left 
      margin=10 
      width=80 
      src="https://avatars.githubusercontent.com/u/44624583?v=4"
    />
    <p>&nbsp&nbsp&nbspMarcos Winther<br>
    &nbsp&nbsp&nbsp
    <a href="https://github.com/MarcosWinther">
    GitHub</a>&nbsp;|&nbsp;
    <a href="https://www.linkedin.com/in/marcoswinthersilva/">LinkedIn</a>
    </p>
</p>
<br/><br/>

---

⌨️ com 💜 por [Marcos Winther](https://github.com/MarcosWinther)
