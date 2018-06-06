#!/bin/bash

### This is the script called by .travis.yml.
### Deployment through Travis-CI for this repository should be
### implemented here.

## Merge corpus in one file
bash ./scripts/join-documents.sh > automatic-results/corpus.conllu

## Run validate.py from UniversalDependencies/tools
git clone https://github.com/UniversalDependencies/tools.git UniversalDependencies/tools
if cat documents/CF0001.conllu| python UniversalDependencies/tools/validate.py --lang pt 2> automatic-results/validate.log ; then
    echo -e "\n\`UniversalDependencies/tools/validate.py\`: *SUCCESSFUL*" >> automatic-results/README.md ;
else
    echo -e "\n\`UniversalDependencies/tools/validate.py\`: *FAILED* -- see \`validate.log\`" >> automatic-results/README.md ;
fi

exit 0
