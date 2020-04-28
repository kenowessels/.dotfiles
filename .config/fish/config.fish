
# config alias for .dotfile config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'





### Aliases

## Git

# Remove old local-branches
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop)" | xargs -n 1 git branch -d'

## Docker 

# Docker Compose Start & Stop
alias dup='docker-compose up -d'
alias dstop='docker-compose stop'

# Docker Compose Execute
alias dex='docker-compose exec'

# Docker Compose execute composer inside php-fpm 
alias dexcomposer='docker-compose exec php-fpm composer'

# Docker Compose execute artisan inside php-fpm
alias dexartisan='docker-compose exec php-fpm php artisan'
