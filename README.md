# TrackVA

Minimal PWA to track a Virtual Assistant:
- Tasks
- Time logs
- Daily check-ins
- Simple weekly report

## Tech

- HTML + Tailwind CDN
- Supabase (Auth + Postgres)
- PWA + Service Worker

## Setup

1. Create Supabase project (free).
2. Paste `supabase-schema.sql` into SQL editor and run.
3. In `index.html`, replace:

   ```js
   const SUPABASE_URL = "https://YOUR_PROJECT_ID.supabase.co";
   const SUPABASE_ANON_KEY = "YOUR_PUBLIC_ANON_KEY";
