#!/bin/bash

DIR="$(mktemp -d)"
claat export -o $DIR walkthrough.md

cp $DIR/sym_okta_quickstart/index.html $DIR/sym_okta_quickstart/codelab.json .
