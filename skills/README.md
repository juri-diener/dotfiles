# ~/.config/skills

Personal skills for AI coding agents. Loaded by **opencode** (via `skills.paths` in `~/.config/opencode/opencode.json`) and **Claude Code** (via symlinks in `~/.claude/skills/`).

The Expo and EAS skills are not symlinked into Claude Code: the official `expo` plugin ships newer copies of them. The folders here serve opencode.

| Skill | Source |
|-------|--------|
| adapt | pbakaus/impeccable |
| animate | pbakaus/impeccable |
| aso-audit | eronred/aso-skills |
| audit | pbakaus/impeccable |
| clarify | pbakaus/impeccable |
| critique | pbakaus/impeccable |
| delight | pbakaus/impeccable |
| eas-observe | expo/skills |
| eas-workflows | expo/skills |
| expo-animation | expo/skills |
| expo-data-fetching | expo/skills |
| expo-dev-client | expo/skills |
| expo-native-ui | expo/skills |
| expo-project-structure | expo/skills |
| expo-router | expo/skills |
| expo-ui | expo/skills |
| expo-upgrade | expo/skills |
| frontend-design | pbakaus/impeccable |
| grill-me | mattpocock/skills |
| harden | pbakaus/impeccable |
| onboard | pbakaus/impeccable |
| polish | pbakaus/impeccable |
| prd-to-issues | mattpocock/skills |
| prd-to-plan | mattpocock/skills |
| react-native-best-practices | callstackincubator/agent-skills |
| scroll-craft | nateherkai/scroll-craft (manual copy, rev 0b81622) |
| supabase | supabase/agent-skills |
| supabase-postgres-best-practices | supabase/agent-skills |
| systematic-debugging | obra/superpowers |
| teach-impeccable | pbakaus/impeccable |
| test-driven-development | obra/superpowers |
| typeset | pbakaus/impeccable |
| vercel-composition-patterns | vercel-labs/agent-skills |
| vercel-react-best-practices | vercel-labs/agent-skills |
| vercel-react-native-skills | vercel-labs/agent-skills |
| verification-before-completion | obra/superpowers |
| write-a-prd | mattpocock/skills |

Installed/updated with the `skills` CLI (`npx skills add -g`). See `.skill-lock.json` for full provenance. scroll-craft is a manual copy of `plugins/nateherk-design/skills/scroll-craft/` from github.com/nateherkai/scroll-craft; update it by re-copying that folder.

`npx skills update -g` now reads `~/.agents/.skill-lock.json`, not the lock here, so it does not refresh these folders. The Expo skills were last synced by hand on 2026-09-25 from `plugins/expo/skills/` in github.com/expo/skills (commit efa52f0), which matches the Claude `expo` plugin 1.13.6.

## Removed 2026-09-25

Moved to `~/.Trash/skills-removed-2026-09-25/`.

- **Duplicates of scroll-craft:** taste-skill, immersive, storytelling, premium, dramatic, power.
- **Style presets from bergside/awesome-design-skills** (thin token sheets, generic names that trigger by accident): the remaining 62.
- **Overlapping or unused:** ui-ux-pro-max, brainstorming, writing-plans, typescript-advanced-types, using-git-worktrees, find-skills, web-design-guidelines, bolder, quieter, colorize, distill, arrange, normalize, extract, optimize, overdrive, expo-dom, tailwind-design-system, writing-clearly-and-concisely.

`audit` and `critique` still suggest some removed impeccable commands (`/bolder`, `/optimize`, `/overdrive`, ...) by name. Ignore those suggestions.
