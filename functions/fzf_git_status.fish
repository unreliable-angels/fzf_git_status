function fzf_git_status -d "fzf source to select from git status"
    git rev-parse --is-inside-work-tree >/dev/null ^/dev/null

    if not test $status -eq 0
        return
    end

    git status --porcelain | fzf \
      | awk -F ' ' '{print $NF}' | read filename

    if test -n "$filename"
        commandline -i "$filename"
    end
end
