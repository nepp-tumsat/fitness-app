import { render } from 'react-dom'
import './assets/styles/global.css'
import App from './screens/App'

const rootElement = document.getElementById('root')

render(
  <App />,
  rootElement
)