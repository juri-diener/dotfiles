#!/usr/bin/env bash
# Status line script mimicking the Oh My Zsh robbyrussell theme with Claude context info

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
dir=$(basename "$cwd")
model=$(echo "$input" | jq -r '.model.display_name')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
daily_used=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
weekly_used=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Get git branch (skip optional locks)
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)

# Build robbyrussell-style line with ANSI colors
# Arrow: cyan, dir: cyan/bold, git: red/cyan
arrow="\033[0;36m➜\033[0m"
dir_part="\033[1;36m${dir}\033[0m"

if [ -n "$branch" ]; then
  git_part=" \033[0;31mgit:(\033[0;36m${branch}\033[0;31m)\033[0m"
else
  git_part=""
fi

model_part="\033[0;35m[${model}]\033[0m"

if [ -n "$daily_used" ] && [ -n "$weekly_used" ]; then
  usage_part=" \033[0;32mD:$(printf '%.0f' "$daily_used")%% / W:$(printf '%.0f' "$weekly_used")%%\033[0m"
elif [ -n "$daily_used" ]; then
  usage_part=" \033[0;32mD:$(printf '%.0f' "$daily_used")%%\033[0m"
elif [ -n "$weekly_used" ]; then
  usage_part=" \033[0;32mW:$(printf '%.0f' "$weekly_used")%%\033[0m"
else
  usage_part=""
fi

if [ -n "$remaining" ]; then
  ctx_part=" \033[0;33mctx:$(printf '%.0f' "$remaining")%%\033[0m"
else
  ctx_part=""
fi

printf "${arrow} ${dir_part}${git_part} ${model_part}${usage_part}${ctx_part}\n"
