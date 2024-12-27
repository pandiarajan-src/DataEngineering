import os

CURR_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT_FILE = os.path.join(CURR_SCRIPT_DIR, "large_files.py")


with open(OUTPUT_FILE, 'w', encoding='UTF-8') as _files:
    _files.write('files = [\n')

with open(OUTPUT_FILE, 'a', encoding='UTF-8') as _files:

    for root, directories, files in os.walk('/Users/pandi/source/DataEngineering'):
        for _file in files:
            try:
                full_path = os.path.join(root, _file)
                size = os.path.getsize(full_path)
            except (FileNotFoundError,PermissionError):
                continue
            _files.write(f"('{full_path}', {size}),\n")

    _files.write(']')
