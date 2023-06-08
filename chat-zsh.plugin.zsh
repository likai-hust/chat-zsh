# After entering "# command described in natural language", press the Enter key, and the translated shell command will be displayed on the next line

function prompt_to_command() {
  local output=$(python ~/.oh-my-zsh/custom/plugins/chat-zsh/text2command.py "$1" "$OPENAI_API_KEY")
  echo "$output"
}

function zsh_line_finish() {
  local buffer=$BUFFER
  local first_letter="${buffer:0:1}"
  local remaining="${buffer:1}"
  if [[ -n $buffer && $first_letter = '#' ]]; then
    local new_str
    new_str=$(prompt_to_command "$remaining")
    zle -U "$new_str"
    zle accept-line
  else
    zle accept-line
  fi
}
zle -N zsh_line_finish

bindkey '^M' zsh_line_finish
