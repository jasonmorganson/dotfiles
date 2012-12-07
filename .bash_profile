# Keep a single file for both .bash_profile and .bashrc
# See http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
