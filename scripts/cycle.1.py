#!/usr/bin/python3.4

from portage import settings
from grs.Execute import Execute

use_flags = '-* bindist build %s' % settings['BOOTSTRAP_USE']
subchroot = '/tmp/stage1root'
cpu_flags = 'mmx sse sse2'
emerge_env = { 'USE' : use_flags, 'ROOT' : subchroot, 'CPU_FLAGS_X86' : cpu_flags }
cmd = 'emerge -bkNu1q sys-apps/baselayout'
Execute(cmd, timeout=600, extra_env=emerge_env)
