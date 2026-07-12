#!/bin/bash

# 1. Garante que todas as pastas necessárias existem
mkdir -p markdowns pdfs previews

# 2. Verifica se o usuário passou pelo menos os dois argumentos básicos
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ Erro: Faltam argumentos!"
    echo "👉 Modo de uso correto: ./gerar-pdf.sh [NOME] [VERSAO] [FONTE_OPCIONAL]"
    echo "💡 Exemplo: ./gerar-pdf.sh kelvin v1"
    exit 1
fi

# 3. Guarda os argumentos em variáveis
NOME=$1
VERSAO=$2
# Se o terceiro argumento estiver vazio, define "Arial" como fonte padrão profissional
FONTE="${3:-Arial}"

# 4. Monta os caminhos dos arquivos dinamicamente
ARQUIVO_MD="markdowns/curriculo-${NOME}-${VERSAO}.md"
ARQUIVO_HTML="previews/curriculo-${NOME}-${VERSAO}.html"
ARQUIVO_PDF="pdfs/curriculo-${NOME}-${VERSAO}.pdf"

# 5. Verifica se o arquivo .md realmente existe
if [ ! -f "$ARQUIVO_MD" ]; then
    echo "❌ Erro: O arquivo '$ARQUIVO_MD' não foi encontrado!"
    exit 1
fi

echo "⏳ Iniciando o processamento de $ARQUIVO_MD (Fonte: $FONTE)..."

# 6. Gera o arquivo HTML de Preview
pandoc "$ARQUIVO_MD" -s -o "$ARQUIVO_HTML"
echo "🌐 Preview HTML gerado em: $ARQUIVO_HTML"

# 7. Injeta o CSS corrigindo o Dark Mode e aplicando a fonte dinâmica universalmente
echo "<style>
  html, body { 
    background-color: #ffffff !important; 
    color: #000000 !important; 
    font-family: '$FONTE', sans-serif !important;
  } 
  @media print { 
    html, body { background: white !important; } 
  }
</style>" > /tmp/header_css.html

# 8. Executa a conversão para PDF sem cabeçalhos intrusivos e aplicando as margens
pandoc "$ARQUIVO_MD" -o "$ARQUIVO_PDF" \
  --pdf-engine=wkhtmltopdf \
  -H /tmp/header_css.html \
  -V margin-top=20mm -V margin-bottom=20mm -V margin-left=20mm -V margin-right=20mm

# 9. Limpa o arquivo auxiliar
rm -f /tmp/header_css.html

echo "✅ Sucesso absoluto! PDF gerado em: $ARQUIVO_PDF"
