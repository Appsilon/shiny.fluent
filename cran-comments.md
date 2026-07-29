## Resubmission

This package was archived on 2026-06-01. The reported problem was an invalid `href` in the
HTML version of the manual (`#/styles/web/icons#fabric-react` in `Icon.Rd`, flagged by the
`vnu` HTML validator); all relative links of that form have been replaced with absolute
URLs. Redirecting URLs have been updated, and `imola` (no longer on CRAN) has been dropped
from `Suggests`.

## R CMD check results

0 errors | 0 warnings | 0 notes

* "UI" flagged as possibly misspelled in the Title and Description is part of the product
  name "Fluent UI".
