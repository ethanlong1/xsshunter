#!/bin/bash
cd xsshunter/api/ && virtualenv env && . env/bin/activate && pip install -r requirements.txt && /usr/bin/python2.7 ./apiserver.py
