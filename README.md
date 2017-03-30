# build-the-list

Build the most exhaustive list of campaigns down to the district level.

## Prerequisites

* Python 2.7 (should be installed)
* [Homebrew](https://brew.sh/)
* [Postgresql](https://www.postgresql.org/)

## Installation

```
./bin/install
```

## Running

```
python pdf_etl/pdf_extract.py -f resources/sample_presidential_nj.pdf
```

## Tests

```
pytest tests/
```
