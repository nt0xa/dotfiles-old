import os
import ycm_core

cxx_basedir = '/Library/Developer/CommandLineTools/usr/include/c++/v1'

commonflags = [
'-Wall',
'-Wextra',
'-Wno-long-long',
'-Wno-unused-parameter',
'-pedantic',
'-fdiagnostics-format=vi',
'-fdiagnostics-show-category=name',
]

extraflags = [
]

cppflags = [
'-I', '.',
'-I', 'include',
'-I', 'src',
'-I', 'lib',
'-I', '/System/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7',
'-I', '/System/Library/Frameworks/Ruby.framework/Versions/2.0/Headers',
'-isystem', '/usr/local/opt/openssl/include',
'-isystem', '/usr/local/opt/sqlite/include',
'-isystem', '/usr/local/include'
'-isystem', '/Library/Developer/CommandLineTools/usr/lib/clang/6.0/include'
'-isystem', '/Library/Developer/CommandLineTools/usr/include'
'-isystem', '/usr/include'
]

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
cxxflags = [
'-x', 'c++',
'-std=c++11',
'-stdlib=libc++',
'-isystem', '/Library/Developer/CommandLineTools/usr/include/c++/v1'
] + cppflags + extraflags + commonflags

cflags = cppflags + [
'-x', 'c',
'-std=c99',
'-isystem', '/System/Library/Frameworks/OpenCL.framework/Headers',
] + extraflags + commonflags

mflags = cppflags + [
'-x', 'objective-c',
'-framework', 'Cocoa',
'-framework', 'Foundation',
'-isystem', '/System/Library/Frameworks',
'-isystem', '/Library/Frameworks',
] + extraflags + commonflags

mmflags = [
'-x', 'objective-c++',
'-stdlib=libc++',
'-framework', 'Cocoa',
'-framework', 'Foundation',
'-isystem', '/System/Library/Frameworks',
'-isystem', '/Library/Frameworks',
'-isystem', '/Library/Developer/CommandLineTools/usr/include/c++/v1'
] +  cppflags + extraflags + commonflags

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c' , '.m', '.mm']

def DirectoryOfThisScript( ):
  return os.path.dirname( os.path.abspath( __file__ ) )

def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags

def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]

def IsCFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.c' ]

def IsCxxFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.cpp', '.cc', '.cxx' ]

def IsObjcFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.m' ]

def IsObjcxxFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.mm' ]

def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )

  else:
    relative_to = DirectoryOfThisScript( )
    if IsCFile( filename ):
      final_flags = MakeRelativePathsInFlagsAbsolute( cflags, relative_to )
    elif IsCxxFile( filename ):
      final_flags = MakeRelativePathsInFlagsAbsolute( cxxflags, relative_to )
    elif IsObjcFile( filename ):
      final_flags = MakeRelativePathsInFlagsAbsolute( mflags, relative_to )
    elif IsObjcxxFile( filename ):
      final_flags = MakeRelativePathsInFlagsAbsolute( mmflags, relative_to )
    else:
      final_flags = MakeRelativePathsInFlagsAbsolute( cxxflags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }