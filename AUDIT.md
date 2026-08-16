# Audit Report — Hermes Skills Library

Full audit of `~/.hermes/skills/` (Aug 2026). Methodology: `skill-audit` + `skill-anti-duplicate` + `skill-auto-organize`.

## Ringkasan

| Metrik | Nilai |
|--------|-------|
| Total skills (excl. .archive) | **446** |
| Root-level (uncategorized) | 0 |
| Skills >80KB (🔴 RED) | **16** |
| Skills 50–80KB (🟠 ORANGE) | 8 |
| Skills 20–50KB (🟡 YELLOW) | 62 |
| Skills <20KB (🟢 GREEN) | 360 |
| Skills tanpa linked files | 178 |
| Exact duplicate descriptions | 4 cluster |

## Kategori Terbesar

| Jumlah | Kategori |
|--------|----------|
| 40 | devops |
| 37 | mlops |
| 32 | security |
| 29 | creative |
| 23 | automation |
| 19 | productivity |
| 19 | software-development |
| 19 | research |
| 14 | bug-bounty |
| 14 | autonomous-ai-agents |
| 8 | github |
| 8 | finance |
| 7 | blockchain |
| 5 | media |

## Skill Terbesar (Top 15)

| Ukuran | Skill |
|--------|-------|
| 156.4 KB | mlops/pytorch-fsdp |
| 101.2 KB | research/research-paper-writing |
| 100.1 KB | owntown-farm-setup |
| 99.9 KB | software-development/go-ai-proxy-gateway |
| 98.9 KB | automation/xai-grok-cli-mass-farm |
| 98.3 KB | devops/modern-telegram-bot |
| 97.8 KB | ai-gateway-ops |
| 96.9 KB | automation/bai-api-key-farming |
| 95.7 KB | devops/9router-administration |
| 94.9 KB | blockchain/solana-game-bot-setup |
| 92.1 KB | engineering/web-engineering |
| 90.0 KB | qoder-farm |
| 85.7 KB | automation/auto-claim-bot-patterns |
| 85.3 KB | 9router/9router-ops |
| 85.0 KB | automation/captcha-solver |

> Catatan: ukuran besar belum tentu masalah — `9router-ops` (85KB) dan `9router-administration` (95KB) sengaja besar karena mendokumentasikan sistem kompleks. Trim hanya kalau konten stale/duplikat di dalam file yang sama.

## Duplikat Description

| Deskripsi | Skill | Action |
|-----------|-------|--------|
| `>` (9x) | open-kritt, design-review, react-bun-webstore, one-three-one-rule, web-engineering, neuroskill-bci, fitness-nutrition, bug-bounty, drug-discovery | Fix frontmatter (description kosong/rusak) |
| `\|` (8x) | code-injection-detector, secret-scanner, oss-forensics, web-pentest, computer-use, xss-vulnerability-scanner, macos-computer-use, forensics-data-collector | Fix frontmatter (description kosong/rusak) |
| `>-\` (8x) | memento-flashcards, on-chain-forensics, evm-fuzzing-resources, farm-output-delivery, subdomain-takeover, smart-contract-vulnerabilities, http2-specific-attacks, llm-web-chat-proxy | Fix frontmatter (description rusak) |
| Apple Notes (2x) | `apple-notes/` (root) vs `apple/apple-notes/` | Merge → archive root copy |
| Apple Reminders (2x) | `apple-reminders/` (root) vs `apple/apple-reminders/` | Merge → archive root copy |
| iMessage (2x) | `imessage/` (root) vs `apple/imessage/` | Merge → archive root copy |
| FindMy (2x) | `findmy/` (root) vs `apple/findmy/` | Merge → archive root copy |

**Root cause:** banyak SKILL.md punya `description:` multiline YAML (`>-`) yang regex parser gagal tangkap → description jadi `>` atau `|` → false-positive duplicate.

## Duplicate Cluster Resolved (sebelumnya)

| Cluster | Canonical (kept) | Archived |
|---------|-------------------|----------|
| TokenHarbor farming | `automation/tokenharbor-account-farming` | `tokenharbor-farm` → `.archive/` |
| Generic mass farming | `automation/mass-account-api-key-farm` | `automation/mass-account-api-farming` → `.archive/` |
| 9router operations | `9router/9router-ops` (umbrella) | `9router-gateway-mgmt` → `.archive/` |
| 9router admin | `devops/9router-administration` (95KB, unique refs) | — (complementary, keep both) |

## Tindakan yang Disarankan

1. **Fix frontmatter** — 25+ skill dengan description rusak (`>`, `|`, `>-`) → parser skill loader gagal baca deskripsi → skill jadi "invisible" untuk keyword matching.
2. **Archive 4 apple duplicates** — `apple-notes`, `apple-reminders`, `imessage`, `findmy` di root vs `apple/` — merge ke `apple/`, archive root copy.
3. **Trim 5 skill >100KB** — pindahkan detail section ke `references/` (pytorch-fsdp 156KB, research-paper-writing 101KB, owntown-farm-setup 100KB, go-ai-proxy-gateway 99KB, xai-grok-cli-mass-farm 98KB).
4. **Linked files** — 178 skill tanpa linked files; 40% wajar (conceptual), sisanya kandidat tambah `references/`.
5. **Auto-load** — 7 skill inti di-set di `auto_load_skills` (lihat README.md): skill-audit, skill-management, skill-anti-duplicate, skill-auto-organize, skill-strengthen, skill-auto-create, skill-soul-loader.

## Catatan

- Semua file di pack ini sudah di-scan untuk data sensitif (API keys, tokens, chat IDs) — **bersih**, hanya placeholder/parameter references.
- Skills dengan metodologi reusable dipertahankan walau provider-nya sudah tidak aktif (mis. `bai-api-key-farming` — B.AI deleted dari 9router, tapi metodologi recon-nya reusable).
- Never delete skills — selalu archive ke `.archive/` (pattern reference tetap bisa dicari via grep).
