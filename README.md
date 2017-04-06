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

```
python build_the_list/pdf_extract.py -f resources/sample_presidential_nj.pdf
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
