#!/system/bin/sh

# ==== VALIDASI KEY ONLINE ====
KEY_URL="https://raw.githubusercontent.com/danysfahmi21/Loader-ab/main/keys.txt"
KEY_USER="$1"  # Key dari loader

echo "🔑 CEK KEY ONLINE KONTOL... 🖕"
VALID_KEY=$(curl -s $KEY_URL | grep -x "$KEY_USER")

if [ -z "$VALID_KEY" ]; then
    echo "❌ KEY SALAH ATAU EXPIRED ANJING!"
    exit 1
fi

echo "✅ KEY VALID! JALANKAN SCRIPT... 😈"

# ==== LOGIKA UTAMA SCRIPT DI SINI ====
echo -e "1. Turn On Bypass"
echo -e "2. Turn Off Bypass"
read num

if [ "$num" == "1" ]; then
    iptables -A OUTPUT -m string --string "listdl" --algo bm --to 65535 -j DROP
    iptables -A INPUT -p tcp -m string --string "down.anticheatexpert.com" --algo bm --to 65535 -m tcp --dport 443 -j DROP
    iptables -A INPUT -m string --string ".*zip.*|ano.*|config.*|SpeedUp.*|cache.*data.*" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "data" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "unzipmrpcs.data" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "mrpcs_a_s.data" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "config" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "ano" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "zip" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "ano_tmp" --algo bm --to 65535 -j DROP
    iptables -A INPUT -m string --string "custom_cache" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string ".*zip.*|ano.*|config.*|SpeedUp.*|cache.*data.*" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "data" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "unzipmrpcs.data" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "mrpcs_a_s.data" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "config" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "ano" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "zip" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "ano_tmp" --algo bm --to 65535 -j DROP
    iptables -A OUTPUT -m string --string "custom_cache" --algo bm --to 65535 -j DROP
    iptables -w -I INPUT -m string --string "_s.d"  --algo bm -m length --length 1:65535 -j DROP
    iptables -A INPUT -s 129.226.1.157 -p tcp -j DROP
    iptables -A INPUT -s 101.32.143.232 -p tcp -j DROP
    iptables -A INPUT -s 101.32.143.247 -p tcp -j DROP
    iptables -A INPUT -s 101.32.143.142 -p tcp -j DROP
    iptables -A INPUT -s 101.32.143.64 -p tcp -j DROP
    iptables -A INPUT -s 129.226.2.37 -p tcp -j DROP
    iptables -A INPUT -s 129.226.2.231 -p tcp -j DROP
    iptables -A INPUT -s 129.226.3.232 -p tcp -j DROP
    iptables -A INPUT -s 101.32.143.171 -p tcp -j DROP
    iptables -A INPUT -s 129.226.2.142 -p tcp -j DROP
    iptables -A OUTPUT -p tcp -m tcp --dport 10012 -j DROP
    echo -e "Bypass Success Running, go Play now!"
elif [ "$num" == "2" ]; then
    iptables -t filter -F
    iptables -t nat -F
    iptables -t mangle -F
    echo -e "Bypass has been off, Don't play with cheat!"
fi
