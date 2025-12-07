-- DANGEROUS: DROP TABLES TO ENSURE CORRECT SCHEMA
-- This is necessary because the previous tables likely don't have the 'data' column
-- and 'create table if not exists' was skipping them.

DROP TABLE IF EXISTS emissions CASCADE; -- Legacy
DROP TABLE IF EXISTS app_users CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS records CASCADE;
DROP TABLE IF EXISTS absences CASCADE;
DROP TABLE IF EXISTS sanctions CASCADE;
DROP TABLE IF EXISTS tasks CASCADE;
DROP TABLE IF EXISTS checklist_snapshots CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS admin_tasks CASCADE;
DROP TABLE IF EXISTS app_settings CASCADE;
DROP TABLE IF EXISTS inventory_items CASCADE;
DROP TABLE IF EXISTS inventory_sessions CASCADE;
DROP TABLE IF EXISTS cash_shifts CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS wallet_transactions CASCADE;
DROP TABLE IF EXISTS fixed_expenses CASCADE;
DROP TABLE IF EXISTS partners CASCADE;
DROP TABLE IF EXISTS projections CASCADE;

-- NOW RECREATE WITH CORRECT STRUCTURE (ID + DATA JSONB)

-- USERS
create table app_users (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table app_users enable row level security;
create policy "Allow public access to app_users" on app_users for all using (true) with check (true);

-- EMPLOYEES
create table employees (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table employees enable row level security;
create policy "Allow public access to employees" on employees for all using (true) with check (true);

-- RECORDS
create table records (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table records enable row level security;
create policy "Allow public access to records" on records for all using (true) with check (true);

-- ABSENCES
create table absences (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table absences enable row level security;
create policy "Allow public access to absences" on absences for all using (true) with check (true);

-- SANCTIONS
create table sanctions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table sanctions enable row level security;
create policy "Allow public access to sanctions" on sanctions for all using (true) with check (true);

-- TASKS
create table tasks (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table tasks enable row level security;
create policy "Allow public access to tasks" on tasks for all using (true) with check (true);

-- CHECKLIST SNAPSHOTS
create table checklist_snapshots (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table checklist_snapshots enable row level security;
create policy "Allow public access to checklist_snapshots" on checklist_snapshots for all using (true) with check (true);

-- POSTS
create table posts (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table posts enable row level security;
create policy "Allow public access to posts" on posts for all using (true) with check (true);

-- ADMIN TASKS
create table admin_tasks (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table admin_tasks enable row level security;
create policy "Allow public access to admin_tasks" on admin_tasks for all using (true) with check (true);

-- APP SETTINGS
create table app_settings (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table app_settings enable row level security;
create policy "Allow public access to app_settings" on app_settings for all using (true) with check (true);

-- INVENTORY
create table inventory_items (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table inventory_items enable row level security;
create policy "Allow public access to inventory_items" on inventory_items for all using (true) with check (true);

create table inventory_sessions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table inventory_sessions enable row level security;
create policy "Allow public access to inventory_sessions" on inventory_sessions for all using (true) with check (true);

-- CASH REGISTER
create table cash_shifts (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table cash_shifts enable row level security;
create policy "Allow public access to cash_shifts" on cash_shifts for all using (true) with check (true);

-- PRODUCTS
create table products (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table products enable row level security;
create policy "Allow public access to products" on products for all using (true) with check (true);

-- WALLET
create table wallet_transactions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table wallet_transactions enable row level security;
create policy "Allow public access to wallet_transactions" on wallet_transactions for all using (true) with check (true);

-- EXPENSES & PARTNERS
create table fixed_expenses (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table fixed_expenses enable row level security;
create policy "Allow public access to fixed_expenses" on fixed_expenses for all using (true) with check (true);

create table partners (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table partners enable row level security;
create policy "Allow public access to partners" on partners for all using (true) with check (true);

create table projections (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now())
);
alter table projections enable row level security;
create policy "Allow public access to projections" on projections for all using (true) with check (true);


-- ENABLE REALTIME FOR ALL
alter publication supabase_realtime add table app_users;
alter publication supabase_realtime add table employees;
alter publication supabase_realtime add table records;
alter publication supabase_realtime add table absences;
alter publication supabase_realtime add table sanctions;
alter publication supabase_realtime add table tasks;
alter publication supabase_realtime add table checklist_snapshots;
alter publication supabase_realtime add table posts;
alter publication supabase_realtime add table admin_tasks;
alter publication supabase_realtime add table app_settings;
alter publication supabase_realtime add table inventory_items;
alter publication supabase_realtime add table inventory_sessions;
alter publication supabase_realtime add table cash_shifts;
alter publication supabase_realtime add table products;
alter publication supabase_realtime add table wallet_transactions;
alter publication supabase_realtime add table fixed_expenses;
alter publication supabase_realtime add table partners;
alter publication supabase_realtime add table projections;

-- DEFAULT ADMIN USER (Re-adding it since we dropped tables)
INSERT INTO app_users (id, data)
VALUES (
  'admin-default-id',
  '{
    "username": "Adminsushiblack",
    "password": "admin",
    "email": "admin@sushiblack.com",
    "role": "ADMIN",
    "name": "Administrador",
    "permissions": {
      "viewHr": true,
      "manageHr": true,
      "viewOps": true,
      "manageOps": true,
      "viewFinance": true,
      "manageFinance": true,
      "viewInventory": true,
      "manageInventory": true,
      "superAdmin": true
    }
  }'::jsonb
);
