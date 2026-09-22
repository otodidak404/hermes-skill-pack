# Hermes Skill Pack

Skill pack untuk **Hermes Agent** (by Nous Research) — fokus pada **skill meta-management**: merawat, mengaudit, dan mengoptimalkan library skill itu sendiri.

## 📁 Struktur

```
skills/
└── hermes/
    ├── skill-audit/          → Audit semua skill (duplikat, ukuran, kategori, linked files)
    ├── skill-management/     → Lifecycle management (create, update, archive, delete)
    ├── skill-anti-duplicate/ → Deteksi + merge skill duplikat/overlap
    ├── skill-auto-organize/  → Auto-kategorisasi + trim skill oversized
    ├── skill-strengthen/     → Perkuat skill existing (tambah pitfalls, steps, verification)
    ├── skill-auto-create/    → Auto-generate skill dari pola sesi sukses
    └── skill-soul-loader/    → Auto-load & manage SOUL.md system prompt
```

## 🚀 Install

```bash
git clone https://github.com/otodidak404/hermes-skill-pack.git
cd hermes-skill-pack
./install.sh
```

`install.sh` akan:
1. Copy semua skill ke `~/.hermes/skills/`
2. Set `auto_load_skills` di `~/.hermes/config.yaml`

Restart sesi (`/reset` atau sesi baru) — skill langsung aktif.

## 🛠️ Manual Setup

```bash
mkdir -p ~/.hermes/skills
cp -r skills/hermes ~/.hermes/skills/
```

Tambah ke `~/.hermes/config.yaml`:

```yaml
auto_load_skills:
  - skill-audit
  - skill-management
  - skill-anti-duplicate
  - skill-auto-organize
  - skill-strengthen
  - skill-auto-create
  - skill-soul-loader
```

## 📄 Lisensi

FEB-FRMN Source-Available — non-commercial / no-resale. Credit ke [@febfrmn](https://github.com/febfrmn).
