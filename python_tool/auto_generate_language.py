# -*- coding: utf-8 -*

"""
自动生成语言包
"""
import json
import os
import re
import subprocess

if __name__ == '__main__':
    command = 'flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/app_strings.dart'
    subprocess.call(command, shell=True)

    format_path = './lib/l10n/intl_{}.arb'
    message_path = format_path.format('messages')
    message_content = ""
    with open(message_path, mode='r') as f:
        content = content_zh = message_content = f.read()
        json_dict = json.loads(content)
        for key in json_dict:
            if key.startswith('@'):
                continue
            ret = re.search(r"\"" + key + "\": \"(.*)\"", content_zh)
            replace_str = ret.group()
            ret = re.search('"@{0}": '.format(key) + "{[\w\W]*?}", content_zh)
            temp_str = ret.group()
            ret = re.search(r"\"description\": \"(.*)\"", temp_str)
            description = ret.group(1)

            ret = re.search(r": \"(.*)\"", replace_str)
            t = ret.group(1)
            replace_str_new = replace_str.replace(t, description)
            content_zh = content_zh.replace(replace_str, replace_str_new)

        zh_path = format_path.format('zh')
        with open(zh_path, mode='w+') as zh_f:
            zh_f.write(content_zh)

        en_path = format_path.format('en')
        with open(en_path, mode='w+') as en_f:
            en_f.write(message_content)
    os.remove(message_path)

    path = ""
    c = "lib/l10n/"
    for root, dirs, files in os.walk(c):
        for f in files:
            if(os.path.splitext(f)[1] == '.arb'):
                path += (" " + c + f)

    command = """flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/app_strings.dart""" + path
    subprocess.call(command, shell=True)
