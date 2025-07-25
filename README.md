# Sn1perHelper

SniperHelper is a collection of scripts to help perform Sn1per scans in safe, repeatable ways.

---

## Install

   ```bash
   sudo apt update
   git clone https://github.com/Tantalum-Labs/Sn1perHelper.git
   cd Sn1perHelper
   ./sniperInstall.sh # If Sn1per is not already installed
   ```

## Use

   > **Note:** You must run this script as root due to raw packet access.

   > **Note:** Doesn't work under WSL due to raw socket limitations.

   > **Note:** 'client_name' in the below examples represents the Sn1per Workspace name. The workspace name should be the client anme without spaces or symbols.

   > **Note:** Use the same 'client_name' for discovery, recon, collection, etc. If you use differnt worksapce names Sn1per will not have information from previous operations!

### Sn1per Install
   Installs Sn1per for you. Be prepared to answer interactive questions. Permit the installer to install all needed files.

   ```bash
   sudo ./sniperInstall.sh
   ```

### Sn1per Discovery
   Supply Sniper with a file containing a list of subnets known to contain live hosts to perform detailed host discovery. (Run first)

   > **Note:** The input file should be a list of subnets. Don't supply a blind list because it will take too long. Use a qualified list from a tool like rfc1918Disco.

   ```bash
   sudo ./sniperDiscovery.sh client_name target-subnets.txt
   ```

### Sn1per Recon
   Supply Sniper with a file containing a list og target hosts or ips to perform detailed reconnasiance. (Run second)

   ```bash
   sudo ./sniperRecon.sh client_name sniper-discovered-ips.txt
   ```

### Sn1per Collection
   Supply Sniper with a file containing a list og target hosts or ips to perform additional collection. Usually not needed. (Optional)

   ```bash
   sudo ./sniperCollection.sh client_name sniper-discovered-ips.txt
   ```

### Sn1per Nuke
   Supply Sniper with a file containing a list og target hosts or ips to perform extensive attacks including those that could impact the client. (Optional)

   ```bash
   sudo ./sniperNuke.sh client_name sniper-discovered-ips.txt
   ```
