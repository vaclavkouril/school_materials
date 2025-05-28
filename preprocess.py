import re
from pathlib import Path

docs_path = Path("docs")

for md_file in docs_path.rglob("*.md"):
    text = md_file.read_text(encoding="utf-8")
    new_text = re.sub(r"\[\[([^\]]+)\]\]", r"[\1](\1.md)", text)
    md_file.write_text(new_text, encoding="utf-8")
