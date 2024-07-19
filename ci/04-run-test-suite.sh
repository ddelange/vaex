#!/bin/bash
set -e

if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
elif [ -f ${HOME}/.bash_profile ]; then
    source ${HOME}/.bash_profile
fi
export VAEX_SERVER_OVERRIDE='{"dataframe.vaex.io":"dataframe-dev.vaex.io"}'
pytest tests\
        packages/vaex-core/vaex/datatype_test.py\
        packages/vaex-core/vaex/file/\
        vaex.test.dataset::TestDataset\
        --doctest-modules\
            packages/vaex-core/vaex/datatype.py\
            packages/vaex-core/vaex/utils.py\
            packages/vaex-core/vaex/struct.py\
            packages/vaex-core/vaex/groupby.py\
        --timeout=1000
