#
# NixOS Config Manager
#

function pull() {
	if [ ! -d "./config" ]; then
		echo "E: Directory './config' not found, creating."
		mkdir ./config
	fi
	rm ./config/*
	cp -r /etc/nixos/* ./config/
}


function push() {
	if [[ $EUID -ne 0 ]]; then
		echo "E: Please run me as root!"
		exit 1
	fi
	if [ ! -d "./config" ]; then
		echo "E: Directory './config' not found, please create it!"
		exit 1
	fi
	if [ ! -d "/etc/nixos" ]; then
		echo "E: Directory '/etc/nixos' not found, please create it!"
		exit 1
	fi
	if [ ! -d "./backup" ]; then
		mkdir ./backup
	fi
	backup_dir="./backup/`date +"%Y-%m-%d_%H-%M-%S"`_backup"
	mkdir -p $backup_dir
	cp -r /etc/nixos/* $backup_dir 
	rm /etc/nixos/*
	cp -r ./config/* /etc/nixos/
}

function main() {
	if [[ $1 == "pull" ]]; then
		echo "Pulling:"
		pull
		echo "Succeed!"
		exit 0
	elif
		[[ $1 == "push" ]]; then
		echo "Pushing:"
		push
		echo "Succeed!"
		exit 0
	fi
}

main "$@"
