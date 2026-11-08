# Finanças · Edson Mota

Sistema de finanças pessoais (PF) e da empresa (PJ).

- Site estático no GitHub Pages: https://financeiro.edsonmota.com
- Login e dados no Supabase (projeto `plataforma-cliente`, tabela `fin_docs`)
- `config.js` tem só a chave pública. Nenhum dado financeiro fica neste repositório: tudo está no banco, protegido por login e pelas regras de acesso (RLS) em `supabase/financeiro.sql`.
