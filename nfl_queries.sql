-- Team win record view
SELECT * FROM v_team_record;

-- Championship count for a team
SELECT fn_team_championships('Dallas Cowboys');

-- Latest Super Bowl winner
SELECT * FROM super_bowl_win ORDER BY game_date DESC LIMIT 1;
