# /qompassai/qonfig/qonfig/context.py
# Qompass AI Qonfig Context
# Copyright (C) 2025 Qompass AI, All rights reserved
#####################################################
import copy


class Context(object):
    """
    Contextual data and information for plugins.
    """

    def __init__(self, base_directory):
        self._base_directory = base_directory
        self._defaults = {}
        pass

    def set_base_directory(self, base_directory):
        self._base_directory = base_directory

    def base_directory(self):
        return self._base_directory

    def set_defaults(self, defaults):
        self._defaults = defaults

    def defaults(self):
        return copy.deepcopy(self._defaults)
