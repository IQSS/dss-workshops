# Self-hosted fonts

`montserrat-latin.woff2` and `questrial-latin.woff2` are the latin subsets Google
Fonts serves to a current browser, saved here so the pages fetch them from their
own origin.

Both are under the [SIL Open Font License 1.1](https://openfontlicense.org),
which permits redistribution: Montserrat © Julieta Ulanovsky and contributors,
Questrial © Joe Prince.

Montserrat is a variable font covering the whole weight range in one file, which
is why three declared weights need only one download. 35 KB and 14 KB.

## Why not Google's CDN

The `@import` that used to sit at the top of `dss.scss` made the browser parse a
511 KB stylesheet, discover the import, open a connection to
`fonts.googleapis.com` for a second stylesheet, and only then open a third
connection to `fonts.gstatic.com` for the files themselves. Four sequential steps
before any webfont existed, so every page painted in Helvetica and then re-flowed
when Montserrat arrived — wider font, different line breaks, visible jitter.

Served from the same origin as the page there is no extra DNS or TLS, and the
theme preloads both files so they start downloading while the stylesheet is still
being fetched. It also means a Harvard site stops making a request to Google on
every page view.

## Refreshing them

Only needed if a glyph is missing or the upstream font is revised. Ask Google
Fonts for the CSS as a current browser, take the `src` URLs from the
`@font-face` blocks whose `unicode-range` begins `U+0000-00FF`, and download
those two files over these:

```sh
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"
curl -A "$UA" "https://fonts.googleapis.com/css2?family=Questrial&family=Montserrat:wght@400;500;600&display=swap"
```
