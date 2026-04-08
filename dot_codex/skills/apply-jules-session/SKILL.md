---
name: apply-jules-session
description: Pulls, applies, and performs a comprehensive code review of changes from a Jules session link.
---

# /apply-jules-session

**Triggers:** This skill should be activated when the user asks to "apply" or "review" a Jules session link (e.g., `https://jules.google.com/session/<id>`).

## 1. Session Retrieval & Initial Framing
- **Framing:** Always approach this as a **Senior Code Review**. State your intent to pull the changes and perform a systemic audit to ensure logical correctness and project alignment.
- Extract the session ID from the URL.
- Before applying, check `git status` so you know whether the worktree already contains unrelated local edits.
- Pull and apply changes: `jules remote pull --session <id> --apply`.
- **Fallback:** If direct apply fails, pull the diff to a temporary file first: `mkdir -p .jules && jules remote pull --session <id> > .jules/diff.patch`.
- Inspect the patch quickly for path scope, then apply it manually with `patch -p1 < .jules/diff.patch` or `git apply --index .jules/diff.patch` when a staged apply is appropriate.
- If the patch targets the wrong repository or path layout, stop and tell the user instead of forcing it.

## 2. Systemic Integrity Audit (The "Big Picture")
Before deep-diving into code, perform a high-level scan:
- **Scope Audit:** Run `git status` and `git diff --stat`. Verify that all expected files were touched and no unrelated files were modified.
- **Conflict Check:** Scan for systemic regressions (e.g., version mismatches in lockfiles, duplicated configuration keys, or broken internal references).
- **Source of Truth:** Identify the "Source of Truth" for the change. Verify the **source** (e.g., a logic module or template) was updated, not just the side-effect (e.g., generated files).
- If the worktree was already dirty before applying the Jules patch, separate those pre-existing edits from the imported change set in your review.

## 3. Semantic Code Review & Sanity Check
Audit core files to ensure the implementation matches the **intent** and **spirit** of the task:
- **Logical Correctness:** Verify the code solves the problem dynamically. Reject "cheating" patterns like hardcoded values or static outputs where logic was requested.
- **Completeness:** Check for partial implementations (e.g., a field added to a model but missing from the API or docs).
- **Idiomatic Alignment:** Ensure the code follows the project's established patterns and doesn't introduce redundant "just-in-case" logic.

## 4. Technical Validation
- Execute the project's standard quality suite:
  - **Formatting:** `just fmt`, `npm run format`, etc.
  - **Static Analysis:** `just lint`, `ruff check`, etc.
  - **Testing:** `just test`, `npm test`, etc.
- **Warning:** Build/test success is necessary but not sufficient. It confirms the code is "valid," but you must confirm it is "correct."
- Prefer project-native commands over ad hoc one-offs when a standard check exists.

## 5. Feedback Loop (Revision Request)
If the review reveals logical flaws, technical regressions, or poor code quality:
- **Stop:** Do not perform major local fixes for the other agent's errors.
- **Revision Request:** Present a clear, structured message for the user to copy and send back to Jules. It must include:
    - **Issue:** A concise summary of the problem.
    - **Reproducible Steps:** How to observe the failure.
    - **Technical Details:** Why it's failing (e.g., "async returns nil").
    - **Requested Fixes:** Specific actions Jules needs to take.

## 6. Finalization
Confirm completion only after both **Automated Validation** and the **Manual Sanity Check** pass. Propose a concise commit message that describes the functional impact.
