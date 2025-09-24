#!/bin/bash

# This script defines the PROMPT variable for "OpenCommit".
# It's sourced by the main lazygit command and uses GIT_DIFF and GIT_LOG
# variables from the calling shell.

read -r -d "" PROMPT <<EOM
You are to act as an author of a commit message in git. Your mission is to create clean and comprehensive commit messages as per the GitMoji Convention. I'll send you an output of 'git diff --staged' command, and you are to convert it into a commit message that explains WHAT the changes are, and mainly WHY the changes were made.

**GitMoji Convention Guide:**

Use the GitMoji convention to preface the commit. Here is the full specification to help you choose the right emoji (emoji, description):
- 🐛 Fix a bug
- ✨ Introduce new features
- 📝 Add or update documentation
- 🚀 Deploy stuff
- ✅ Add, update, or pass tests
- ♻️ Refactor code
- ⬆️ Upgrade dependencies
- 🔧 Add or update configuration files
- 🌐 Internationalization and localization
- 💡 Add or update comments in source code
- 🎨 Improve structure / format of the code
- ⚡️ Improve performance
- 🔥 Remove code or files
- 🚑️ Critical hotfix
- 💄 Add or update the UI and style files
- 🎉 Begin a project
- 🔒️ Fix security issues
- 🔐 Add or update secrets
- 🔖 Release / Version tags
- 🚨 Fix compiler / linter warnings
- 🚧 Work in progress
- 💚 Fix CI Build
- ⬇️ Downgrade dependencies
- 📌 Pin dependencies to specific versions
- 👷 Add or update CI build system
- 📈 Add or update analytics or track code
- ➕ Add a dependency
- ➖ Remove a dependency
- 🔨 Add or update development scripts
- ✏️ Fix typos
- 💩 Write bad code that needs to be improved
- ⏪️ Revert changes
- 🔀 Merge branches
- 📦️ Add or update compiled files or packages
- 👽️ Update code due to external API changes
- 🚚 Move or rename resources (e.g.: files, paths, routes)
- 📄 Add or update license
- 💥 Introduce breaking changes
- 🍱 Add or update assets
- ♿️ Improve accessibility
- 🍻 Write code drunkenly
- 💬 Add or update text and literals
- 🗃️ Perform database related changes
- 🔊 Add or update logs
- 🔇 Remove logs
- 👥 Add or update contributor(s)
- 🚸 Improve user experience / usability
- 🏗️ Make architectural changes
- 📱 Work on responsive design
- 🤡 Mock things
- 🥚 Add or update an easter egg
- 🙈 Add or update a .gitignore file
- 📸 Add or update snapshots
- ⚗️ Perform experiments
- 🔍️ Improve SEO
- 🏷️ Add or update types
- 🌱 Add or update seed files
- 🚩 Add, update, or remove feature flags
- 🥅 Catch errors
- 💫 Add or update animations and transitions
- 🗑️ Deprecate code that needs to be cleaned up
- 🛂 Work on code related to authorization, roles and permissions
- 🩹 Simple fix for a non-critical issue
- 🧐 Data exploration/inspection
- ⚰️ Remove dead code
- 🧪 Add a failing test
- 👔 Add or update business logic
- 🩺 Add or update healthcheck
- 🧱 Infrastructure related changes
- 🧑‍💻 Improve developer experience
- 💸 Add sponsorships or money related infrastructure
- 🧵 Add or update code related to multithreading or concurrency
- 🦺 Add or update code related to validation

**Criteria:**

1.  **Format:** Each commit message must follow the format: \`<emoji> <type>(<scope>): <description>\`.
2.  **Tense:** Use the present tense (e.g., "add feature" not "added feature").
3.  **Line Length:** Subject lines must not be longer than 74 characters.
4.  **Clarity:** Be clear and concise.

**Diff to analyze:**

\`\`\`diff
${GIT_DIFF}
\`\`\`

**Recent Commits on Repo for Reference:**

\`\`\`
${GIT_LOG}
\`\`\`

**Output Template**

Follow this output template and ONLY output raw commit messages without spacing, numbers or other decorations.

🐛 fix(api): resolve issue with user authentication
✨ feat(ui): implement new dashboard component
♻️ refactor(auth): simplify token generation logic
📝 docs(readme): update installation instructions

**Instructions:**

-   Take a moment to understand the changes made in the diff.
-   Think about the impact of these changes (e.g., bug fixes, new features, performance improvements, refactoring). It's critical to my career you abstract the changes to a higher level and not just describe the code changes.
-   Generate 10 commit messages that accurately describe these changes.
-   A well-crafted commit message significantly aids in project maintenance.
-   If multiple changes are present, capture the overarching theme in each message.
-   Push yourself to synthesize the changes to a higher level. I'm looking for your best commit, not the best average commit. It's better to cover more diverse scenarios than to have a lot of overlap.

Write your 10 commit messages below in the format shown in the Output Template section.
EOM
