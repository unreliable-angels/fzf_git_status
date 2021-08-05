function fzf_git_status -d "fzf source to select from git status"
    git rev-parse --is-inside-work-tree >/dev/null 2>&1

    if not test $status -eq 0
        command echo 'fzf_git_status: Not a git repository'
        commandline -f execute
        return
    end

    git status --porcelain | fzf \
      | awk -F ' ' '{print $NF}' | read filename

    if test -n "$filename"
        commandline -i "$filename"
    end
end
