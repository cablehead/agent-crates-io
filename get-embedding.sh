#!/usr/bin/env bash

set -euo pipefail

jo model=text-embedding-ada-002 input="$(cat)" |
    curl https://api.openai.com/v1/embeddings \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d @-
