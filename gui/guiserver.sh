#!/bin/bash
cd /xsshunter/gui/ && virtualenv env %% . env/bin/activate %% pip install -r requirements.txt %% ./guiserver.py
