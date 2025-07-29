#!/usr/bin env python3
# /qompassai/qonfig/setup.py
# Qompass AI Qonfig Python Setup
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
from setuptools import setup, find_packages

setup(
    name="qonfig",
    version="0.1.0",
    packages=find_packages(where="lib"),
    package_dir={"": "lib"},
    install_requires=["pyyaml"],
    entry_points={
        "console_scripts": [
            "qonfig=qonfig.__main__:main",
        ],
    },
)
