#!/bin/bash
# submodule in the first level
git submodule foreach git submodule init
git submodule foreach git submodule update
# submodule in the second level
git submodule foreach git submodule foreach git submodule init
git submodule foreach git submodule foreach git submodule update

