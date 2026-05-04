# AlphaLink Security Mitigations

This repository contains centralized mitigation scripts for critical security vulnerabilities. These scripts are intended for use on servers that cannot be scheduled to run automatically.

## Active Mitigation: Copy Fail (CVE-2026-31431)

This script addresses the "Copy Fail" vulnerability by disabling the `algif_aead` kernel module.

### How to Use

Run the following one-liner in the terminal of the target server. 

**Note:** You must have sudo privileges to run this command.

```bash
curl -sSL [https://raw.githubusercontent.com/alphalinktechnologies/security-mitigations/main/copy_fail_mitigation.sh](https://raw.githubusercontent.com/alphalinktechnologies/security-mitigations/main/copy_fail_mitigation.sh) | sudo bash
