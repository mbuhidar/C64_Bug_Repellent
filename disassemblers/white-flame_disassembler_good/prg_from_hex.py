#! /usr/bin/python3

import argparse
from argparse import RawTextHelpFormatter
from os import path
import re
import sys

# Dictionary for special character conversion from ahoy to petcat
AHOY_TO_PETCAT = {
    "{SC}": "{clr}",
    "{HM}": "{home}",
    "{CU}": "{up}",
    "{CD}": "{down}",
    "{CL}": "{left}",
    "{CR}": "{rght}",
    "{SS}": "{$a0}",
    "{IN}": "{inst}",
    "{RV}": "{rvon}",
    "{RO}": "{rvof}",
    "{BK}": "{blk}",
    "{WH}": "{wht}",
    "{RD}": "{red}",
    "{CY}": "{cyn}",
    "{PU}": "{pur}",
    "{GN}": "{grn}",
    "{BL}": "{blu}",
    "{YL}": "{yel}",
    "{OR}": "{orng}",
    "{BR}": "{brn}",
    "{LR}": "{lred}",
    "{G1}": "{gry1}",
    "{G2}": "{gry2}",
    "{LG}": "{lgrn}",
    "{LB}": "{lblu}",
    "{G3}": "{gry3}",
    "{F1}": "{f1}",
    "{F2}": "{f2}",
    "{F3}": "{f3}",
    "{F4}": "{f4}",
    "{F5}": "{f5}",
    "{F6}": "{f6}",
    "{F7}": "{f7}",
    "{F8}": "{f8}",
}
                  
# Core Commodore BASIC tokens
CORE_TOKENS = (
    ('end',     128),
    ('for',     129),
    ('next',    130),
    ('data',    131),
    ('input#',  132),
    ('input',   133),
    ('dim',     134),
    ('read',    135),
    ('let',     136),
    ('goto',    137),
    ('run',     138),
    ('if',      139),
    ('restore', 140),
    ('gosub',   141),
    ('return',  142),
    ('rem',     143),
    ('stop',    144),
    ('on',      145),
    ('wait',    146),
    ('load',    147),
    ('save',    148),
    ('verify',  149),
    ('def',     150),
    ('poke',    151),
    ('print#',  152),
    ('print',   153),
    ('cont',    154),
    ('list',    155),
    ('clr',     156),
    ('cmd',     157),
    ('sys',     158),
    ('open',    159),
    ('close',   160),
    ('get',     161),
    ('new',     162),
    ('tab(',    163),
    ('to',      164),
    ('fn',      165),
    ('spc(',    166),
    ('then',    167),
    ('not',     168),
    ('step',    169),
    ('+',       170),
    ('-',       171),
    ('*',       172),
    ('/',       173),
    ('^',       174),
    ('and',     175),
    ('or',      176),
    ('>',       177),
    ('=',       178),
    ('<',       179),
    ('sgn',     180),
    ('int',     181),
    ('abs',     182),
    ('usr',     183),
    ('fre',     184),
    ('pos',     185),
    ('sqr',     186),
    ('rnd',     187),
    ('log',     188),
    ('exp',     189),
    ('cos',     190),
    ('sin',     191),
    ('tan',     192),
    ('atn',     193),
    ('peek',    194),
    ('len',     195),
    ('str$',    196),
    ('val',     197),
    ('asc',     198),
    ('chr$',    199),
    ('left$',   200),
    ('right$',  201),
    ('mid$',    202),
    ('go',      203),
)

global TOKENS_V2
TOKENS_V2 = CORE_TOKENS # case for Commodore BASIC v2. TODO: Add versions

