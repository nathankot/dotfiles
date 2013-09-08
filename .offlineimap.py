#!/usr/bin/python

import re, subprocess
from subprocess import call

def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Users/nathan/Library/Keychains/login.keychain',
    }
    command = "%(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)

class NameMapping:
  def __init__(self, local_name, remote_name):
    self.local_name = local_name
    self.remote_name = remote_name

class LocalName:
  def __init__(self, folder):
    self.folder = folder

  def matches(self, mapping):
    return mapping.remote_name == self.folder

  def mapped_folder_name(self, mapping):
    return mapping.local_name

class RemoteName:
  def __init__(self, folder):
    self.folder = folder

  def matches(self, mapping):
    return mapping.local_name == self.folder

  def mapped_folder_name(self, mapping):
    return mapping.remote_name

def is_included(folder):
  result = True

  for pattern in exclusion_patterns:
    result = result and (re.search(pattern, folder) == None)

  return result

def find_name_mapping(name):
  default_mapping = NameMapping(name.folder, name.folder)

  for mapping in name_mappings:
    if (name.matches(mapping)):
      return mapping

  return default_mapping

def get_name_mapping(name):
  mapping = find_name_mapping(name)
  return name.mapped_folder_name(mapping)

def get_remote_name(local_folder_name):
  name = RemoteName(local_folder_name)
  return get_name_mapping(name)

def get_local_name(remote_folder_name):
  name = LocalName(remote_folder_name)
  return get_name_mapping(name)

exclusion_patterns = [
  "important",
  "spam",
  "trash"
]

name_mappings = [
  NameMapping('sent', '[Gmail]/Sent Mail'),
  NameMapping('spam', '[Gmail]/Spam'),
  NameMapping('important', '[Gmail]/Important'),
  NameMapping('starred', '[Gmail]/Starred'),
  NameMapping('trash',   '[Gmail]/Trash'),
  NameMapping('archive', '[Gmail]/All Mail'),
  NameMapping('drafts', '[Gmail]/Drafts')
]
