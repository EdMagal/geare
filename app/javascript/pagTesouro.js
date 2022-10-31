// Funcionou, mas não sei como integrar com o Controller.

function callPagTesouro() {
  const url = "https://valpagtesouro.tesouro.gov.br/api/gru/solicitacao-pagamento";
  const dataToPost = {
    "codigoServico": "841",
    "referencia": "12345",
    "competencia": "",
    "vencimento": "30092022",
    "cnpjCpf": "05534584777",
    "nomeContribuinte": "Dr Tranvanvan",
    "valorPrincipal": "7",
    "valorDescontos": "",
    "valorOutrasDeducoes": "",
    "valorMulta": "",
    "valorJuros": "1",
    "valorOutrosAcrescimos": ".88",
    "urlRetorno": "",
    "urlNotificacao": "",
    "modoNavegacao": "2",
    "expiracaoPix": ""
  };

  fetch(url, {
    method: 'post',
    body: JSON.stringify(dataToPost),
    mode: 'cors',
    headers: new Headers({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxNzA1MDIifQ.CivkhqWjNkmHheG_5vAYemitv9jtuXR-cg41A7-Dh-Bh9MBp9xtOq4iCfrWj60eMAr_qY6BIIuJnG7hUq4nqTFp08uICy2bs59DEChxIysaDYrZW65xQBrUaP_IYjEU1ImgSviDQqjnSMEIeXGByXBhUQUzQgtP1cQif02hKCRnr-brGq8QHmxt11P8LUmmqICQPFAG8HKZZqRZBFhXXHWWIWEgG3wiTcRdRLSX5zHj53Z7prg-1D4GTyqGiinhfHAo8LK8zUBh7VspXJIuGgfC4kGQcBf8KBNn3bFacC9m6pAaO3PhoefEeNhDeKZr6vpxGYG6aFTdzSVd0zd8RPg'
    })
  })
    .then(response => response.json())
    .then(json => console.log('Response', json));
}
