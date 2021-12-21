import { Component } from 'react'
import {
  BrowserRouter,
  Routes,
  Route
} from 'react-router-dom'
// screens
import Header from './components/Header'
import Home from './views/Home'

class Default extends Component {
  render() {
    return (
      <div>
        <Header />
        <main>
          <Routes>
            <Route path="/" element={<Home />} />
          </Routes>
        </main>
      </div>
    )
  }
}

export default Default;
