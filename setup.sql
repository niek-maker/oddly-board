-- Run this in Supabase SQL Editor (Dashboard > SQL Editor > New Query)

-- Create the items table
CREATE TABLE items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  url TEXT NOT NULL,
  platform TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable public read/write access (simple setup for password-protected site)
ALTER TABLE items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all operations" ON items
  FOR ALL
  USING (true)
  WITH CHECK (true);
