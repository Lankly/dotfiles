alias s="sudo"
alias clipstudio="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/CELSYS/CLIP\ STUDIO\ 1.5\ EN/CLIP\ STUDIO\ PAINT/CLIPStudioPaint.exe"

export EDITOR=emacs
export TERM=xterm-256color

function fish_prompt --description 'Write out the prompt'
        # Just calculate this once, to save a few cycles when displaying the prompt
        if not set -q __fish_prompt_hostname
                set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
        end

        set -l color_cwd
        set -l suffix
        switch $USER
        case root toor
                if set -q fish_color_cwd_root
                        set color_cwd $fish_color_cwd_root
                else
                        set color_cwd $fish_color_cwd
                end
                set suffix '#'
        case '*'
                set color_cwd $fish_color_cwd
                set suffix '>'
        end

	set pwd (pwd)
	set pwd_len (expr length "$pwd")
	if math "$pwd_len" '> 64' > ~/.capture_math_output
		set pwd (prompt_pwd)
	end
	rm ~/.capture_math_output

	set git_branch "("(git branch ^/dev/null | grep \* | sed 's/* //')")"

        echo -n -s (set_color cyan) "$USER" (set_color yellow) @ (set_color purple) "$__fish_prompt_hostname" ' ' (set_color $color_cwd) "$pwd" (set_color 6a5acd) '' "$git_branch" (set_color green) "$suffix " (set_color normal)
end

function cd --description 'Change directory'
         # Skip history in subshells
         if status --is-command-substitution
            builtin cd $argv
            return $status
         end

         # Avoid set completions
         set -l previous $PWD

         if test $argv[1] = - ^/dev/null
            if test "$__fish_cd_direction" = next ^/dev/null
               nextd
            else
               prevd
            end

            return $status
         end

         builtin cd $argv[1]
         set -l cd_status $status

         if test $cd_status = 0 -a "$PWD" != "$previous"
            set -g dirprev $dirprev $previous
            set -e dirnext
            set -g __fish_cd_direction prev
         end

         ls -a

         return $cd_status
end

function fish_greeting
end

function fish_title
end