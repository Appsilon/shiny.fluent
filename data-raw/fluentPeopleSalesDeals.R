library(RColorBrewer)
library(dplyr)

fluentPeople <- tibble::tribble(
  ~key, ~imageUrl, ~imageInitials, ~text, ~secondaryText, ~tertiaryText, ~optionalText, ~isValid, ~presence, ~canExpand,
  1, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "PV", "Annie Lindqvist", "Senior Sales Rep", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  2, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AR", "Aaron Reid", "Sales Rep", "In a meeting", "Available at 4:00pm", TRUE, 6, NA,
  3, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AL", "Alex Lundberg", "Junior Sales Rep", "In a meeting", "Available at 4:00pm", TRUE, 4, NA,
  4, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "RK", "Roko Kolar", "Senior Sales Rep", "In a meeting", "Available at 4:00pm", TRUE, 1, NA,
  5, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "CB", "Christian Bergqvist", "Account Manager", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  6, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "VL", "Valentina Lovric", "Senior Account Manager", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  7, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "MS", "Maor Sharett", "Sales Rep", "In a meeting", "Available at 4:00pm", TRUE, 3, NA
)
fluentPeople$color <- brewer.pal(nrow(fluentPeople), "Set3")

fortune_500_corporate_headquarters_url <- "https://prod-hub-indexer.s3.amazonaws.com/files/a4d813c396934fc09d0b801a0c491852/0/full/3857/a4d813c396934fc09d0b801a0c491852_0_full_3857.csv"
clients <- tibble(readr::read_csv(fortune_500_corporate_headquarters_url)) %>% arrange(RANK) %>% top_n(10)
deals_per_rep <- rnorm(nrow(fluentPeople), mean=12, sd = 5) %>% round()

fluentSalesDeals <- 1:nrow(fluentPeople) %>% purrr::map_dfr(function(person_index) {
  deals_count <- max(deals_per_rep[person_index], 1)
  sample_n(clients, deals_count, replace=TRUE) %>%
    mutate(
      deal_amount = round(runif(deals_count, 300000, 1000000)),
      rep_id = person_index,
      rep_name = unlist(fluentPeople[person_index, "text"]),
      date = sample(seq(as.Date('2020/01/01'), as.Date('2021/01/01'), by="day"), deals_count),
      client_name = NAME,
      city = CITY,
      color = unlist(fluentPeople[person_index, "color"]),
      is_closed = rbinom(deals_count, 1, 0.5)
    )
})

usethis::use_data(fluentPeople, fluentSalesDeals, overwrite = TRUE)