# Tokens for special character designations used by petcat
PETCAT_TOKENS = (
    ('{clr}',  147),
    ('{home}',  19),
    ('{up}',   145),
    ('{down}',  17),
    ('{left}', 157),
    ('{rght}',  29),
    ('{$a0}',  160),
    ('{inst}', 148),
    ('{rvon}',  18),
    ('{rvof}', 146),
    ('{blk}',  144),
    ('{wht}',    5),
    ('{red}',   28),
    ('{cyn}',  159),
    ('{pur}',  156),
    ('{grn}',   30),
    ('{blu}',   31),
    ('{yel}',  158),
    ('{orng}', 129),
    ('{brn}',  149),
    ('{lred}', 150),
    ('{gry1}', 151),
    ('{gry2}', 152),
    ('{lgrn}', 153),
    ('{lblu}', 154),
    ('{gry3}', 155),
    ('{f1}',   133),
    ('{f2}',   134),
    ('{f3}',   135),
    ('{f4}',   136),
    ('{f5}',   137),
    ('{f6}',   138),
    ('{f7}',   139),
    ('{f8}',   140),
)

def parse_args(argv):
    # parse command line inputs and generate cli documentation
    parser = argparse.ArgumentParser(description =\
    "A tokenizer for Commodore BASIC typein programs. So far, supports Ahoy \n"
    "magazine and Commodore BASIC 2.0 (C64 and VIC20).",\
    formatter_class=RawTextHelpFormatter)

    parser.add_argument(
        "-l", "--loadaddr", type=str, nargs=1, required=False, 
        metavar="load_address", default=["0x0801"],
        help="Specifies the target BASIC memory address when loading:\n"
             "- 0x0801 - C64 (default)\n"
             "- 0x1001 - VIC20 Unexpanded\n"
             "- 0x0401 - VIC20 +3K\n"
             "- 0x1201 - VIC20 +8K\n"
             "- 0x1201 - VIC20 +16\n"
             "- 0x1201 - VIC20 +24K\n"
    )

    parser.add_argument(
        "-v", "--version", choices=['1', '2', '3', '4', '7'], type=str,
        nargs=1, required=False, metavar="basic_version", default=['2'],
        help = "Specifies the BASIC version for use in tokenizing file.\n"
               "- 1 - Basic v1.0  PET\n"
               "- 2 - Basic v2.0  C64/VIC20/PET (default)\n"
               "- 3 - Basic v3.5  C16/C116/Plus/4\n"
               "- 4 - Basic v4.0  PET/CBM2\n"
               "- 7 - Basic v7.0  C128\n"
    )

    parser.add_argument(
        "-s", "--source", choices=["pet", "ahoy"], type=str, nargs=1,
        required=False, metavar = "source_format", default=["ahoy"],
        help="Specifies the source BASIC file format:\n"
             "pet - use standard pet control character mnemonics\n"
             "ahoy - use Ahoy! magazine control character mnemonics "
             "(default)\n"
    )

    parser.add_argument(
        "file_in", type=str, metavar="input_file",
        help = "Specify the input file name including path\n"
               "Note:  Output files will use input file basename\n"
               "with extensions '.pet' for petcat-ready file and\n"
               "'.prg' for Commordore run fule format."
    )

    return parser.parse_args(argv)

def read_file(filename):
    """Opens and reads magazine source, strips whitespace, and
       returns a list of lines converted to lowercase 

    Args:
        filename (str): The file name of the magazine source file

    Returns:
        list: a list of strings for each non-blank line from the source file
            converted to lowercase
    """

    with open(filename) as file:
        lines = file.readlines()
        lower_lines = []
        for line in lines:
            # remove any lines with no characters
            if not line.strip():
                continue
            lower_lines.append(line.rstrip().lower())
        return lower_lines

def write_binary(filename, int_list):
    """Write binary file readable on Commodore computers or emulators

    Args:
        filename (str): The file name of the file to write as binary
        int_list (list): List of integers to convert to binary bytes and 
            output write to file

    Returns:
        None: implicit return
    """
    
    with open(filename, "wb") as file:
        for byte in int_list:
            file.write(byte.to_bytes(1, byteorder='big'))

