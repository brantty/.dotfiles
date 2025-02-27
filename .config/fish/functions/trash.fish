#!/usr/bin/env fish

function trash --description "Move files/folders to the macOS trash"
    if test (count $argv) -eq 0
        echo >&2 "Usage: trash <files>"
        return 1
    end

    if test (uname -s) != Darwin
        echo >&2 "trash: macOS not detected."
        return 1
    end

    set --local file
    set --local files
    for file in $argv
        if test -e $file
            set -a files "the POSIX file \""(path resolve $file)"\""
        else
            echo >&2 "trash: No such file or directory '$file'."
            return 1
        end
    end

    if test (count $files) -eq 0
        echo >&2 'usage: trash <files...>'
        return 64 # match rm's return code
    end

    osascript 2>&1 >/dev/null -e "tell app \"Finder\" to move { "(string join ", " $files)" } to trash"
end
