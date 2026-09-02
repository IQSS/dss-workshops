#!/usr/bin/env python3
"""Collect the deprecation warnings a re-execution raised.

Chunk warnings do not reach stdout. Quarto captures them into the rendered
document, inside <div class="cell-output cell-output-stderr"> blocks, which is
why an earlier version of this check read only render.log, found nothing, and
reported a clean run while qplot was warning on every build.

So both are read: the stderr cells for anything a chunk raised, and render.log
for anything the toolchain printed. Prose is skipped by construction — the note
on the qplot page explaining the deprecation lives in a <p>, not a stderr cell,
and an earlier version reported it as a finding.

Writes one finding per line to stdout: "<page>: <warning>".
"""
import html
import pathlib
import re
import sys

STDERR_CELL = re.compile(
    r'<div class="cell-output cell-output-stderr">(.*?)</div>', re.S
)
DEPRECATION = re.compile(r"deprecat|superseded|defunct", re.I)
TAG = re.compile(r"<[^>]+>")

site = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else "_site")
log = pathlib.Path(sys.argv[2] if len(sys.argv) > 2 else "render.log")

found = []

for page in sorted(site.rglob("*.html")):
    text = page.read_text(errors="replace")
    for block in STDERR_CELL.findall(text):
        for line in html.unescape(TAG.sub("", block)).splitlines():
            line = line.strip()
            if line and DEPRECATION.search(line):
                found.append(f"{page.relative_to(site)}: {line}")

if log.exists():
    for line in log.read_text(errors="replace").splitlines():
        line = line.strip()
        if line and DEPRECATION.search(line):
            found.append(f"render.log: {line}")

for line in dict.fromkeys(found):
    print(line)
