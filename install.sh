#!/usr/bin/env bash
# Hermes Skill Pack installer — copies skills + sets auto_load_skills in config.yaml
set -euo pipefail

SKILLS_SRC="$(cd "$(dirname "$0")" && pwd)/skills"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
SKILLS_DST="$HERMES_HOME/skills"
CONFIG="$HERMES_HOME/config.yaml"

echo "→ Hermes Skill Pack installer"
echo "  src:  $SKILLS_SRC"
echo "  dst:  $SKILLS_DST"

# 1. Copy skills
mkdir -p "$SKILLS_DST"
cp -r "$SKILLS_SRC/"* "$SKILLS_DST/"
echo "✓ Skills copied"

# 2. Set auto_load_skills (idempotent — python preserves YAML structure)
python3 - "$CONFIG" << 'PYEOF'
import sys, yaml, os

config_path = sys.argv[1]
with open(config_path) as f:
    cfg = yaml.safe_load(f) or {}

skills = [
    "skill-audit",
    "skill-management",
    "skill-anti-duplicate",
    "skill-auto-organize",
    "skill-strengthen",
    "skill-auto-create",
    "skill-soul-loader",
]

cfg["auto_load_skills"] = skills
with open(config_path, "w") as f:
    yaml.dump(cfg, f, default_flow_style=False, sort_keys=False)
print("✓ auto_load_skills set in config.yaml")
PYEOF

echo "✓ Done. Restart sesi Hermes untuk aktif."
