# /qompassai/qonfig/qonfig/util/compat.py
# Qompass AI Qonfig Compatibility Util
# Copyright (C) 2025 Qompass AI, All rights reserved
#####################################################

def with_metaclass(meta, *bases):
    class metaclass(meta):
        def __new__(cls, name, this_bases, d):
            return meta(name, bases, d)
    return type.__new__(metaclass, 'temporary_class', (), {})
