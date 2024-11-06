for line in (sh -c "source ~/.profile && env" | grep '=')
    set --local env (string split '=' $line)
    set --local name $env[1]
    set --local value $env[2]

    if not contains -- $name PWD SHLVL _
        set -x $name $value
    end
end