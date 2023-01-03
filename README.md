# README
Página que faz chamadas à API do PagTesouro

<img alt="GitHub last commit" src="https://img.shields.io/badge/last%20commit-jan-green">
<img alt="GitHub Release Date" src="https://img.shields.io/badge/release-v1-orange">
<!-- img alt="Packagist License (custom server)" src="https://img.shields.io/packagist/l/EdMagal/geare/" -->

# Necessita de Colaboradores!!!

## A Guia de Recolhimento da União
A Guia de Recolhimento da União (GRU) é o documento oficial para arrecadação das receitas federais públicas não tributárias (aluguéis, multas, taxas...).

## O PagTesouro
A partir de novembro de 2020, os contribuintes tiveram acesso ao pagamento de GRU Digital que permite quitar suas obrigações por meio de Pix ou Cartão de Crédito.
A arrecadação de GRU é decentralizada, competindo a cada Órgão Público Federal integrar seu sistema à API do PagTesouro para poder recolher GRU Digital.

## Proposta
Esse repositório pretende funcionar como o site da própria Secretaria do Tesouro Nacional comunicando com a API do PagTesouro.
Um usuário administrador pode criar boletos em favor de outros usuários cadastrados (contribuintes).
O contribuinte pode visualizar o boleto criado e clicar em pagar. Nesse momento, é feita uma chamada (Post) ao PagTesouro com os dados do pagamento
O PagTesouro deve retornar (response) um arquivo com dados em formato JSON:
```
{
  "idPagamento": "1BvAmpIRYZF55yg9D6WOTZ",
  "dataCriacao": "2022-01-12T16:00:00Z",
  "proximaUrl": "https://valpagtesouro.tesouro.gov.br/#/pagamento?idSessao=66706694-fce3-4a56-8172-8b4ed12508a4",
  "situacao": {
    "codigo": "CRIADO"
  }
}
```

## TO DO
 - Incluir estilo conforme https://www.gov.br/ds/home
 - Validar os campos de preenchimento quando da criação da guia (e.g.: Valor deve ser númerico, com dois dígitos decimais, etc.)
 - Alterar o status da GRU na base de dados para corresponder a que está no PagTesouro: pendente, concluída, rejeitada, etc.
 - Impedir do contribuinte de tentar pagar guias que não estejam com o status de pendente.
 - Colocar em produção.
 - Bonus: Gerar relatórios de guias pagas por algum usuário.
 
## Mais informações
GRU: https://www.gov.br/tesouronacional/pt-br/gru-e-pag-tesouro/sobre-a-gru/o-que-e-gru
PagTesouro: https://www.gov.br/tesouronacional/pt-br/gru-e-pag-tesouro/pagtesouro
Simulador: https://valpagtesouro.tesouro.gov.br/simulador/#/pages/api
API: https://pagtesouro.tesouro.gov.br/docs/api-psp/#operation/solicitacaoPagamento
Padrão Digital do Governo: https://www.gov.br/ds/home

