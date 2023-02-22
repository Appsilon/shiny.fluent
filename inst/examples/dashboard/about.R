topic_section <- function(header,
                          description) {
  div(
    h4(class = "about-header", header),
    div(
      class = "about-descr",
      description
    )
  )
}

tag <- function(tag_string, hyperlink) {
  div(
    class = "tag-item",
    icon("link"),
    a(
      href = hyperlink,
      target = "_blank",
      rel = "noopener noreferrer",
      tag_string
    )
  )
}

card <- function(href_link,
                 img_link,
                 card_header,
                 card_text) {
  div(
    class = "card-package",
    a(
      class = "card-img",
      href = href_link,
      target = "_blank",
      rel = "noopener noreferrer",
      img(
        src = img_link,
        alt = card_header
      )
    ),
    div(
      class = "card-heading",
      card_header
    ),
    div(
      class = "card-content",
      card_text
    ),
    div(
      class = "card-footer",
      a(
        href = href_link,
        target = "_blank",
        rel = "noopener noreferrer",
        "Learn more"
      )
    )
  )
}

empty_card <- function() {
  div(
    class = "card-empty",
    a(
      href = "https://shiny.tools/#rhino",
      target = "_blank",
      rel = "noopener noreferrer",
      shiny::icon("arrow-circle-right"),
      div(
        class = "card-empty-caption",
        "More Appsilon Technologies"
      )
    )
  )
}

appsilon <- function() {
  div(
    class = "appsilon-card",
    div(
      class = "appsilon-pic",
      a(
        href = "https://appsilon.com/",
        target = "_blank",
        rel = "noopener noreferrer",
        img(
          src = "../appsilon-logo.png",
          alt = "Appsilon"
        )
      )
    ),
    div(
      class = "appsilon-summary",
      "We create, maintain, and develop Shiny applications
      for enterprise customers all over the world. Appsilon
      provides scalability, security, and modern UI/UX with
      custom R packages that native Shiny apps do not provide.
      Our team is among the world’s foremost experts in R Shiny
      and has made a variety of Shiny innovations over the
      years. Appsilon is a proud Posit Full Service
      Certified Partner."
    )
  )
}

aboutPage <- makePage(
  "About Shiny.Fluent",
  "Appsilon",
  div(
    class = "modal-dialog",
    div(
      class = "about-section",
      topic_section(
        header = "About the project",
        description = "This R Shiny dashboard explores artic fauna
          trends using species observation data from the
          Ocean Biodiversity Information System (OBIS)."
      ),
      hr(),
      div(
        h4(
          class = "about-header",
          "Powered by"
        ),
        div(
          class = "card-section",
          card(
            href_link = "https://appsilon.github.io/shiny.fluent/index.html",
            img_link = "../img/shiny-fluent.png",
            card_header = "Shiny.fluent",
            card_text = "We believe that a great UI plays a huge role in
            the success of application projects. Shiny.fluent gives your
            apps a beautiful, professional look, rich set of components
            easily usable in Shiny, and fast speed of development that Shiny
            is famous for. As Fluent UI is built in React, shiny.fluent is
            based on another package called shiny.react, which allows for
            using React libraries in Shiny."
          ),
          card(
            href_link = "https://appsilon.github.io/shiny.react/",
            img_link = "../img/shiny-react.png",
            card_header = "Shiny.React",
            card_text = "Most of the shiny apps are build directly in Shiny
            without using any JS library. React being the Most popular one
            becomes one of such candidate.
            This R package enables using React in Shiny apps and is
            used e.g. by the shiny.fluent package. It contains R and JS
            code which is independent from the React library
            (e.g. Fluent UI) that is being wrapped."
          ),
          card(
            href_link = "https://appsilon.github.io/shiny.router/",
            img_link = "../img/shiny-router.png",
            card_header = "shiny.router",
            card_text = "With shiny.router you can introduce routing to your
            Shiny application: use the URL to direct user from one view to
            another. This not only simplifies the implementation but also
            allows the users to bookmark or share the URL of a specific view."
          )
        )
      ),
      appsilon()
    )
  )
)
