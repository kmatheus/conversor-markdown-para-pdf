#!/bin/bash

# 1. Garante que todas as pastas necessárias existem
mkdir -p markdowns pdfs previews

# 2. Verifica se o usuário passou os dois argumentos necessários
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ Erro: Faltam argumentos!"
    echo "👉 Modo de uso correto: ./gerar-pdf.sh [NOME] [VERSAO]"
    echo "💡 Exemplo: ./gerar-pdf.sh kelvin v1"
    exit 1
fi

# 3. Guarda os argumentos em variáveis limpas
NOME=$1
VERSAO=$2

# 4. Monta os caminhos dos arquivos dinamicamente
ARQUIVO_MD="markdowns/curriculo-${NOME}-${VERSAO}.md"
ARQUIVO_HTML="previews/curriculo-${NOME}-${VERSAO}.html"
ARQUIVO_PDF="pdfs/curriculo-${NOME}-${VERSAO}.pdf"

# 5. Verifica se o arquivo .md realmente existe
if [ ! -f "$ARQUIVO_MD" ]; then
    echo "❌ Erro: O arquivo '$ARQUIVO_MD' não foi encontrado!"
    exit 1
fi

echo "⏳ Iniciando o processamento de $ARQUIVO_MD..."

# 6. Gera o arquivo HTML de Preview (Completo com estrutura web)
pandoc "$ARQUIVO_MD" -s -o "$ARQUIVO_HTML"
echo "🌐 Preview HTML gerado em: $ARQUIVO_HTML"

# 7. Executa a conversão para PDF com suporte a emojis
pandoc "$ARQUIVO_MD" -o "$ARQUIVO_PDF" --pdf-engine=wkhtmltopdf

echo "✅ Sucesso absoluto! PDF gerado em: $ARQUIVO_PDF"
