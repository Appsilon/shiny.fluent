### End to end tests

We're using [Cypress](https://cypress.io) for E2E tests. To run them, use `yarn e2e-test`.

To run the tests interactively, start a server with `start-e2e-test-app` and in another shell
run `yarn cypress open` and click "Run all specs".

When running on Github, tests will record their runs to
[Cypress project's dashboard](https://dashboard.cypress.io/projects/pm6grv).
