import sys, os
from cx_Freeze import setup, Executable

build_options = {
    "excludes": [],
    "zip_include_packages": [],
    "include_files": ["resources/","locale/"],
}

if sys.platform == "win32":
    base = "Win32GUI"
elif sys.platform == "linux":
    base = None
else:
    raise Exception("Unsupported platform: " + sys.platform)

setup(
    name = "PalEdit v0.5",
    version = "0.5",
    description = "A simple tool for editing PalWorld saves",
    options={"build_exe": build_options},
    executables=[Executable("PalEdit.py", base=base, icon="resources/MossandaIcon.ico")],
)
