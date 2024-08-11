# Rename_tool
A batch renamed bat tool.

[English](README.md) • [中文](README_ZH.md)

# Using

This program supports direct startup and command invocation.
Example command:<br>
`Rename_tool.bat oldname*.txt newname-d.txt 0012`

## Direct call
You can modify the code parameters to adjust the running state.
Parameter|Eexplain
----|----
old_name_default|The old file name matches the condition
new_name_default|The new filename structure <br>`-d` is the padded number
number_length_default|The length of the number, when the length is insufficient, add `0` in front, the number starts from `0`, and when you need to start from the specified array, please use the command to invoke
rules_chack|Wait for confirmation condition, wait for confirmation when it is `1`
rename_chack|Wait for the preview of the renaming result, wait for confirmation when it is `1`, and enable it when you want to view the result when you call it directly
## Command invocation
Parameter|Eexplain
----|----
The first parameter|The matching conditions of the old file are the same as those of the command line matching rules
The second parameter|New filename condition, where `-d` is the numeric position
The third parameter|Number rules, starting digits, e.g. `0012`
