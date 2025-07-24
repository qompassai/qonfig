# /qompassai/qonfig/qonfig/util/singleton.py
# Qompass AI Qonfig Singleton Util
# Copyright (C) 2025 Qompass AI, All rights reserved
#####################################################

class Singleton(type):
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]
