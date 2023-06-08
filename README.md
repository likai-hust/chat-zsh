# chat-zsh

An oh-my-zsh plugin based on chatgpt, which can translate commands described in natural language into shell commands. Just enter `# your command description want to generate` on the command line, press the Enter key to translate it into a shell command, and then press the Enter key to execute it.
# Usage
STEP 1: Clone the repository inside your oh-my-zsh repo:
```shell
git clone https://github.com/likai-hust/chat-zsh.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/chat-zsh
```
STEP 2: Install jq moudle for parse json.
```
brew install jq
```

STEP 2.1(optional) Install openai python module(python mode, default mode is call openai through curl).
```
pip install openai
```
STEP 3: Append plugins and openai key in your `.zshrc` file:
```
# openai key
OPENAI_API_KEY="YOU_API_KEY"
# OPENAI_ENDPOINT="openai_proxy" # for chinese user, can use an proxy api :https://api.openai-proxy.com/v1/chat/completions, see https://www.openai-proxy.com

plugins=(git chat-zsh) # append chat-zsh to plugins
```

and then command `source ~/.zshrc` to enable the plugin. Type message as follow:

```
$ # Generate a rsa key, length 2048
```
th command will be generated as:
```
$ ssh-keygen -t rsa -b 2048
```
![ezgif-1-a3f115c115](https://github.com/likai-hust/chat-zsh/assets/6956833/81ac1f7d-8b2b-4ebe-b9cf-ed0a3a48e655)
# License
See LICENSE for more information.
