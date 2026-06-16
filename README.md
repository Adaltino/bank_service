# Bank Service

Bank Service é uma simulação de instituição financeira desenvolvida para fins educacionais.
O sistema permite gerenciamento de contas, cartões e pagamentos, atuando como provedor financeiro do ecossistema.

## Funcionalidades

* Cadastro de clientes
* Contas bancárias
* Saldo
* Cartão de débito
* Cartão de crédito
* Pagamento PIX
* Validação de cartões
* Aprovação e recusa de transações

## Tecnologias

* Ruby on Rails 8
* PostgreSQL
* TailwindCSS
* Faraday

## Fluxo PIX

1. Usuário recebe um código PIX.
2. Código é informado no Bank Service.
3. Sistema consulta o Payment Service.
4. Dados da cobrança são exibidos.
5. Usuário confirma o pagamento.
6. Saldo é debitado.
7. Payment Service recebe a confirmação.

## Fluxo Cartão

1. Payment Service envia os dados do cartão.
2. Bank Service valida a conta.
3. Saldo ou limite é verificado.
4. Transação é aprovada ou recusada.

## Env
```
BANK_API_TOKEN=your-token

PAYMENT_API_TOKEN=your-token

PAYMENT_API_URL=http://localhost:3001
```

## Executando o Projeto

```bash
bundle install
rails db:create
rails db:migrate
rails s -p 3002
```

## Objetivo

Este projeto foi desenvolvido com fins de estudo para demonstrar conceitos de:

* Microsserviços
* Integração entre APIs
* Processamento de pagamentos
* Comunicação síncrona e assíncrona
* Arquitetura distribuída

## Melhorias Futuras

* Adicionar Docker e Docker Compose.
* Melhorar interface visual do internet banking.
* Implementar histórico de transações.
* Implementar extrato bancário.
* Criar gerenciamento de contas bancárias.
* Adicionar controle de limite para cartões de crédito.
* Implementar leitura real de QR Code PIX.
* Melhorar validações de saldo e transações.
* Adicionar autenticação em dois fatores (2FA).
* Criar auditoria de operações financeiras.
* Implementar testes automatizados.