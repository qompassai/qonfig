#!/usr/bin/env python3
# /qompassai/qonfig/setup.py
# Qompass AI Qonfig Python Setup
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
from setuptools import setup, find_packages


def readme():
    with open('README.md', 'r', encoding='utf-8') as f:
        return f.read()


setup(
    name='qonfig',
    version='0.1.0',
    description='Quantum AI models for healthcare and education',
    long_description=readme(),
    long_description_content_type='text/markdown',
    license_files=['LICENSE-AGPL', 'LICENSE-QCDA'],
    author='Matt A. Porter',
    author_email='map@qompass.ai',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Programming Language :: Python :: Implementation :: CPython',
        'Programming Language :: Python :: Implementation :: PyPy',
    ],
    packages=find_packages(where='lib'),
    package_dir={'': 'lib'},
    install_requires=['pyyaml'],
    extras_require={
        'test': ['pytest>=8.0'],
    },
    entry_points={
        'console_scripts': [
            'qonfig=qonfig.cli:main',
        ],
    },
    include_package_data=True,
    readme='README.md',
)
