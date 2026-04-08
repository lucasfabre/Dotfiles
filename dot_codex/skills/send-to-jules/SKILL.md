---
name: send-to-jules
description: Automates sending development plans or file content to a new Jules task session. Use this when the user wants to delegate a task to Jules using a local file as the primary instruction.
---

# /send-to-jules

When the user invokes this command or asks to send a plan/file to Jules:

## 1. Form a Proper Plan
- Before creating any Jules session, turn the request into a concise implementation plan.
- If the user gave multiple items, split them into separate task scopes unless they explicitly ask for a combined/aggregate Jules task.
- Do not forward raw fragments as-is if they need restructuring into a real plan.
- Keep the plan tight and implementation-oriented, with clear scope and deliverables.

## 2. Identify Repository
- Execute `git config --get remote.origin.url` to get the remote URL.
- Parse the output to extract the repository name in `username/repo_name` format.
- If the repository cannot be determined, ask the user for it.

## 3. Execute Task Creation
- Identify the source file (e.g., a plan in `.gemini/tmp/codegen/plans/` or a file provided in the prompt).
- Ask the user for a short, descriptive session title if one wasn't provided.
- Run the command:
  ```bash
  (echo "# <Session Title>"; cat <path_to_file>) | jules remote new --repo <repo_name>
  ```
- If the title is already known, use it directly.
- If the user gave pasted instructions instead of a file, write them to the session input exactly as provided.
- If the user requested multiple Jules sessions, create only the sessions they asked for. Do not add a combined session unless explicitly requested.

## 4. Respond
- Inform the user that the Jules session has started.
- Provide the console link from the command output (e.g., `https://jules.google.com/session/...`).
- Remind them they can check the status with `/jules status`.

## Error Handling
- If `jules` is not found: `npm install -g @google/jules`.
- If 401/Auth error: Instruct user to visit https://jules.google.com to link GitHub or run `jules login`.
