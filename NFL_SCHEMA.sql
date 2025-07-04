-- Sequences
CREATE SEQUENCE team_id_seq START 1;
CREATE SEQUENCE sb_win_id_seq START 1;

-- Tables
CREATE TABLE team (
    team_id INT PRIMARY KEY DEFAULT nextval('team_id_seq'),
    team_name TEXT NOT NULL,
    first_season INT,
    created_by TEXT,
    created_at TIMESTAMP,
    modified_by TEXT,
    modified_at TIMESTAMP
);

CREATE TABLE super_bowl_win (
    sb_win_id INT PRIMARY KEY DEFAULT nextval('sb_win_id_seq'),
    sb_number INT,
    season_year INT,
    game_date DATE,
    winner_team_id INT REFERENCES team(team_id),
    opponent TEXT,
    score TEXT,
    created_by TEXT,
    created_at TIMESTAMP,
    modified_by TEXT,
    modified_at TIMESTAMP
);

-- Audit trigger function
CREATE OR REPLACE FUNCTION trg_set_audit_cols() RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.created_by := current_user;
        NEW.created_at := now();
    ELSE
        NEW.modified_by := current_user;
        NEW.modified_at := now();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers
CREATE TRIGGER team_audit_trg
BEFORE INSERT OR UPDATE ON team
FOR EACH ROW EXECUTE FUNCTION trg_set_audit_cols();

CREATE TRIGGER sb_win_audit_trg
BEFORE INSERT OR UPDATE ON super_bowl_win
FOR EACH ROW EXECUTE FUNCTION trg_set_audit_cols();
