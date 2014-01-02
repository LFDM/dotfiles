# encoding: utf-8

import sys
import re
import os

def convert_snippet_contents(content):
    " If the snippet contains snipmate style substitutions, convert them to ultisnips style "
    content = re.sub("`([^`]+`)", "`!v \g<1>", content)
    return content

# convert a snipmate .snippet lines to UltiSnips
def convert_snippet_lines(name, lines):
    """ One file per filetype """
    line_nr = 0
    errors = []
    # can only read vars in local functions, thus introduce dummy dictionary
    scope = {'snippet' : "", 'state' : 'none', 'retval' : ''}

    def end_snippet():
        if scope['state'] in ["in_snippet",'get_ind']:
            scope['retval'] += convert_snippet_contents(scope['snippet'])
            scope['retval'] += "endsnippet\n\n"
        scope['state'] = "none"

    for line in lines:
        line_nr += 1

        def err(msg):
            errors.append({'filename': name, 'lnum': line_nr, 'text' : msg})

        # # Ignore empty lines
        # if line.strip() == "":
        #     continue

        m = re.match("snippet[ \t]+(.*)", line)
        if m:
            # snippet start detected

            end_snippet()

            scope['snippet'] = ""
            snippet_info = re.match("(\S+)\s*(.*)", m.group(1))
            if not snippet_info:
                err("Warning: Malformed snippet")
            else:
                # replace " by empty because UltiSnips does not support snipppet Dir[".."], quoting by \ does not work
                label =  (snippet_info.group(2) if snippet_info.group(2) else snippet_info.group(1)).replace("\"","")
                scope['retval'] += 'snippet %s "%s"' % (snippet_info.group(1), label ) + "\n"
                scope['state'] = "get_ind"
            continue

        if line[:1] == "#":
            # first col comments are always outside of snippets, so this comment
            # belongs to the following snippet:
            if (scope['state'] == "in_snippet"):
                end_snippet()

            # comment, keep as is
            scope['retval'] += line
            continue

        if scope['state'] == "get_ind":
            # First line of snippet: Get indentation
            whitespace = re.search("^\s+", line)
            if not whitespace:
                err("Warning: Malformed snippet, content not indented.")
                scope['retval'] += "\n\n"
                scope['state'] = "none"
            else:
                whitespace = whitespace.group(0)
                scope['state'] = "in_snippet"

        if scope['state'] == "in_snippet":
            line = content = re.sub("{VISUAL}", "${VISUAL}", line)
            if line == "\n": scope['snippet'] += "\n"
            else: scope['snippet'] += line[len(whitespace):]

    end_snippet()

    return [scope['retval'], errors]
