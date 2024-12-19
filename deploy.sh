#!/bin/bash

function deploy_local {
  rm -rf ./local/data

  docker compose -f ./local/docker-compose.yml up -d
  
}

function deploy_vm {
  VM_IP=$1
  NODE_DIR=$2

  docker compose -f docker-compose.yml up -d
}

case "$1" in
  local)
    deploy_local
    ;;
  vm)
    if [ -z "$2" ] || [ -z "$3" ]; then
      echo "Usage: $0 vm <VM_IP> <NODE_DIR>"
      exit 1
    fi
    deploy_vm $2 $3
    ;;
  *)
    echo "Usage: $0 {local|vm <VM_IP> <NODE_DIR>}"
    exit 1
    ;;
esac
