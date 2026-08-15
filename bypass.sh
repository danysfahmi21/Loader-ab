#!/system/bin/sh

# ===== LOGGING KE TELEGRAM =====
BOT_TOKEN="8486337936:AAGNQh032n_t9YAUqN0GY_Tvwqp7BCCeYfs"
CHAT_ID="2029765853"

send_telegram() {
    local msg="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID&text=$msg" > /dev/null
}

# Ambil KEY (dari environment yang dikirim aplikasi atau dari argument)
if [ -n "$KEY_USER" ]; then
    KEY="$KEY_USER"
else
    KEY="$1"
fi

# Kirim log ke Telegram
IP=$(curl -s ifconfig.me 2>/dev/null || echo "Unknown IP")
send_telegram "🔑 KEY $KEY digunakan!%0A📱 IP: $IP%0A📅 $(date '+%Y-%m-%d %H:%M:%S')"

# ==========================================
# BYPASS ANTI-CHEAT
# ==========================================

# Baca pilihan dari stdin (dikirim oleh aplikasi: 1 atau 2)
read num

if [ "$num" = "1" ]; then
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
elif [ "$num" = "2" ]; then
    iptables -t filter -F
    iptables -t nat -F
    iptables -t mangle -F
fi
