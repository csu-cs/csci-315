# Documentation for CSCI 315: *Data Structure Analysis* at Charleston Southern University

[![Deploy](https://github.com/csu-cs/csci-315/workflows/Deploy/badge.svg)](https://github.com/csu-cs/csci-315/actions/)

[Deployed CSCI 315 Site](https://csu-cs.github.io/csci-315/)

---

This project is a website to host resources for this course. It uses [VitePress](https://vitepress.vuejs.org) to generate a website from markdown files. As a result, the website is optimized by [Vite](https://vitejs.dev/).

## Setup

1.  Install [Node](https://nodejs.org/en/) which comes with npm (the Node Package Manager).
2.  Use npm to install YARN.  
    `npm install --global yarn`
3.  Install dependencies.  
    `yarn install`

## Development

To edit the content of the lecture notes, modify the markdown files in `docs/lectures`.

To update the sidebar navigation for the lecture notes, modify `sidebarNotes()` in `docs/.vitepress/config.js`.

### Local Server
Serve the site in the local server using the following command.

```sh
yarn docs:dev
```

VitePress will start a hot-reloading development server at `http://localhost:5173`.


## Deployment

To test the production build before pushing, do the following:

- You may run this command to build the docs:

  ```sh
  $ yarn docs:build
  ```

  The output directory is `docs/.vitepress/dist`.

- Once you've built the docs, you can test them locally by running:

  ```sh
  $ yarn docs:preview
  ```

  The `preview` command will boot up a local static web server that will serve the files from `.vitepress/dist` at `http://localhost:4173`. It's an easy way to check if the production build looks fine in your local environment.

The GitHub workflow will automatically deploy the website when the master branch is updated. The website build is in the `gh-pages` branch.

Visit the deployed site at https://csu-cs.github.io/csci-315/.
