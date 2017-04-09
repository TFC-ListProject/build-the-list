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
./go/install
```

## Running

### PDF Extraction

PDFs currently require some manual preprocessing. Run

```
./go extract_pdf -f path/to/pdf -o
```

and update the `config/pdf_meta.json` file with the following properties:

* `candidates`: list of candidate names
* `parties`: list of party names
* `has_counties`: `true` if results have municipalities and counties, `false` if just municipalities
* `county_indices`: list of indices where counties list starts
* `total_row_indices`: list of indices where totals are described
* `skip_row_indices`: list of indices of rows to not process

```
./go extract_pdf -f path/to/pdf
```

## Migrations

Create a new migration:

```
./go migrate -n "description of migration"
```

Run all pending migrations:

```
./go migrate -e {env}
```

Truncate all migrated tables, removing all data:

```
./go migrate -e {env} -d
```

## Tests

```
./go test
./go test -w # run tests continuously with pytest-watch
```
