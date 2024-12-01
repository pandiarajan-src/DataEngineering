locate - Command to quickly find files by searching a database rather than the actual file system. Faster than searching live.
# locate command searches file index quickly
locate recipes.txt


find - Searches the actual file system to find files matching given criteria. Slower than locate but searches live data.
# find searches live, takes longer
find . -name recipes.txt 

update DB - Updates the locate database to include latest files before searching. Needed to return newest files.
# Must updateDB first to get latest files 
sudo updatedb  
locate new-doc.txt


XARGS - Pipes find results into another command. Allows acting on search results.
# Find and delete with xargs
find . -name 'temp*' -print | xargs rm

MD find - OSX metadata search engine that indexes files for fast real-time lookups.

mkdir - Makes a new directory. Example: mkdir mydirectory

touch - Creates a new empty file. Example: touch myfile.txt

mv - Moves a file or directory. Example: mv file.txt /newlocation/file.txt

cp - Copies a file or directory. Example: cp -r mydir /backup/mydir copies mydir recursively.

rsync - Synchronizes files between directories. Example:
    rsync -av /source/dir/ /dest/dir

chmod - Changes file permissions. Example: chmod 600 file.txt

zip - Archives files into a zipped folder. Example:
    zip -r archive.zip /files/to/archive

Bash Code Examples
    zip -r archive.zip /files/to/compress


grep - searches for text patterns and outputs matching lines
cut - removes/cuts out sections from each line of files
sort - sorts the contents of a file line by line
uniq - reports or filters out repeated lines in a file
awk - pattern scanning and processing language
Example:
# grep to search for "text" in files
grep "text" file.txt

# cut to extract first 3 columns 
cut -f1-3 file.txt

# sort to sort contents of file
sort file.txt

# uniq to filter duplicate lines
uniq file.txt

# awk to print lines with more than 2 columns
awk '{if(NF>2) print $0}' file.txt

