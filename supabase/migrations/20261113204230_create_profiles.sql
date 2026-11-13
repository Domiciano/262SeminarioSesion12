create table public.profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    name text not null,
    email text not null
);

grant select, insert, update, delete on public.profiles
to anon, authenticated;

alter table public.tracks
add column user_id uuid references public.profiles(id)
on delete cascade;