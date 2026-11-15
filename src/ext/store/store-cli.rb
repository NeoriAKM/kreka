#!/usr/bin/env ruby

require 'yaml'

mode = 1

while true
    if mode == 1
        shell = "\033[1;32m[\033[0mCOMMAND MODE\033[1;32m]\033[0m kreka-store \033[35m>\033[0m "
    elsif mode == 2
        shell = "\033[1;34m[\033[0mDOWNLOAD MODE\033[1;34m]\033[0m kreka-store \033[35m>\033[0m "
    elsif mode == 3
        shell = "\033[1;31m[\033[0mREMOVE MODE\033[1;31m]\033[0m kreka-store \033[35m>\033[0m "
    end

    print shell
    input = gets&.chomp

    break if input == 'exit' || input == 'e'

    case input
    when 'd', 'download'
        mode = 2
    when 'r', 'remove'
        mode = 3
    when '', nil
        nil
    else
        puts "\033[41m Unknown mode. \033[0m"
    end
end