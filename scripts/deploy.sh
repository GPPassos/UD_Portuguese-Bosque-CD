#!/bin/bash

### This is the script called by .travis.yml.
### Deployment through Travis-CI for this repository should be
### implemented here.

## Merge corpus in one file
bash ./scripts/join-documents.sh > automatic-results/corpus.conllu

## Run validate.py from UniversalDependencies/tools
git clone https://github.com/UniversalDependencies/tools.git UniversalDependencies/tools
cat documents/CF0001.conllu| python UniversalDependencies/tools/validate.py --lang pt > automatic-results/validate.log
