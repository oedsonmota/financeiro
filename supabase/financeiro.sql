-- Finanças do Edson (financeiro.edsonmota.com)
-- Rodar inteiro no SQL Editor do Supabase, no projeto plataforma-cliente.
-- Usa a função public.is_admin() que já existe nesse projeto: só o admin (Edson) lê e grava.

create table if not exists public.fin_docs (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  path text not null,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, path)
);

alter table public.fin_docs enable row level security;

drop policy if exists "financeiro: so o admin, so os proprios dados" on public.fin_docs;
create policy "financeiro: so o admin, so os proprios dados" on public.fin_docs
  for all to authenticated
  using (user_id = auth.uid() and public.is_admin())
  with check (user_id = auth.uid() and public.is_admin());

revoke all on public.fin_docs from anon;
grant select, insert, update, delete on public.fin_docs to authenticated;
