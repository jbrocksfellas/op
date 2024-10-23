#!/bin/bash

pyinstaller --onefile --clean op.py
rm -rf build
rm op.spec
