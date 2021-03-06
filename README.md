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
eb init
# use buildthelist_user keys that can be shared with you
```

## Deploy

```
eb deploy
```

## Updating the Prediction Results

```
TRUNCATE TABLE predictions RESTART IDENTITY;
\copy predictions(state,district_number,turnout,dollars_spent,chance_win) FROM 'path/to/predictions.csv' DELIMITER ',' CSV HEADER;
```

## Running

### Application Server

```
python application.py
```

To access API:

```
curl -i http://localhost:5000
curl -i http://buildthelist-production.hgaprmwkwy.us-west-2.elasticbeanstalk.com
```

### PDF Extraction

PDFs currently require some manual preprocessing.

* Download the list of PDFs to the `resources/tmp directory`, either manually or using something like `wget -i -P resources/tmp resources/urls.csv`.
* `./go extract_pdf -f path/to/pdf -o`. This outputs each row number and line of text.
* In `config/pdf_meta.json`, create a new entry in the JSON.
* After entering values, run the above command again but without the `-o` flag. If everything goes well, it will complete without comment.
* If there is an error, the saved data is rolled back. To debug, it's probably easiest to uncomment line 31 in `build_the_list/election.py`, rerun, and look at the row that failed. It may just be a missed row to skip.
* Commit the updated JSON file.

### PDF JSON

* `candidates`: list of candidate names
* `county`: name of the county if applicable
* `county_indices`: list of indices where counties list starts
* `district`: name and type ("congressional", "legislative") of the district if applicable
* `parties`: list of party names
* `skip_row_indices`: list of indices of rows to not process
* `state`: name of the state
* `type`: type of election ("presidential", "congressional", "legislative")
* `year`: year of election

```
./go extract_pdf -f path/to/pdf
```

The following generates a JSON file of the extracted PDF data and saves it to the database.

```
python build_the_list/nj_pdf.py -g
python build_the_list/nj_pdf.py -s
```

### Database

We should probably insert all strings as lowercase for consistency. There are tables such as
`district_types` that use [`citext` module](https://www.postgresql.org/docs/9.6/static/citext.html)
to internally call `lower` in queries. Consider modifying `varchar` fields to `citext` if we want
this elsewhere.

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
