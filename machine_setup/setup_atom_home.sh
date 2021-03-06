#!/bin/bash

atomhomesroot=~/atom_homes
#defaultatomhome=~/.atom
homename=$@
newhome=$atomhomesroot/$homename/

create_new_home () {
    echo "creating directory for new Atom home: $newhome"
    mkdir $newhome
}

if [[ ! -d "$atomhomesroot" ]]
then
    echo "creating directory for Atom homes: $atomhomesroot"
    mkdir $atomhomesroot
fi

if [[ -d "$newhome" ]]
then
    echo "Atom home already exists"
else
    if [[ "$homename" == "default" ]]
    then
        create_new_home
        echo "note: no packages installed"
    elif [[ "$homename" == "go" ]]
    then
        create_new_home
        ATOM_HOME=$newhome apm install go-plus platformio-ide-terminal atom-file-icons minimap
        echo "please go to Packages→ Go, select Update Tools, and install/update packages when prompted"
    elif [[ "$homename" == "julia" ]]
    then
        create_new_home
        ATOM_HOME=$newhome apm install uber-juno atom-file-icons minimap
    elif [[ "$homename" == "python_blog" ]]
    then
        create_new_home
        ATOM_HOME=$newhome apm install autocomplete-python platformio-ide-terminal atom-file-icons minimap
    elif [[ "$homename" == "python" ]]
    then
        create_new_home
        pip3 install --user flake8
        ATOM_HOME=$newhome apm install Hydrogen file-icons highlight-selected linter linter-flake8 linter-ui-default minimap platformio-ide-terminal python-autopep8 python-indent python-tools
    elif [[ "$homename" == "scala" ]]
    then
        create_new_home
        ATOM_HOME=$newhome apm install language-scala ide-scala atom-file-icons minimap
    else
        echo "unsupported name for Atom home, nothing created"
    fi
fi
