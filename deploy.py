import subprocess
import argparse
import sys
import os
import logging


def execute(command, verbose=None):
    if verbose is None:
        verbose = False
    popen = subprocess.Popen(command, stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    if verbose:
        while popen.poll() is None:
            out = popen.stdout.read(1)
            sys.stdout.write(out)
            sys.stdout.flush()

    result = popen.wait()
    return result == 0

print "Installing dotfiles to user: ", os.getenv("USER")

# TO DO ###
# Add Argparser to print help function
# Add argument to
# pass path to dotfiles folder so that the script can be run from
# any folder
# Parse ignored files from txt file

# Pip check
try:
    import pip
except ImportError:
    print "Error: Pip could not be imported. Check if in path!"
    print "Installing it would not be a bad idea."

# Try importing colorama for better message format
logger = logging.getLogger("dotfiles_deploy")
# Set to Info, add verbose argument that will set to debug
logger.setLevel(logging.DEBUG)

ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)

try:
    from colorlog import ColoredFormatter
    formatter = ColoredFormatter("%(log_color)s"
                                 "%(asctime)s - %(name)s - %(levelname)s"
                                 "%(reset)s %(bold)s%(message)s",
                                 datefmt=None,
                                 reset=True,
                                 log_colors={'DEBUG': 'cyan,bold',
                                             'INFO': 'green,bold',
                                             'WARNING': 'yellow, bold',
                                             'ERROR': 'red',
                                             'CRITICAL': 'red,bg_white',
                                             },
                                 secondary_log_colors={},
                                 style='%'
                                 )
except ImportError:
    print "Could not find [colorlog] package"
    print "Will Not use colored output for info messages!"

    # Use a simple formatter
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s'
                                  '- %(message)s')
    # add formatter to Handler
ch.setFormatter(formatter)
logger.addHandler(ch)

logger.debug("Created Logger Object!")


# Get the home directory of the current user.
home_dir = os.getenv("HOME")
current_dir = os.getcwd()
# Set up the default path for the dotfiles
dotfiles_path = os.path.join(home_dir, ".dotfiles")

# Change to the dotfile directory
# Check if the directory exists, altough it is highly unlikely
# not to, since the user must have cloned it.
if not os.path.isdir(dotfiles_path):
    logger.warning("Dotfiles directory not found! Creating it now!")
    os.mkdir(dotfiles_path)

logger.debug("Changing to dotfiles directory")
os.chdir(dotfiles_path)

# Add subprocess call to execute vim vundle script
# to download all plugins
logger.debug("Calling dotbot install script!")
#  result = subprocess.call(["install", current_dir, home_dir])
result = execute(["./install"])

if not result:
    logger.warning("Dotbot installation script was not executed successfully!")

logger.debug("Dotbot install script finished successfully!")

shell_type = os.path.basename(os.environ["SHELL"])
# Source the shell configuration file
if shell_type == "zsh":
    result = execute(["source", os.path.join(home_dir, ".zshrc")])
elif shell_type == "bash":
    result = execute(["source", os.path.join(home_dir, ".bashrc")])


# Install all vim plugins using Vundle
logger.debug("Installing Vim Plugins!")
result = execute(["vim", "+PluginInstall", "+qall"])
logger.debug("Finished Vim Plugin Installation!")

# Install the C/C++ Family Completion Engine
ycm_path = os.path.join(os.getcwd(), "vim/bundle/YouCompleteMe")
if not os.path.isdir(ycm_path):
    logger.error("Could not find YouCompleteMe directory!")
    logger.error("Dotfiles Installation was not completed successfully!")
    sys.exit(-1)
os.chdir(ycm_path)
result = execute(["./install.py", "--clang-completer"])


logger.info("Successfully downloaded data and created links!")
