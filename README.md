# NFL Super Bowl Loader

This project is a SQL-based data loading and analysis tool for Super Bowl data. It includes table creation, data ingestion from CSV files, and example queries to explore team performance and win history.

## 📁 Project Structure

- `NFL_SCHEMA.sql` — Defines the schema for `team` and `super_bowl_win` tables
- `data_load.sql` — Loads data from CSV files into the database
- `nfl_queries.sql` — Contains sample SQL queries and views for insights
- `super_bowl_winners.csv` — Data for all Super Bowl wins
- `teams.csv` — List of NFL teams with metadata
- `super_bowl_schema.dump` — Optional PostgreSQL dump file for quick setup

## 🏗️ Requirements

- PostgreSQL
- `psql` CLI
- Local file access (update CSV file paths if needed)

## 🚀 How to Run

1. **Create the database and schema**

   ```bash
   psql -U your_user -d your_db -f NFL_SCHEMA.sql
   ```

2. **Load the data**

   ```bash
   psql -U your_user -d your_db -f data_load.sql
   ```

3. **Run analysis queries**

   ```bash
   psql -U your_user -d your_db -f nfl_queries.sql
   ```

## 📊 Example Output

The view `v_team_record` shows each team, how many Super Bowls they’ve won, and their most recent win date.

## 🙇‍♂️ Author

**Olutosho Agunloye**

## 📌 Notes

- Update the file paths in `data_load.sql` if you move the CSVs
- Compatible with macOS/Linux systems using the `psql` CLI

