import openai
import sys


def generate_command_response(input_content, api_key):
    openai.api_key = api_key  # 替换为你的OpenAI API密钥
    model = "gpt-3.5-turbo"

    response = openai.ChatCompletion.create(
        model=model,
        messages=[
            {"role": "system", "content": "You are a senior engineer who has mastered the command line ability of natural language translation. For the natural language input by the user, it is converted into a command line command according to the description content. Output may only contain executable commands, any other descriptive or explanatory text is prohibited. For the answer, you simply output a one-line translatable command, stripping out any description preceding the command.  1. For multi-line commands, use '&' or '&&' to connect. 2. For dangerous commands, add \"dangerous\" at the beginning of the command"},
            {"role": "user", "content": "mac安装node js"},
            {"role": "assistant", "content": "brew install node"},
            {"role": "user", "content": "删除所有的文件或文件夹"},
            {"role": "assistant", "content": "DANGEROUS rm -rf *"},
            {"role": "user", "content": input_content}
        ],
        temperature=0,
    )

    command_response = response['choices'][0]['message']['content']
    return command_response


ret = generate_command_response(sys.argv[1], sys.argv[2])
print(ret)
