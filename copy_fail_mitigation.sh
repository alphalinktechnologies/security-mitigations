#!/bin/bash
# AlphaLink Security Mitigation - CVE-2026-31431 (Copy Fail)

echo "--- STARTING MITIGATION ---"

# 1. Unload the module
if lsmod | grep -q "algif_aead"; then
    echo "[*] Unloading vulnerable module..."
    sudo modprobe -r algif_aead 2>/dev/null
fi

# 2. Permanent Blacklist
echo "[*] Creating persistent blacklist..."
echo "blacklist algif_aead" | sudo tee /etc/modprobe.d/copyfail-mitigation.conf > /dev/null

# 3. Rebuild Initramfs (Detect Distro)
if command -v update-initramfs >/dev/null; then
    echo "[*] Debian/Ubuntu: Rebuilding initramfs..."
    sudo update-initramfs -u
elif command -v dracut >/dev/null; then
    echo "[*] RHEL/CentOS: Rebuilding dracut..."
    sudo dracut -f
else
    echo "[!] Manual initramfs update may be required for this distro."
fi

echo "--- VERIFICATION ---"
lsmod | grep -q "algif_aead" && echo "❌ FAILED: Module still active." || echo "✅ SUCCESS: System Mitigated."