# convert ahoy special characters to petcat special characters
def ahoy_lines_list(lines_list):

    new_lines = []
    
    for line in lines_list:
        # split each line on ahoy special characters
        str_split = re.split(r"\{\w{2}\}", line)

        # check for loose braces in each substring, return error indication        
        for sub_str in str_split:
            loose_brace = re.search(r"\}|{", sub_str)
            if loose_brace is not None:
                return (None, line)
                
        # create list of ahoy special character code strings
        code_split = re.findall(r"\{\w{2}\}", line)        

        new_codes = []
        
        # for each ahoy special character, append the petcat equivalent
        for item in code_split:
            new_codes.append(AHOY_TO_PETCAT[item.upper()])
            
        # add blank item to list of special characters to aide enumerate
        if new_codes:
            new_codes.append('')

            new_line = []

            # piece the string segments and petcat codes back together
            for count, segment in enumerate(new_codes):
                new_line.append(str_split[count])
                new_line.append(new_codes[count])
        # handle case where line contained no special characters
        else:
            new_line = str_split
        new_lines.append(''.join(new_line))
    return new_lines

def split_line_num(line):
    """Split each line into line number and remaining line text

    Args:
        line (str): Text of each line to split

    Returns:
        tuple consisting of:
            line number (int): Line number split from the beginning of line
            remaining text (str): Text for remainder of line with whitespace 
                stripped
    """
    
    line = line.lstrip()
    acc = []
    while line and line[0].isdigit():
        acc.append(line[0])
        line = line[1:]
    return (int(''.join(acc)), line.lstrip())
    
# manage the tokenization process for each line text string
def scan_manager(ln):
    in_quotes = False
    in_remark = False
    bytes = []
    
    while ln:
        (byte, ln) = scan(ln, tokenize = not (in_quotes or in_remark))
        # if byte is not None:
        bytes.append(byte)
        if byte == ord('"'):
            in_quotes = not in_quotes
        if byte == 143:
            in_remark = True
    bytes.append(0)
    return bytes

# scan each line segement and convert to tokenized bytes.  
# returns byte and remaining line segment
def scan(ln, tokenize=True):
    """Scan beginning of each line for BASIC keywords, petcat special 
       characters, or ascii characters, convert to tokenized bytes, and
       return remaining line segment after converted characters are removed

    Args:
        ln (str): Text of each line segment to parse and convert
        tokenize (bool): Flag to indicate if start of line segment should be
            tokenized (False if line segment start is within quotes or after
            a REM statement) 

    Returns:
        tuple consisting of:
            character/token value (int): Decimal value of ascii character or
                tokenized word
            remainder of line (str): Text for remainder of line with keyword, 
                specical character, or alphanumeric character stripped
    """

    # check if each line passed in starts with a petcat special character
    # if so, return value of token and line with token string removed
    for (token, value) in PETCAT_TOKENS:
        if ln.startswith(token):
            return (value, ln[len(token):])
    # if tokenize flag is True (i.e. line beginning is not inside quotes or
    # after a REM statement), check if line starts with a BASIC keyword
    # if so, return value of token and line with BASIC keyword removed
    if tokenize:
        for (token, value) in TOKENS_V2:
            if ln.startswith(token):
                return (value, ln[len(token):])
    # for characters without token values, convert to unicode (ascii) value
    # and, for latin letters, shift values by -32 to account for difference
    # between ascii and petscii used by Commodore BASIC
    # finally, return character value and line with character removed
    char_val = ord(ln[0])
    if char_val >= 97 and char_val <= 122:
       char_val = char_val - 32
    # if char_val == 32:
    #     char_val = None
    return (char_val, ln[1:])

def check_overwrite(filename):
    overwrite = 'y'
    if path.isfile(filename):
        overwrite = input(f'Output file "{filename}" already exists. '
                           'Overwrite? (Y = yes) ')
    if overwrite.lower() == 'y':
        return True
    else:
        print('File not overwritten - exiting.')
        sys.exit(1)

