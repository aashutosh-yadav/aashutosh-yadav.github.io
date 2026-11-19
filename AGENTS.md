# AGENTS.md

Instructions for agents working on this repository.

## What this repository is

This is Ashutosh Yadav's personal website, published with GitHub Pages directly
from the repository root.

- `index.html` — homepage
- `raft-leader-election-and-log-replication.html` — published blog post and the
  canonical reference for blog design
- `images/` — diagrams and screenshots used by posts

There is no build step, package manager, framework, or JavaScript. Every page is
a self-contained HTML file. Do not introduce Jekyll, `_posts`, front matter,
Markdown rendering, bundlers, CDNs, external fonts, or dependencies. A blog post
is a plain `.html` file in the repository root.

## Non-negotiables

1. **Do not change existing page content unless explicitly asked.** This includes
   rewording, fixing typos, removing sentences, and changing code examples.
   Structural HTML changes are fine when asked; visible text changes are not.
2. **Keep every page self-contained.** CSS lives in a single `<style>` block in
   the page's `<head>`. No external stylesheets, scripts, or web fonts.
3. **Match the established blog design.** Use
   `raft-leader-election-and-log-replication.html` as the source of truth.
4. **Use semantic HTML.** No layout tables, no `<center>`, no `<br>` for spacing,
   no inline `style` attributes, and no presentational attributes on tables.
5. **No JavaScript** unless the user explicitly asks for it.
6. New blog posts use kebab-case file names in the repository root, for example
   `raft-leader-election-and-log-replication.html`.

## Canonical blog design

`raft-leader-election-and-log-replication.html` defines the design. When creating
a new post, copy its `<style>` block **verbatim** into the new page. Do not
rewrite, extend, or selectively copy the CSS, and do not restyle a single post.

The design is deliberately minimal:

- Near-white page (`#fdfdfd`), near-black text (`#1a1a1a`), light gray borders
  (`#e5e5e5`), blue links (`#0b5cad`).
- Centered 760px reading column with 17px system sans-serif and 1.7 line height.
- Large article title; `h2` for sections, `h3` for subsections, `h4` for deeper
  subsections.
- Inline code on `#f2f2f2`; code blocks on `#f6f6f6` with a border, rounded
  corners, and horizontal scrolling.
- Images scale down to fit, are centered inside `<figure>`, and have a subtle
  border.
- Tables use collapsed 1px borders and a light header background.
- Blockquotes use a muted italic style with a left border.

If the design is intentionally changed, update **every** blog post and this
section together. Never leave posts with different stylesheets.

## Page skeleton

Use this structure for every new blog post. Copy the full `<style>` block from
the Raft post where indicated.

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>POST TITLE</title>
<style>
    /* Copy verbatim from raft-leader-election-and-log-replication.html */
</style>
</head>
<body>
<main>
<article>

<header>
<h1>POST TITLE</h1>

<p>One or two short paragraphs: what the post is about and why it matters.</p>
</header>

<section>
<h2>First section</h2>
<p>...</p>
</section>

<section>
<h2>Second section</h2>
<p>...</p>
</section>

</article>
</main>
</body>
</html>
```

The `<title>` and `<h1>` should match the title used on the homepage.

## Markup rules

- One `<h1>` only, inside `<header>`.
- Wrap each top-level `<h2>` section in `<section>`.
- Do not skip heading levels. `h2` → `h3` → `h4`.
- Use `<p>` for paragraphs and `<ul>` / `<ol>` with `<li>` for lists.
- Use `<pre><code>...</code></pre>` for code blocks and `<code>` for inline code.
- Use `<strong>` for key terms, not for decoration.
- Use `<blockquote><p>...</p></blockquote>` for quoted material.
- Use `<figure><img ...></figure>` for every image. `alt` is required.
- Tables use `<thead>`, `<tbody>`, `<tr>`, `<th>`, and `<td>`. The stylesheet
  supplies borders and padding; do not add `border`, `cellpadding`, or
  `cellspacing` attributes.
- External links use descriptive text. If `target="_blank"` is needed, add
  `rel="noopener"`.
- Do not add author bylines, dates, or tags unless the user asks for them.

## Image rules

- Put images in `images/`.
- Use descriptive kebab-case names for new images, for example
  `raft-election-timeout.png` rather than `image11.png`.
- Reference them relatively: `src="images/raft-election-timeout.png"`.
- Always provide useful `alt` text that describes the diagram, not just "image".
- Set an integer `width` attribute when the image's natural size is useful.
- Do not add `style` attributes; the stylesheet handles sizing and borders.

## Writing style

Write like the Raft post: clear, first-person, technical, and explanatory. The
goal is to make a difficult idea feel intuitive without flattening it.

- Start by saying what the post explains and why the reader should care.
- Introduce a concept before depending on it; define unfamiliar terms.
- Prefer short, direct sentences over marketing language.
- Use concrete examples, numbers, before/after tables, and diagrams.
- Motivate each mechanism: what problem does it solve?
- Explain the normal case first, then edge cases and failure modes.
- End with a complete worked example or a compact recap when the topic allows it.
- Use question-style section headings when they help the explanation.
- Bold only the key term in a definition or rule.
- Do not invent benchmarks, results, dates, or personal experiences.
- Do not pad the post with generic AI-style transitions or conclusions.

A structure that works well for systems topics:

1. What the topic is and why it matters.
2. Background concepts needed to follow the rest.
3. The main mechanism, step by step.
4. A concrete example with diagrams or tables.
5. Edge cases, failures, and how they are handled.
6. A complete example or short recap.

Length should follow the topic. The Raft post is long because the subject needs
it; do not add filler to match its length.

## Adding a post to the homepage

Add the new post under `<h2>Writings</h2>` in `index.html`, above older entries:

```html
<article>
    <h3>
        Short topic description —
        <a href="post-file.html">Post title</a>
    </h3>
</article>
```

Keep the homepage's existing markup and styling unless the user asks to change
it. The homepage is a 1000px centered page; blog posts use the 760px reading
column. Do not mix the two layouts.

## Editing existing posts

- Preserve all visible text, code blocks, image `alt` text, and links unless the
  user explicitly asks for content changes.
- When restructuring markup, re-read the result and compare the rendered text to
  the previous version.
- Do not "clean up" the author's wording or fix typos without permission.
- Keep existing fragments and code diagrams exactly as written.

## Local preview

There is nothing to build. Serve the repository root and open the page:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000/` or the new post's file name. Check the page
at both desktop and narrow mobile widths.

## Before finishing

- [ ] New page copies the canonical `<style>` block exactly.
- [ ] Heading levels are valid and there is exactly one `<h1>`.
- [ ] Every `<img>` has `alt`, loads from `images/`, and is inside `<figure>`.
- [ ] Every code block is `<pre><code>` and wide blocks scroll on mobile.
- [ ] Page has no horizontal overflow at 390px and 1280px widths.
- [ ] Page works when opened from the repository root; no external assets.
- [ ] New post is linked from the Writings section of `index.html`.
- [ ] Existing content was not changed unless requested.
