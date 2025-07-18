#!/bin/bash

WORKSPACE="$1"
TARGETS="$2"

usage() {
  echo "Usage: $0 <workspace-name> <target-file>"
  echo "  <workspace-name> : Name of the Sn1per workspace"
  echo "  <target-file>    : File containing list of target ips or hosts (one per line)"
  exit 1
}

if [[ "$EUID" -ne 0 ]]; then
    echo "[-] Error: This script must be run as root. Please run with sudo or as root user."
    exit 1
fi

if ! command -v sniper >/dev/null 2>&1; then
    echo "[-] Error: sniper is not installed. Please install sniper to continue."
    exit 1
fi

if [[ $# -ne 2 ]]; then
  echo "[-] Error: Invalid number of arguments."
  usage
fi

if [[ -z "$WORKSPACE" ]]; then
  echo "[-] Error: Workspace name is required."
  usage
fi

if [[ ! -f "$TARGETS" ]]; then
  echo "[-] Error: Target file '$TARGETS' not found."
  usage
fi

DATE=$(date +"%Y%m%d-%H%M%S")
ulimit -n 10000

CMD="sniper -o -re -w \"$WORKSPACE\""

while IFS= read -r target || [[ -n "$target" ]]; do
  [[ -z "$target" ]] && continue
  RUN_CMD=${CMD}
  RUN_CMD+=" -t $target"
  echo "[*] Running: $RUN_CMD" 2>&1 | tee -p -a sniper-recon-${DATE}.txt
  eval "$RUN_CMD" 2>&1 | tee -p -a sniper-recon-${DATE}.txt
done < "$TARGETS"

echo "[+] Scan complete. Results saved in: ~/workspace/${WORKSPACE}/"
