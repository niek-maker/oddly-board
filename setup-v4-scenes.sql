-- Run this in Supabase SQL Editor

-- Scenes table
create table if not exists scenes (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  color text default '#A855F7',
  sort_order int default 0,
  created_at timestamptz default now()
);

-- Add scene_id to items
alter table items add column if not exists scene_id uuid references scenes(id) on delete set null;

-- Open RLS
alter table scenes enable row level security;
create policy "scenes_all" on scenes for all using (true) with check (true);
