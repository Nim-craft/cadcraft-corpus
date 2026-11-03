# AGENTS.md: working on the CADCraft corpus

## 1. Read first

1. [`README.md`](README.md): what this repository is, the layout, what may be added.
2. CADCraft's [`CLAUDE.md`](https://github.com/storytold/cadcraft/blob/main/CLAUDE.md): the
   clean-room and assets rules, and how the round-trip harness uses these files.

## 2. Rules

- **Never rewrite history:** no force-push, no amending pushed commits. Apps pin commits, and
  every old pin must stay fetchable.
- **Every file has a `LICENSES.tsv` row and a `SHA256SUMS` line** in the same commit.
  `tools/check.sh` must pass.
- **Only contributor-owned drawings** under an open licence, or drawings CADCraft generates with
  `tools/generate.sh`. Never add Autodesk files (sample drawings, templates, SHX fonts, `.pat`,
  `.lin`, blocks from a product library), drawings from the web, or anyone else's work.
- **Agents don't author drawings in AutoCAD** and never add files produced by AutoCAD; only a
  contributor adds a drawing they made.
- **No personal details** in file contents, metadata, layer names, xref paths or file names.
- **Never commit reports** (`report/`) or the harness's saved copies.
- **Keep files small** (see the README's size guidance).
