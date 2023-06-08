# chat-zsh

An oh-my-zsh plugin based on chatgpt, which can translate commands described in natural language into shell commands. Just enter `# your command description want to generate` on the command line, press the Enter key to translate it into a shell command, and then press the Enter key to execute it.
# Usage
Clone the repository inside your oh-my-zsh repo:
```shell
git clone https://github.com/likai-hust/chat-zsh.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/chat-zsh
```
Append plugins and openai key in your `.zshrc` file:
```
# openai key
OPENAI_API_KEY="YOU_API_KEY"

plugins=(git chat-zsh) # append chat-zsh to plugins
```

and then command `source ~/.zshrc` to enable the plugin. Type message as follow:

```
$ # Generate an rsa key, length 2048
```
th command will be generated as:
```
$ ssh-keygen -t rsa -b 2048
```

# License
See LICENSE for more information.
