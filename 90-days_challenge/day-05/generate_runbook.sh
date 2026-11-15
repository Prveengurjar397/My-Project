#!/bin/bash

# User se kisi bhi service ka naam lena (no hardcoded service)
read -p "Enter the service name to troubleshoot (e.g., ssh, cron, nginx): " SERVICE_NAME

if [ -z "$SERVICE_NAME" ]; then
    echo "Error: Service name cannot be empty!"
    exit 1
fi

REPORT_FILE="runbook_${SERVICE_NAME}_$(date +%F_%H-%M).md"
GATEWAY_IP=$(ip route | awk '/default/ {print $3}' | head -n 1)

echo "Collecting live diagnostics for '$SERVICE_NAME'..."

cat << EOM > "$REPORT_FILE"
# Automated Incident Runbook: ${SERVICE_NAME}.service
**Generated On:** $(date)
**Hostname:** $(hostname)

---

## 1. Service Health & Resource Usage (\`systemctl status\`)
\`\`\`text
$(systemctl status "$SERVICE_NAME" --no-pager 2>&1 | head -n 18)
\`\`\`

---

## 2. System CPU & Load Snapshot (\`uptime\`)
\`\`\`text
$(uptime)
\`\`\`

---

## 3. Memory & Swap Snapshot (\`free -h\`)
\`\`\`text
$(free -h)
\`\`\`

---

## 4. Disk Space Snapshot (\`df -h\`)
\`\`\`text
$(df -h / | column -t)
\`\`\`

---

## 5. Network & Port Check (\`ip route\`, \`ping\`, \`ss -tulnp\`)
- **Default Gateway:** ${GATEWAY_IP:-Not Found}
- **Gateway Ping Test:**
\`\`\`text
$(ping -c 2 "$GATEWAY_IP" 2>&1)
\`\`\`
- **Listening Ports matching '${SERVICE_NAME}':**
\`\`\`text
$(ss -tulnp | grep -i "$SERVICE_NAME" || echo "No active listening network ports found for $SERVICE_NAME")
\`\`\`

---

## 6. Recent Service Logs (\`journalctl\`)
\`\`\`text
$(journalctl -u "$SERVICE_NAME" -n 15 --no-pager 2>&1)
\`\`\`

---

## 7. Next Actions (Escalation & Remediation Checklist)
1. **If High CPU/Memory:** Run \`systemd-cgtop /system.slice/${SERVICE_NAME}.service\` or \`top\` to isolate heavy child PIDs.
2. **If Service Down/Failed:** Check config syntax, then run \`systemctl restart ${SERVICE_NAME}\` and verify via \`systemctl is-active ${SERVICE_NAME}\`.
3. **If Network Unreachable:** Check firewall rules (\`ufw status\` / \`iptables -L -n\`) and verify port binding via \`ss -tulnp\`.
4. **If Issue Persists:** Export full logs using \`journalctl -u ${SERVICE_NAME} > /tmp/${SERVICE_NAME}_full.log\` and escalate.
EOM

echo "✅ Runbook successfully generated: ~/practice/$REPORT_FILE"
