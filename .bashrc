#Veränderter Prompt mit [Tag:Stunde'h'Minute]user@host:verzeichnis $
# Last command successfull > normal prompt else ugly color!
PROMPT_COMMAND='if [ $? = 0 ]; then
PS1="\[\e[0;33m\][\D{%d:%Hh%M}]\[\e[1;32m\]\u\[\e[1;31m\]@\h:\[\e[0;33m\]\w\[\e[0;37m\]\$ " ; else 
PS1="\[\e[1;35m\][\D{%d:%Hh%M}]\[\e[1;32m\]\u\[\e[1;31m\]@\h:\[\e[0;33m\]\w\[\e[0;37m\]\$ " ; fi'
export PROMPT_COMMAND

export PATH=$PATH:/home/koh/bin/

# use aliases file if present
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


