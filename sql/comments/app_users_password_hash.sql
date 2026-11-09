-- English comment. Column `password_hash` is not renamed.
COMMENT ON COLUMN app_users.password_hash IS 'bcrypt hash; never store the plain password here';
