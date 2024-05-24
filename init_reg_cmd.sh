#!/bin/bash

if [ ! -d /reg_cmd/cmds ]
then
	{ 
		sudo mkdir -p /reg_cmd/cmds &&
		sudo echo '# section for regcmd command 
			export PATH="$PATH:/reg_cmd/cmds"
			#end of section' >> ~/.bashrc &&
		#sudo touch /reg_cmd/cmds/regcmd.sh &&
		#sudo touch ~/reg_cmd_helper.sh &&
		sudo echo '#!/bin/sh
			if [ "$#" -ne 2 ]; then
			  echo "Insufficient number of arguments!" >&2
			  echo "Usage: regcmd <executable_file_path> <new_command_name>"
			  exit 1
			fi

			sudo cp $1 /reg_cmd/cmds/$2 || echo "Error: Operation could not be performed. Check arguments entered" &&
			sudo chmod +x /reg_cmd/cmds/$2 || echo "Error: Operation could not be performed. Check arguments entered again"' >> ~/reg_cmd_helper.sh &&
			
		sudo chmod +x ~/reg_cmd_helper.sh
		sudo cp ~/reg_cmd_helper.sh /reg_cmd/cmds/regcmd
		sudo rm ~/reg_cmd_helper.sh
		source ~/.bashrc 
		
		echo "Initialised successfully!" &&
		echo "Usage: regcmd <executable_file_path> <new_command_name>"
	} || {
		echo "Error: Could not perform operation" >&2
		exit 1
	}
	
else
	echo "Error: Unable to initialise..! Initialisation might have already been performed." >&2
	exit 1
fi
