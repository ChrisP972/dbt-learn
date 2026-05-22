# dbt Databricks Learning Project

This repository documents my hands-on learning with dbt Core and Databricks using the Jaffle Shop tutorial.

## Stack

- dbt Core
- dbt-databricks adapter
- Databricks Free Edition
- Unity Catalog
- uv for Python environment management and command execution
- VS Code

## Package Management - uv

dbt Core is installed as a Python package. This project uses `uv` to create and manage an isolated Python environment, install dbt dependencies, and run dbt commands consistently without relying on globally installed Python packages.

uv is not required to use dbt Core, but it makes the setup more reproducible.

## Project Layout

- Raw data lives in Databricks Unity Catalog
- dbt models are built into a separate development schema
- Staging models clean and standardise raw data
- Mart models aggregate and prepare data for analytics

## Useful Commands

```powershell
uv run dbt debug
uv run dbt compile
uv run dbt run
uv run dbt test
uv run dbt build
uv run dbt docs generate