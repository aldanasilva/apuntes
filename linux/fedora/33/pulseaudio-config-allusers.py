path = "/etc/pulse/"

files = [
    "default.pa",
    "system.pa"
]

for file in files:
    #
    with open(path + file, 'r') as f:
        content = f.readlines()
    #content = [x.strip() for x in content] # strip() es como usar trim() en java, y está también lstrip() y rstrip()
    # https://stackoverflow.com/questions/3277503/how-to-read-a-file-line-by-line-into-a-list

    #
    for idx, val in enumerate(content):
        if val == "load-module module-suspend-on-idle\n":
            content[idx] = "#" + val
            print(path + file + " - Line " + str(idx) + " commented.")
    # https://stackoverflow.com/questions/522563/accessing-the-index-in-for-loops

    #
    with open(path + file, 'w') as f:
        f.writelines(content)
    # https://stackoverflow.com/questions/4719438/editing-specific-line-in-text-file-in-python

# https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files

print("pulseaudio configured. You must restart pulse audio with pulseaudio -k and pulseaudio --start")