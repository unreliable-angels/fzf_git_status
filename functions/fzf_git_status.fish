function fzf_git_status -d "fzf source to select from git status"
    git status --porcelain | fzf \
      | awk -F ' ' '{print $NF}' | read filename

    if test -n "$filename"
        commandline -i "$filename"
    end
end