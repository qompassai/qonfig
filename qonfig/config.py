# /qompassai/qonfig/qonfig/config.py
# Qompass AI Qonfig Config
# Copyright (C) 2025 Qompass AI, All rights reserved
#####################################################
import yaml
import json
import os.path
from .util import string
from typing import Any


class ReadingError(Exception):
    pass

class ConfigReader:
    def __init__(self, config_file_path: str) -> None:
        self._config = self._read(config_file_path)

    def _read(self, config_file_path: str) -> Any:
        try:
            _, ext = os.path.splitext(config_file_path)
            with open(config_file_path) as fin:
                if ext == ".json":
                    data = json.load(fin)
                else:
                    data = yaml.safe_load(fin)
            return data
        except Exception as e:
            msg = string.indent_lines(str(e ))
            raise ReadingError(f"Could not read config file:\n{msg}") from e

    def get_config(self) -> Any:
        return self._config