def hex_to_ahoy_repellent_code(hex_value):
    '''
    Function to convert hex to alpha only representation that the
    Ahoy Bug Repellent tool uses.  Algorithm:  First hex character maps
    directly to the alpha character shown in the below mapping. Second 
    alpha character is determined by indexing from first character by the
    value of the second hex digit.

    hex:   0 1 2 3 4 5 6 7 8 9 a b c d e f
    alpha: A B C D E F G H I J K L M N O P
    
    So, hex 47 is alpha EL, hex 97 is alpha JA, hex df is alpha NM  
    '''

    alpha_map = "ABCDEFGHIJKLMNOP"
    
    hex_chars =  str(hex_value)[-2:]
    idx0 = int(hex_chars[0], 16)
    idx1 = int(hex_chars[0], 16) + int(hex_chars[1], 16)
    if idx1 > 15:
        idx1 = idx1 - 16

    return alpha_map[idx0] + alpha_map[idx1]

def main(argv=None):

    out_list = [0, 192,
    32, 161, 192, 165, 43, 133, 251, 165, 44, 133,
    252, 160, 0, 132, 254, 32, 37, 193, 234, 177,
    251, 208, 3, 76, 138, 192, 230, 251, 208, 2,
    230, 252, 76, 43, 192, 76, 73, 78, 69, 32,
    35, 32, 0, 169, 35, 160, 192, 32, 30, 171,
    160, 0, 177, 251, 170, 230, 251, 208, 2, 230,
    252, 177, 251, 32, 205, 189, 169, 58, 32, 210,
    255, 169, 0, 133, 253, 230, 254, 32, 37, 193,
    234, 165, 253, 160, 0, 76, 13, 193, 133, 253,
    177, 251, 208, 237, 165, 253, 41, 240, 74, 74,
    74, 74, 24, 105, 65, 32, 210, 255, 165, 253,
    41, 15, 24, 105, 65, 32, 210, 255, 169, 13,
    32, 220, 192, 230, 63, 208, 2, 230, 64, 230,
    251, 208, 2, 230, 252, 76, 11, 192, 169, 153,
    160, 192, 32, 30, 171, 166, 63, 165, 64, 76,
    231, 192, 96, 76, 73, 78, 69, 83, 58, 32,
    0, 169, 247, 160, 192, 32, 30, 171, 169, 3,
    133, 254, 32, 228, 255, 201, 83, 240, 6, 201,
    80, 208, 245, 230, 254, 32, 210, 255, 169, 4,
    166, 254, 160, 255, 32, 186, 255, 169, 0, 133,
    63, 133, 64, 133, 2, 32, 189, 255, 32, 192,
    255, 166, 254, 32, 201, 255, 76, 73, 193, 96,
    32, 210, 255, 173, 141, 2, 41, 1, 208, 249,
    96, 32, 205, 189, 169, 13, 32, 210, 255, 32,
    204, 255, 169, 4, 76, 195, 255, 147, 83, 67,
    82, 69, 69, 78, 32, 79, 82, 32, 80, 82,
    73, 78, 84, 69, 82, 32, 63, 32, 0, 76,
    44, 193, 234, 177, 251, 201, 32, 240, 6, 138,
    113, 251, 69, 254, 170, 138, 76, 88, 192, 0,
    0, 0, 0, 230, 251, 208, 2, 230, 252, 96,
    170, 177, 251, 201, 34, 208, 6, 165, 2, 73,
    255, 133, 2, 165, 2, 208, 218, 177, 251, 201,
    32, 208, 212, 198, 254, 76, 29, 193, 0, 169,
    13, 76, 210, 255, 0, 0, 0
    ]
    
    # Write binary file compatible with Commodore computers or emulators
    bin_file = 'repellent_asm2.prg'
    if check_overwrite(bin_file):
        write_binary(bin_file, out_list)

if __name__ == '__main__':
    sys.exit(main())
