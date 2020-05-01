#!/bin/bash

#================================================================
# Update script for updating Threat Feeds and Pushing to Master.
# This is run by cron every 1 day.
#================================================================
#================================================================
#  HISTORY
#     2020/05/01 : Script Creation
#================================================================


CURR_TIMESTAMP=$(date '+%d/%m/%Y %H:%M:%S')
TEMP_DIR='TEMP'
GITHUB_REPO_DIR="$HOME/ThreatStack/Feeds"

echo "Update Performed at: ${CURR_TIMESTAMP}"
mkdir "$TEMP_DIR"

# ******** Updating Lockdown Blacklists ******** #
LOCKDOWN_IP_BLIST='https://raw.githubusercontent.com/boldleadsdevelopment/lockdown-lists/master/blacklists/blocklist.de.ips'
LOCKDOWN_ET_BLIST='https://raw.githubusercontent.com/boldleadsdevelopment/lockdown-lists/master/blacklists/emergingthreats.net.ips'

TARGET_GIT_DIR='Lockdown'
TMP_DIR="${TEMP_DIR}/${TARGET_GIT_DIR}"

mkdir ${TMP_DIR}
cd ${TMP_DIR}

curl -O "$LOCKDOWN_IP_BLIST"
curl -O "$LOCKDOWN_ET_BLIST"

# Checking for network connection issue.
if [ $? -ne 0 ]; then
    echo -e "Network connection issue!!\nExiting..."
    exit
fi

mv *.ips "${GITHUB_REPO_DIR}/${TARGET_GIT_DIR}"
cd ..

# ******** Updating anudeepND's Blacklists ******** #
ANU_FB_BLIST='https://raw.githubusercontent.com/anudeepND/blacklist/master/facebook.txt'
ANU_ADS_BLIST='https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt'
ANU_MINERS_BLIST='https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt'
TARGET_GIT_DIR='anudeepND'
TMP_DIR="${TARGET_GIT_DIR}"

mkdir ${TMP_DIR}
cd ${TMP_DIR}

curl -O "$ANU_FB_BLIST"
curl -O "$ANU_ADS_BLIST"
curl -O "$ANU_MINERS_BLIST"

mv *.txt "${GITHUB_REPO_DIR}/${TARGET_GIT_DIR}"
cd ..

# ******** Updating lightswitch05's Blacklists ******** #
ADS_TRACK_EXT='https://raw.githubusercontent.com/lightswitch05/hosts/master/ads-and-tracking-extended.txt'
ADS_TRACK='https://raw.githubusercontent.com/lightswitch05/hosts/master/ads-and-tracking.txt'
AMP_HOSTS_EXT='https://raw.githubusercontent.com/lightswitch05/hosts/master/amp-hosts-extended.txt'
AMP_HOSTS='https://raw.githubusercontent.com/lightswitch05/hosts/master/amp-hosts.txt'
TRACK_AGG='https://raw.githubusercontent.com/lightswitch05/hosts/master/tracking-aggressive.txt'
TRACK_AGG_EXT='https://raw.githubusercontent.com/lightswitch05/hosts/master/tracking-aggressive-extended.txt'
FB_BLIST='https://raw.githubusercontent.com/lightswitch05/hosts/master/facebook.txt'
FB_EXT='https://raw.githubusercontent.com/lightswitch05/hosts/master/facebook-extended.txt'
TARGET_GIT_DIR='lightswitch05'
TMP_DIR="${TARGET_GIT_DIR}"

mkdir ${TMP_DIR}
cd ${TMP_DIR}

curl -O "$ADS_TRACK_EXT"
curl -O "$ADS_TRACK"
curl -O "$AMP_HOSTS_EXT"
curl -O "$AMP_HOSTS"
curl -O "$TRACK_AGG"
curl -O "$TRACK_AGG_EXT"
curl -O "$FB_BLIST"
curl -O "$FB_EXT"

mv *.txt "${GITHUB_REPO_DIR}/${TARGET_GIT_DIR}"
cd ..

