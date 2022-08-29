#!/usr/bin/env python

"""
Test version of genworldconf.py tool for GRS:

1. read packages from a running system -> app-portage/portage-utils
2. find overlays and installed packages -> cat/name:slot
3. put all the pkgs and pkg.foo items in a ConfigObj
4. write the initial world.conf file
"""

import logging
import subprocess as sp
import sys

from configparser import ConfigParser
from optparse import OptionParser  # pylint: disable=W0402
from pathlib import Path
from shlex import split
from shutil import which


VERSION = '0.0.0'
CONFIG_FILE = 'world.conf'


def check_for_qlist():
    """
    Make sure we can find the ``qlist``  binary in the
    user environment and return a path string.

    :return qlist_path: program path string
    :rtype str: path to program if found, else None
    """
    qlist_path = which('qlist')
    if not qlist_path:
        logging.error('Cannot continue, no path found for qlist')
        sys.exit(1)
    return qlist_path


def qlist_overlays():
    """
    Get a list of (external) overlays from installed packages.

    :return overlays: list of overlay names
    """
    output = set()
    overlays = []
    excludes = ['gentoo', 'portage', 'crossdev']
    qlist_cmd = check_for_qlist()
    qlist_overlays = f'{qlist_cmd} -ICSR'
    logging.debug('Overlay cmd: %s', qlist_overlays)
    full_output = sp.check_output(split(qlist_overlays), text=True).splitlines()
    for line in full_output:
        reponame = line.split(sep='::')[1]
        for item in excludes:
            if item not in reponame and reponame not in excludes:
                output.add(reponame)
    overlays = list(output)
    logging.debug('Overlay list: %s', overlays)
    return overlays


def qlist_section_use():
    """
    Get text blobs with package atoms and use flags.

    :return tuple: package atoms and atoms with use flags
    """
    qlist_cmd = check_for_qlist()
    qlist_atm = f'{qlist_cmd} -ICS'
    qlist_use = f'{qlist_cmd} -ICSU'
    atoms = sp.check_output(split(qlist_atm), text=True).splitlines()
    atoms_use = sp.check_output(split(qlist_use), text=True).splitlines()
    logging.debug('Cmd returned %s package atoms', len(atoms_use))
    return atoms, atoms_use


def set_config():
    """
    Setup config object.

    :return config: ConfigParser config object
    """
    pkg_atoms, use_flags = qlist_section_use()
    config = ConfigParser(delimiters=(':'), interpolation=None)
    for atom, line in zip(pkg_atoms, use_flags):
        config.add_section(atom)
        if not atom == line:
            new_atm = trim_flags(line.split(maxsplit=1))
            if len(new_atm) > 1:
                config.set(atom, 'package.use', ' '.join(new_atm))
    return config


def trim_flags(uses):
    """
    Trim use flags returned from qlist, starting with python_* flags.

    :param uses: list of atom and use flags
    :return new_uses: trimmed list of use flags
    """
    markers = ['python_', 'abi_', 'l10n_']
    for word in markers:
        for item in uses:
            if word in item:
                uses.remove(item)
    return uses


def write_config(config):
    """
    Write config object to a file in the current directory.

    param config: ConfigParser config object
    """
    with open(CONFIG_FILE, "w") as configfile:
        config.write(configfile)


def main(argv=None):
    """
    Generate a basic world.conf file.
    """
    if argv is None:
        argv = sys.argv

    parser = OptionParser(usage="usage: %prog [options]", version=f"%prog {VERSION}")
    parser.description = 'Create local GRS world.conf files to start new branches.'
    parser.add_option(
        "-q",
        "--quiet",
        action="store_true",
        dest="quiet",
        help="suppress output from qlist command",
    )
    parser.add_option(
        "-v",
        "--verbose",
        action="store_true",
        dest="verbose",
        help="display more logging info",
    )

    (opts, _) = parser.parse_args()

    # basic logging setup must come before any other logging calls
    log_level = logging.DEBUG if opts.verbose else logging.INFO
    logging.basicConfig(stream=sys.stdout, level=log_level)

    ovrl_list = qlist_overlays()
    cfg = set_config()
    write_config(cfg)


if __name__ == '__main__':
    main()
