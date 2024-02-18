if status is-interactive
    sh ~/pokeTerm/pokemon.sh
    set fish_greeting

    function fish_user_key_bindings
        fish_vi_key_bindings
    end

    function fish_prompt
        echo -n  "┏ "

        set_color normal

        prompt_mode

        set_color --bold cyan 
        echo  "" $PWD
        set_color normal
        echo  "┗🢒"
    end

    function prompt_mode
        switch $fish_bind_mode
            case default
                set_color --bold magenta
                echo -n '[N]'
            case insert
                set_color --bold green
                echo -n '[I]'
            case replace_one
                set_color --bold green
                echo -n '[R]'
            case visual
                set_color --bold brmagenta
                echo -n '[V]'
            case '*'
                set_color --bold red
                echo '[?]'
        end
    end

    function fish_mode_prompt
        echo ""
    end

    function fish_right_prompt
        set last_status $status
        set_color --bold magenta 
        if test $last_status -ne 0
            echo [$last_status]" "
        end

        set_color --bold blue 
        echo (fish_git_prompt) ""

        set_color normal
    end

    # Cahnge wallpapers
    function wn
        sh ~/Wallpapers/imageSetter.sh
    end

    function wnTimer 
        while true
            sleep $argv
            wn
        end
    end

    alias ls="lsd"
end
