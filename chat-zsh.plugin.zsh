# After entering "# command described in natural language", press the Enter key, and the translated shell command will be displayed on the next line

# python script to call open ai(for chinese user, which terminal is hard to be proxy)
function prompt_to_command() {
  local output=$(python ~/.oh-my-zsh/custom/plugins/chat-zsh/text2command.py "$1" "$OPENAI_API_KEY")
  echo "$output"
}

# curl call open ai(recommand)
function generate_command_response() {
  command_desc="$1"
  endpoint="$2"
  api_key="$3"

  # Send the request to the API
  response=$(curl --location -s $endpoint \
    --header "Authorization: Bearer $api_key" \
    --header "Content-Type: application/json" \
    --data "{
    \"model\": \"gpt-3.5-turbo\",
    \"messages\": [
        {\"role\": \"system\", \"content\": \"You are a senior engineer who has mastered the command line ability of natural language translation. For the natural language input by the user, it is converted into a command line command according to the description content. Output may only contain executable commands, any other descriptive or explanatory text is prohibited. For the answer, you simply output a one-line translatable command, stripping out any description preceding the command.  1. For multi-line commands, use '&' or '&&' to connect. 2. For dangerous commands, add \\\"dangerous\\\" at the beginning of the command\"},
            {\"role\": \"user\", \"content\": \"mac安装node js\"},
            {\"role\": \"assistant\", \"content\": \"brew install node\"},
            {\"role\": \"user\", \"content\": \"删除所有的文件或文件夹\"},
            {\"role\": \"assistant\", \"content\": \"DANGEROUS rm -rf *\"},
            {\"role\": \"user\", \"content\": \"$command_desc\"}
    ],
    \"temperature\": 0,
    \"stream\": false
}")
  # Extract the content field from the response
  content=$(echo $response | jq -r '.choices[0].message.content')

  # Return the content
  echo "$content"
}

function prompt_to_command_sh() {
  local endpoint="https://api.openai.com/v1/chat/completions"
  # specially provided for users who cannot directly access openai, for example use a proxy endpoint
  if [[ -n $OPENAI_ENDPOINT ]]; then
    endpoint=$OPENAI_ENDPOINT
  fi
  echo $(generate_command_response "$1" "$endpoint" "$OPENAI_API_KEY")
}

function zsh_line_finish() {
  local buffer=$BUFFER
  local first_letter="${buffer:0:1}"
  local remaining="${buffer:1}"
  if [[ -n $buffer && $first_letter = '#' ]]; then
    local new_str
    # curl default
    new_str=$(prompt_to_command_sh "$remaining")
    zle -U "$new_str"
    zle accept-line
  else
    zle accept-line
  fi
}
zle -N zsh_line_finish

bindkey '^M' zsh_line_finish
