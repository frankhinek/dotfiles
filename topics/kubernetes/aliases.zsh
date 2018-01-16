#!/bin/sh

kubectl() {
	source <(command kubectl completion zsh)
	command kubectl "$@"
}
