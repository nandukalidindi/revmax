ALTER TABLE events DROP COLUMN IF EXISTS description;

ALTER TABLE events ADD COLUMN cover_source VARCHAR;
ALTER TABLE events ADD COLUMN owner_name VARCHAR;

UPDATE events SET cover_source = "cover"->>'source';
UPDATE events SET owner_name = "owner"->>'name';

ALTER TABLE events DROP COLUMN IF EXISTS cover;
ALTER TABLE events DROP COLUMN IF EXISTS owner;