# ******** Updating firehol's Blacklists ******** #
FIREHOL_AD='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/yoyo_adservers.ipset'
FIREHOL_PHISIHNG='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/cleanmx_phishing.ipset'
FIREHOL_CM1='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/coinbl_ips.ipset'
FIREHOL_CM2='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/coinbl_hosts.ipset'
FIREHOL_C2_1='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/cybercrime.ipset'
FIREHOL_C2_2='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/bambenek_c2.ipset'
FIREHOL_C2_3='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/xforce_bccs.ipset'
FIREHOL_C2_4='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/bambenek_banjori.ipset'
FIREHOL_C2_5='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/esentire_venerologvasan93_ru.ipset'
FIREHOL_C2_6='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/esentire_smartfoodsglutenfree_kz.ipset'
FIREHOL_C2_7='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/esentire_emptyarray_ru.ipset'
FIREHOL_IP_F1='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/threatcrowd.ipset'
FIREHOL_IP_F2='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/alienvault_reputation.ipset'
FIREHOL_IP_F3='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/talosintel_ipfilter.ipset'
FIREHOL_IP_F4='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/taichung.ipset'
FIREHOL_IP_F5='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/uscert_hidden_cobra.ipset'
FIREHOL_IP_F6='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/nullsecure.ipset'
FIREHOL_IP_F7='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/bi_any_2_30d.ipset'
FIREHOL_IP_F8='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/bi_bruteforce_1_7d.ipset'
FIREHOL_IP_F9='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/urlvir.ipset'
FIREHOL_IP_F10='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/et_compromised.ipset'
FIREHOL_IP_F11='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/dshield_top_1000.ipset'
FIREHOL_IP_F12='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/bds_atif.ipset'
FIREHOL_IP_F13='https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/blocklist_de.ipset'

TARGET_GIT_DIR='firehol'
TMP_DIR="${TARGET_GIT_DIR}"

mkdir ${TMP_DIR}
cd ${TMP_DIR}

# Adserver
mkdir Adserver
cd Adserver

curl -O ${FIREHOL_AD}
cd ..

# Phishing
mkdir Phishing
cd Phishing

curl -O ${FIREHOL_PHISIHNG}
cd ..

# Coinminer
mkdir Coinminer
cd Coinminer

curl -O ${FIREHOL_CM1}
curl -O ${FIREHOL_CM2}
cd ..

# C2
mkdir C2
cd C2

curl -O ${FIREHOL_C2_1}
curl -O ${FIREHOL_C2_2}
curl -O ${FIREHOL_C2_3}
curl -O ${FIREHOL_C2_4}
curl -O ${FIREHOL_C2_5}
curl -O ${FIREHOL_C2_6}
curl -O ${FIREHOL_C2_7}
cd ..

# IPFeeds
mkdir IPFeeds
cd IPFeeds

curl -O ${FIREHOL_IP_F1}
curl -O ${FIREHOL_IP_F2}
curl -O ${FIREHOL_IP_F3}
curl -O ${FIREHOL_IP_F4}
curl -O ${FIREHOL_IP_F5}
curl -O ${FIREHOL_IP_F6}
curl -O ${FIREHOL_IP_F7}
curl -O ${FIREHOL_IP_F8}
curl -O ${FIREHOL_IP_F9}
curl -O ${FIREHOL_IP_F10}
curl -O ${FIREHOL_IP_F11}
curl -O ${FIREHOL_IP_F12}
curl -O ${FIREHOL_IP_F13}
cd ..

cp -R * "${GITHUB_REPO_DIR}/${TARGET_GIT_DIR}"

rm -Rf $HOME/TEMP

# * Pushing to GitHub 
cd ${GITHUB_REPO_DIR}
cd ..
sed -i "" "s/Update Time.*/Update Time: $(date +%Y-%m-%d\ %H:%M:%S\ NST)/" README.md
git add .
git commit -m "Updated Threat Intel Feeds at $(date +%Y-%m-%d\ %H:%M:%S\ NST)" 
git push