"""_summary_

    Contains some functions that extracts code from main
    in order to not blow the entry point of the program
    with operations that Zork offers after the build
    process, like the autorun the generate executable,
    the tests...
"""

import os
from utils import constants


def run_executable(config: dict, proj_name: str):
    """_summary_

    Args:
        config (dict): key-value structure with the user defined
        config
    """
    exec_name = config.get("executable").executable_name\
    .replace(
        '<autogenerated_executable>',
        proj_name
    )
    output_dir = config.get("build").output_dir

    RUN_EXEC = ''
    if constants.OS == constants.WINDOWS:
        full_current_path = os.getcwd()
        RUN_EXEC = f'{full_current_path}\\{output_dir}\\{exec_name}.exe'

        QUOTED_PATHS = ''
        sp = [p for p in RUN_EXEC.split('\\') if p != '']

        for el in sp:
            if " " in el:
                intermediate =  '"' + el + '"'
                QUOTED_PATHS += intermediate
            else:
                QUOTED_PATHS += el
            QUOTED_PATHS += '\\'

        RUN_EXEC = QUOTED_PATHS[:-1]
    else:
        RUN_EXEC = f'{config.get("build").output_dir}/{exec_name}'

    try:
        os.system(RUN_EXEC)
    except Exception as ex:
        print(f'Exception running the executable happened: {ex}')
