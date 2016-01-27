import os
import ycm_core

# ================
# = Common flags =
# ================

common_flags = [
    '-Wall',
    '-Wextra',
    '-Wno-long-long',
    '-Wno-unused-parameter',
    '-pedantic',
    '-fdiagnostics-format=vi',
    '-fdiagnostics-show-category=name',
]

# ============
# = Includes =
# ============

project_includes = [
    '-I', '.',
    '-I', './include',
    '-I', '../include',
    '-I', '../../include',
]

system_includes = [
    '-isystem', '/usr/include',
    '-isystem', '/usr/local/include'
]

include_flags = system_includes + project_includes

# =============
# = C++ flags =
# =============

cxxflags = [
    '-x', 'c++',
    '-std=c++11',
    '-stdlib=libc++'
    '-isystem', '/usr/include/c++'
] + include_flags + common_flags

# ===========
# = C flags =
# ===========

cflags = [
    '-x', 'c',
    '-std=c99',
] + include_flags + common_flags

SOURCE_EXTENSIONS = ['.c', '.cpp', 'cxx', 'cc']

def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))

def DirectoryOfFile(filename):
    return os.path.dirname(filename)

def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/') and not flag.startswith('~'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append( new_flag )
    return new_flags

def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in ['.h', '.hxx', '.hpp', '.hh']

def IsCFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in ['.c']

def IsCxxFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in ['.cpp', '.cc', '.cxx']

def FlagsForFile(filename, **kwargs):
    relative_to = DirectoryOfFile(filename)
    if IsCFile(filename):
        final_flags = MakeRelativePathsInFlagsAbsolute(cflags, relative_to)
    elif IsCxxFile(filename):
        final_flags = MakeRelativePathsInFlagsAbsolute(cxxflags, relative_to)
    else:
        final_flags = MakeRelativePathsInFlagsAbsolute(cflags, relative_to)

    return {
        'flags': final_flags,
        'do_cache': True
    }
