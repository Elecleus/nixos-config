#
# NixOS Multi-user Config Manager
#

function pull() {
	cp -r /etc/nixos/* ./
}

function push() {
	if [[ $EUID -ne 0 ]]; then
		echo "Please run me as root."
		exit 1
	fi
	cp -r ./* /etc/nixos/
}

function main() {
	if [[ $1 -eq "pull" ]]; then
		echo -n "Pulling:"
		pull
		echo "Succeed!"
		exit 0
	else
		if [[ $1 -eq "push" ]]; then
			echo -n "Pushing:"
			push
			echo "Succeed!"
			exit 0
		fi
	fi
}

main
