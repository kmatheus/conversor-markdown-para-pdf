# 📄 Currículos de Markdown para PDF

Este projeto utiliza o **Pandoc** junto com o motor **wkhtmltopdf** para converter arquivos Markdown (`.md`) diretamente em PDFs bem formatados, garantindo o suporte correto a emojis e caracteres especiais.

## 🛠️ Requisitos (Instalação Única)

Se você mudar de computador ou precisar reinstalar as ferramentas no Linux, execute o comando abaixo no terminal:

```bash
sudo apt update && sudo apt install -y pandoc wkhtmltopdf
```

# 📁 Organização de Pastas e Automação

O projeto está estruturado para separar os arquivos de origem das exportações finais:
* `/markdowns`: Armazena os arquivos de texto originais (`.md`).
* `/pdfs`: Pasta de destino onde os arquivos finais (`.pdf`) serão gerados.
* `/previews`: Arquivos (`.html`) gerados para visualização rápida no navegador.

## 🛠️ Configuração Inicial (Uma única vez)

Para criar e ativar o script automatizador no seu sistema, siga estes 3 passos no terminal:

1. **Crie o arquivo:**
   ```bash
   touch gerar-pdf.sh
   ```
2. **Adicione o código:** Abra o arquivo `gerar-pdf.sh` em seu editor de texto e cole o código completo do script shell nele.
3. **Dê a permissão de execução:** Rode o comando abaixo para que o Linux permita rodar o script:
   ```bash
   chmod +x gerar-pdf.sh
   ```

## 🚀 Como Executar

Para gerar o PDF e a página de Preview simultaneamente, chame o script passando o **nome** e a **versão** como argumentos (separados por espaço):

```bash
./gerar-pdf.sh [NOME] [VERSÃO]
```

### 💡 Exemplo de Uso:
```bash
./gerar-pdf.sh kelvin v1
```

O comando acima processará o arquivo `markdowns/curriculo-kelvin-v1.md` e entregará:
1. O documento final pronto em `pdfs/curriculo-kelvin-v1.pdf`.
2. Uma página da web em `previews/curriculo-kelvin-v1.html` para conferência rápida no navegador.

O sistema validará automaticamente se o arquivo `.md` existe na pasta de origem antes de renderizar os arquivos finais, evitando erros silenciosos.

## 💡 Dicas Rápidas

- **Gerenciar Versões:** Para criar uma nova versão ou currículo de outra pessoa, basta criar o arquivo `.md` na pasta `/markdowns` seguindo o padrão `curriculo-{nome}-{versao}.md` e chamá-lo com o script.
- **Suporte a Emojis:** O suporte a símbolos como 📱, ✉️ e 🔗 já está configurado de forma nativa e automatizada dentro do script de execução.
