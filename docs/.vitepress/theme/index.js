import DefaultTheme from 'vitepress/theme'
import './custom.css'

// export default DefaultTheme

import ProgressiveDiagram from './components/ProgressiveDiagram.vue'

/** @type {import('vitepress').Theme} */
export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    // register your custom global components
    app.component('ProgressiveDiagram', ProgressiveDiagram)
  }
}