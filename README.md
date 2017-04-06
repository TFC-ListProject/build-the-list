# build-the-list

Build the most exhaustive list of campaigns down to the district level.

## Prerequisites

* Python 2.7 (should be installed)
* [Homebrew](https://brew.sh/)

## Dependencies

These are required and will be install automatically if missing.

* [Autoenv](https://github.com/kennethreitz/autoenv) - per-project shell environment
* [Flyway](https://flywaydb.org/) - database migrations
* [Ghostscript](https://www.ghostscript.com/)
* [Postgresql](https://www.postgresql.org/) - relational database

## Installation

```
./bin/install
```

## Running

### PDF Extraction

PDFs currently require some manual preprocessing. Run

```
python build_the_list/pdf_extract.py -f path/to/pdf -o
```

and update the `config/pdf_meta.json` file with the following properties:

* `candidates`: list of candidate names
* `parties`: list of party names
* `county_indices`: list of indices where counties list starts
* `total_row_indices`: list of indices where totals are described
* `skip_row_indices`: list of indices of rows to not process

```
python build_the_list/pdf_extract.py -f path/to/pdf
```

## Migrations

Create a new migration:

```
./bin/migration "description of migration"
```

Run all pending migrations:

```
flyway migrate -q -locations=filesystem:./resources/sql/ -configFile=./config/flyway.{env}.conf
```

Truncate all migrated tables, removing all data:

```
flyway clean -configFile=./config/flyway.{env}.conf
```

## Tests

```
pytest tests/
ptw # pytest-watch: run tests automatically
```
