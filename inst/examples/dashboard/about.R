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
          src = "../static/images/appsilon-logo.png",
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
      class = "modal-title",
      "Arctic Fauna"
    ),
    div(
      class = "about-section",
      topic_section(
        header = "About the project",
        description = "This R Shiny dashboard explores artic fauna
          trends using species observation data from the
          Ocean Biodiversity Information System (OBIS)."
      ),
      topic_section(
        header = "Dataset Info",
        description = "The Arctic Biodiversity Data Service
        (ABDS) is the data-management framework for the
        Conservation of Arctic Flora and Fauna (CAFF),
        the biodiversity working group of the Arctic Council,
        and its programs and activities, including the Circumpolar
        Biodiversity Monitoring Programme (CBMP). This Dashboard uses
        only part of the dataset to show meaningful information."
      ),
      div(
        class = "about-tag",
        tag(
          tag_string = "OBIS dataset",
          hyperlink = "https://obis.org/node/da50007b-7871-46cf-8530-441b5836d2c1"
        ),
        tag(
          tag_string = "OBIS website",
          hyperlink = "https://abds.is/"
        )
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
            img_link = "../static/images/shiny-fluent.png",
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
            href_link = "https://appsilon.github.io/rhino/",
            img_link = "../static/images/rhino.png",
            card_header = "Rhino",
            card_text = "Rhino allows you to create Shiny apps The Appsilon
            Way - like a fullstack software engineer. Apply best
            software engineering practices, modularize your code,
            test it well, make UI beautiful, and think about
            user adoption from the onset. Rhino is an opinionated
            framework with a focus on software engineering practices
            and development tools."
          ),
          empty_card()
        )
      ),
      appsilon()
    )
  )
)
