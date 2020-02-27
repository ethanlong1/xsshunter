#!/bin/bash
cd xsshunter/api/ && virtualenv env && . env/bin/activate && pip install -r requirements.txt && ./apiserver.py
