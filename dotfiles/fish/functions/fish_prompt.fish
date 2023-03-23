function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal -o)
    set -l status_color (set_color brgreen -o)
    set -l cwd_color (set_color $fish_color_cwd -o)
    set -l vcs_color (set_color brpurple -o)
    set -l prompt_status ""

    set -l orange (set_color "fe8019" -o)
    set -l green (set_color "b8bb26" -o)
    set -l white (set_color "ebdbb2" -o)

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root -o)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error -o)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    echo -s $orange (whoami) $white '@' $orange (prompt_hostname) ' ' $green (prompt_pwd) $vcs_color (fish_vcs_prompt)
    echo -n -s $status_color $suffix ' ' $normal
end
