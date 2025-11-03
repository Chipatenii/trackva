--- SCHEMA ---
-- Enable UUID extension
create extension if not exists "uuid-ossp";


-- Users are handled by Supabase Auth; we reference auth.uid() in RLS.


create table if not exists profiles (
id uuid primary key default uuid_generate_v4(),
user_id uuid unique not null,
full_name text,
role text check (role in ('owner','assistant')) default 'owner',
created_at timestamptz default now()
);


create table if not exists tasks (
id uuid primary key default uuid_generate_v4(),
owner_id uuid not null, -- the manager/owner (you)
assignee_id uuid not null, -- the VA
title text not null,
description text,
status text check (status in ('todo','in_progress','blocked','done')) default 'todo',
due_date date,
created_at timestamptz default now()
);


create table if not exists time_logs (
id uuid primary key default uuid_generate_v4(),
user_id uuid not null, -- who logged time (VA)
task_id uuid references tasks(id) on delete set null,
started_at timestamptz not null,
ended_at timestamptz,
notes text,
created_at timestamptz default now()
);


create table if not exists checkins (
id uuid primary key default uuid_generate_v4(),
user_id uuid not null,
date date not null default current_date,
mood text,
what_i_did text,
blockers text,
plan text,
created_at timestamptz default now()
--- END SCHEMA ---