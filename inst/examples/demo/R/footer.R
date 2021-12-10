footer <- function(i18n) {
  Stack(
    horizontal = TRUE,
    horizontalAlign = "space-between",
    tokens = list(childrenGap = 20),
    Text(variant = "medium", i18n$t("Built with ❤ by Appsilon"), block = TRUE),
    Text(variant = "medium", nowrap = FALSE, i18n$t("If you'd like to learn more, reach out to us at hello@appsilon.com")),
    Text(variant = "medium", nowrap = FALSE, i18n$t("All rights reserved."))
  )
}
