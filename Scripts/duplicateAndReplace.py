#!/usr/bin/env python3
import glob
import os
import shutil
import errno
import fileinput

pathToDuplicate = None
textToSearch = None
textToReplace = None

def ignoreFunc(dir, files):
    return [file for file in files if os.path.isfile(os.path.join(dir, file))]

def duplicate(path, textToSearch, textToReplace):
    newName = path.replace(textToSearch, textToReplace)
    try:
        shutil.copytree(path, newName, ignore=ignoreFunc)
    except OSError as err:
        if err.errno == errno.ENOTDIR:
            shutil.copy(path, newName)
        else:
            print("Error: % s" % err)
    print('Created: ' + newName)
    if os.path.isfile(newName):
        replace(newName, textToSearch, textToReplace)

def replace(path, textToSearch, textToReplace):
    with fileinput.FileInput(path, inplace=True) as file:
        for line in file:
            print(line.replace(textToSearch, textToReplace), end='')

pathToDuplicate = input("Insert path you want duplicate: ").strip()
textToSearch = input("Insert text you want search: ").strip()
textToReplace = input("Insert text you want use to replace: ").strip()

duplicate(pathToDuplicate, textToSearch, textToReplace)

for path in glob.iglob(pathToDuplicate + '/**/*', recursive = True):
    duplicate(path, textToSearch, textToReplace)
