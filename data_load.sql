-- ========================= data_load.sql =========================

-- Optional reset
-- TRUNCATE TABLE super_bowl_win RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE team            RESTART IDENTITY CASCADE;

-----------------------------------------------
\COPY team (team_name, first_season) FROM '/Users/olutoshoagunloye/Downloads/teams.csv' WITH (FORMAT csv, HEADER true)

\COPY super_bowl_win (sb_number, season_year, game_date, winner_team_id, opponent, score, created_by, created_at, modified_by, modified_at) FROM '/Users/olutoshoagunloye/Downloads/super_bowl_winners.csv' WITH (FORMAT csv, HEADER true)
-----------------------------------------------

BEGIN;

UPDATE team
SET    has_super_bowl = TRUE
WHERE  team_id IN (SELECT DISTINCT winner_team_id FROM super_bowl_win);

CREATE OR REPLACE VIEW v_team_record AS
SELECT
    t.team_id,
    t.team_name,
    COUNT(sb.sb_win_id) AS win_count,
    MAX(sb.game_date)   AS last_win_date
FROM team t
LEFT JOIN super_bowl_win sb
  ON t.team_id = sb.winner_team_id
GROUP BY t.team_id, t.team_name;

COMMIT;

-- quick check
SELECT * FROM v_team_record ORDER BY win_count DESC;
