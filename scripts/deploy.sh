#!/bin/bash

### This is the script called by .travis.yml.
### Deployment through Travis-CI for this repository should be
### implemented here.
OUTPUT_DIR="./automatic-results"

## Merge corpus in one file
bash ./scripts/join-documents.sh > $OUTPUT_DIR/corpus.conllu

## Run validate.py from UniversalDependencies/tools
echo -e "## Validation results: ##\n"

git clone https://github.com/UniversalDependencies/tools.git UniversalDependencies/tools

if cat documents/CF0001.conllu| python UniversalDependencies/tools/validate.py --lang pt 2> $OUTPUT_DIR/validate.log ; then
    echo -e "\n  * \`UniversalDependencies/tools/validate.py\`: **SUCCESSFUL**" >> $OUTPUT_DIR/README.md ;
else
    echo -e "\n  * \`UniversalDependencies/tools/validate.py\`: **FAILED** -- see \`validate.log\`" >> $OUTPUT_DIR/README.md ;
fi

## Run conllu-stats.pl in order to produce stats.xml file
cat $OUTPUT_DIR/corpus.conllu | perl UniversalDependencies/tools/conllu-stats.pl > $OUTPUT_DIR/stats.xml

