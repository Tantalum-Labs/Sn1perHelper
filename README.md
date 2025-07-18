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

   Sn1per Discovery: Supply Sniper with a file containing a list of subnets known to contain live hosts to perform detailed host discovery. (Run first)
   ```bash
   sudo ./sniperDiscovery.sh client_name target-subnets.txt
   ```

   Sn1per Recon: Supply Sniper with a file containing a list og target hosts or ips to perform detailed reconnasiance. (Run second)
   ```bash
   sudo ./sniperRecon.sh client_name sniper-discovered-ips.txt
   ```

   Sn1per Collection: Supply Sniper with a file containing a list og target hosts or ips to perform additional collection. Usually not needed. (Optional)
   ```bash
   sudo ./sniperCollection.sh client_name sniper-discovered-ips.txt
   ```

   Sn1per Nuke: Supply Sniper with a file containing a list og target hosts or ips to perform extensive attacks including those that could impact the client. (Optional)
   ```bash
   sudo ./sniperNuke.sh client_name sniper-discovered-ips.txt
   ```
