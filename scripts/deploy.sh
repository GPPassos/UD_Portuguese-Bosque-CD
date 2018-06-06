#!/bin/bash

### This is the script called by .travis.yml.
### Deployment through Travis-CI for this repository should be
### implemented here.

bash ./scripts/join-documents.sh > automatic-results/corpus.conllu
