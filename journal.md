---
title: "Reflections on Implementing Commit Processing"
tags:
  - devlog
  - backend
  - postgres
metadata:
  project: "Commit Journaler"
  version: 0.1
  reviewed: false
---
ss
# Reflections on Implementing Commit Processing

**Date:** 2025-10-22  
**Author:** MK

## Summary
Today I worked on the commit-processing pipeline for the "Commit Journaler" project. The goal was to detect commits that include a `journal.md` file and create a related journal record in the database.

## What I did
- Implemented `processCommit()` to parse `journal.md` from commits.
- Added detection for the commit marker `FEAT:JT:` in commit messages.
- Created a database table `commits_processed` to avoid re-processing commits.
- Handled edge cases where `journal.md` is missing or malformed.

## Observations / Notes
- The `pg` client returns `rowCount` as `number | null`, so I coalesced it with `?? 0` to keep types clean.
- Express route wildcards changed in newer `path-to-regexp` versions — required switching to regex routes or downgrading to Express 4.
- Make sure `.env` contains `GITHUB_TOKEN`, `GITHUB_OWNER`, `GITHUB_REPO` and DB creds.

## Details / Full Text
Started with a failing run where the DB threw `42703` (column does not exist). After inspecting the SQL and the `commits_processed` schema, I found `has_journal` and `error_message` were missing. I added them:

```sql
ALTER TABLE commits_processed 
ADD COLUMN has_journal boolean DEFAULT false,
ADD COLUMN error_message text,
ADD COLUMN processed_at timestamp DEFAULT NOW();
