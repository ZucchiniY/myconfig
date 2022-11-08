#!/usr/bin/env python3

import pkg_resources
from subprocess import call

for dist in pkg_resources.working_set:
    package_name = dist.project_name
    call('pip3 install --upgrade {}'.format(package_name), shell=True)

print('update all success!')
