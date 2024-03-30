# Database Simulation with SQLite

## Overview
This repository contains scripts to create a SQLite database, populate it with data, and run simulations using Python scripts.

## Files
1. `create.sql`: SQL script to create the database schema.
2. `populate.sql`: SQL script to populate the database with sample data.
3. `sim.py`: Python script to simulate transactions with the SQLite database (mix of read and write operations).
4. `simr.py`: Python script for a simulation of transactions with the SQLite database(just read operations).
5. `README.md` (this file): Instructions for executing the scripts and simulations.

## Instructions

### Step 0: Database Declaration
- Execute the `sqlite3 test.db` script to create the SQLite database schema.

### Step 1: Dtabase Setup
- Execute the `.read create.sql` script to create the SQLite database schema.


### Step 2: Data Population
- Run the `.read populate.sql` script to populate the database with sample data.


### Step 3: Running Simulations
- Choose either `sim.py` or `simr.py` to run the simulation.
- `sim.py` simulates transactions with the SQLite database.
  ```
  python sim.py
  ```
- `simr.py` is a simulation script with just reads.
  ```
  python simr.py
  ```

## Notes
- Ensure that you have SQLite installed on your system to execute the SQL scripts and run the simulations.



