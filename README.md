# 🕐 claude-o-clock

A simple bash pipeline that gives you hourly motivational pep talks from Claude, spoken aloud on macOS.

## What it does

Every hour at :01, this script:
1. Asks Claude for a motivational message in Korean
2. Displays the response in your terminal
3. Speaks it aloud using macOS's built-in text-to-speech

The messages adapt based on the time of day:
- **Morning (5am-12pm)**: Energizing messages to start your day
- **Afternoon (12pm-6pm)**: Motivational cheers for the afternoon
- **Evening (6pm-10pm)**: Encouraging words as you wrap up
- **Night (10pm-5am)**: Warm messages for rest and tomorrow

## Claude Code in Unix Pipelines

This project showcases the power of **Claude Code** as a command-line tool that fits perfectly into Unix pipelines:

```bash
# Simple example: Claude output → Text-to-speech
claude -p "Tell me something inspiring" | say

# This project: Claude with dynamic prompts → Captured → Spoken
response=$(claude -p "$prompt")
say "$response"
```

**Why this matters:**
- **Claude Code** behaves like any Unix tool - it reads input, processes it with AI, and outputs text
- You can pipe Claude's output to any command: `grep`, `awk`, `say`, `pbcopy`, etc.
- You can feed dynamic input to Claude using shell variables and command substitution
- Perfect for automation, scheduled tasks, and creative shell scripts

This simple example demonstrates how Claude Code turns AI into a composable Unix building block!

## Requirements

- macOS (uses the built-in `say` command)
- [Claude Code](https://github.com/anthropics/claude-code) installed and configured
- Bash shell

## Quick Start

Want to try it right now? Just run this one-liner:

```bash
git clone https://github.com/beingcognitive/claude-o-clock.git && \
cd claude-o-clock && \
chmod +x claude-o-clock.sh && \
./claude-o-clock.sh
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/beingcognitive/claude-o-clock.git
cd claude-o-clock
```

2. Make the script executable:
```bash
chmod +x claude-o-clock.sh
```

## Usage

Run the script:
```bash
./claude-o-clock.sh
```

The script will:
- Give you an immediate motivational message
- Calculate the exact wait time until the next hour's :01 mark
- Continue running indefinitely, speaking every hour

To stop the script, press `Ctrl+C`.

## More Claude Code Pipeline Examples

```bash
# Explain code and save to file
cat script.py | claude -p "Explain this code" > explanation.md

# Git commit with Claude-generated message
git diff --staged | claude -p "Write a commit message for these changes" | git commit -F -

# Daily standup generator
echo "Yesterday: $(git log --since=yesterday --oneline)" | claude -p "Write my standup update"

# Code review
git diff main..feature | claude -p "Review this code for issues" | tee review.md

# Terminal command helper
claude -p "How do I find large files?" | sh
```

## Customization

### Change the language
Edit the prompts in the script to use your preferred language.

### Change the voice
The script uses the Korean voice "Yuna" by default. You can see available voices:
```bash
say -v ?
```

Then modify the `say -v Yuna` line to use your preferred voice.

### Adjust the timing
The script runs at :01 past every hour. To change this, modify the calculation in the script where it sets `target_total_seconds`.

## How it works

This project demonstrates a simple but powerful Unix pipeline:
- **Claude Code CLI** for AI-generated content (acts as a smart text generator)
- **Bash scripting** for scheduling and control flow
- **macOS `say`** command for text-to-speech (consumes Claude's output)
- **Time calculations** for precise hourly execution

## Why "claude-o-clock"?

It's a playful combination of "Claude" and "o'clock" - because who doesn't need an AI friend checking in every hour with some encouragement?

## License

MIT

## Contributing

Feel free to open issues or submit PRs! Some ideas:
- Add different message types (jokes, facts, quotes)
- Support for other operating systems' TTS
- Web interface for configuration
- Integration with calendar for context-aware messages
- More creative uses of Claude Code in pipelines