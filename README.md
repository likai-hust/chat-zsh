# chat-zsh

An oh-my-zsh plugin based on chatgpt, which can translate commands described in natural language into shell commands. Just enter `## your command description want to generate` on the command line, press the Enter key to translate it into a shell command, and then press the Enter key to execute it.
# Usage
STEP 1: Clone the repository inside your oh-my-zsh repo:
```shell
git clone https://github.com/likai-hust/chat-zsh.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/chat-zsh
```

STEP 2: Append plugins and openai(or deepseek) API key、model name in your `.zshrc` file:
```
# API key
OPENAI_API_KEY="YOU_API_KEY"
```
```
# your model name, or "deepseek-chat"
MODEL_NAME="gpt-5.4-nano"
```
```
# default is https://api.openai.com/v1/chat/completions, or https://api.deepseek.com/v1/chat/completions
# OPENAI_ENDPOINT="api endpoint"
```
```
plugins=(git chat-zsh) # append chat-zsh to plugins
```

and then command `source ~/.zshrc` to enable the plugin. Type message as follow:

```
$ ## Generate a rsa key, length 2048
```
the command will be generated as:
```
$ ssh-keygen -t rsa -b 2048
```
![ezgif-1-a3f115c115](https://github.com/likai-hust/chat-zsh/assets/6956833/81ac1f7d-8b2b-4ebe-b9cf-ed0a3a48e655)
# License
See LICENSE for more information.
