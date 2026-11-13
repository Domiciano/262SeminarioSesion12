create table public.tracks (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  artist_name text not null,
  image_url text
);

grant select, insert, update, delete on public.tracks to anon, authenticated;