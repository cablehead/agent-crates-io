# agent: crates.io

## To get started

```
curl -L https://static.crates.io/db-dump.tar.gz | gunzip -c | tar xvf -
```

## Contents

- get-embedding.sh: get a text-embedding-ada-002 embedding for content on stdin
- q*.sql: some sql queries to use with duckdb, beginning to expore the csv data

## Resources

- https://crates.io/data-access
- To explore the csv files:
    - https://duckdb.org
    - https://github.com/jqnatividad/qsv#qsv-ultra-fast-csv-data-wrangling-toolkit

- https://github.com/kamu-data/kamu-cli/ ## Mike I'm curious if we could ingest the crates.io csv files into this tool
    - New generation decentralized data warehouse and streaming data pipeline
    - ~/.local/bin/kamu

## Method

- generate a csv file that's a summary of all crate information
- text-embedding-ada-002: used for generated embeddings
- turn user prompt into an embedding
- table scan to find best matches

