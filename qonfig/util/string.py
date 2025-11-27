# /qompassai/qonfig/qonfig/util/string.py
# Qompass AI Qonfig String Util
# Copyright (C) 2025 Qompass AI, All rights reserved
#####################################################

def indent_lines(string, amount=2, delimiter='\n'):
    whitespace = ' ' * amount
    sep = '%s%s' % (delimiter, whitespace)
    return '%s%s' % (whitespace, sep.join(string.split(delimiter)))
