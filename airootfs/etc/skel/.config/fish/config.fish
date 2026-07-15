source /usr/share/cachyos-fish-config/cachyos-config.fish

# ====================================================
#          CONFIGURACIÓN OFICIAL DE MCJdOS ALPHA
# ====================================================

# 1. Intérprete de comandos estilo Minecraft para /OS*
function fish_command_not_found
    set -l cmd $argv[1]
    set -l rest $argv[2..-1]

    if string match -qr '^/OS' -- $cmd
        set -l accion (string replace -r '^/OS' '' -- $cmd | string lower)

        switch $accion
            case info help ''
                python3 /usr/local/bin/ijascd info $rest
            case search
                python3 /usr/local/bin/ijascd search $rest
            case install remove update
                sudo python3 /usr/local/bin/ijascd $accion $rest
            case mango
                mangohud --dlsym $rest
            case '*'
                echo "[ijascd] Comando desconocido en MCJdOS Alpha: /OS$accion"
        end
    else
        echo -e "\e[1;32m[<"(whoami)">]\e[0m $cmd $rest"
    end
end

# 2. Forzar que el logo ASCII se imprima al abrir la terminal
python3 /usr/local/bin/ijascd info
