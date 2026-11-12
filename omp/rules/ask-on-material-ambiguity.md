---
name: ask-on-material-ambiguity
description: "Resolve materially different readings of a request with one crisp question to the user, not silent guessing or flip-flopping"
condition: ["(?i)\\b(back and forth|flip-?flop|on second thought|let me reconsider|i keep going|i'll go with|but wait|hmm,? (but|though|hold on))\\b", "(?i)\\b(ambigu\\w*|uncertain\\w*|not sure|genuine (ambiguity|question))\\b"]
question: "Does this output resolve a genuine ambiguity with materially different, partly irreversible consequences by silently picking an option or flip-flopping between options, instead of asking the user one crisp question?"
scope: ["thinking", "text"]
---

When two readings of the request lead to materially different outcomes — especially destructive or irreversible ones (deleting data, dropping resources, changing a retention/policy scope) — stop and ask **one** batched question immediately (2–5 short options, mark the conservative one recommended), then implement the answer.

Do NOT:
- deliberate across paragraphs and reverse yourself two or three times (`Hmm…`, `wait,`, `on second thought`);
- silently pick a reading and bury the choice in a footnote;
- present the tradeoff in the final answer as a fait accompli when a single question would have settled it first.

Do:
- if repo code, config, docs, or history genuinely settle it, decide, act, and state the choice in one line;
- otherwise ask once, before writing the artifact — not after;
- when consequences are asymmetric, prefer the conservative default only if you also surface the alternative in the same breath as a one-line change.

Oscillation in reasoning is the signal to call `ask`, not a substitute for it.