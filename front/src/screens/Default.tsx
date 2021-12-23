import { Component } from 'react'
import {
  Routes,
  Route
} from 'react-router-dom'

import './Default.css'
// screens
import Header from '../components/header'
import Home from '../views/home'

class Default extends Component {
  render() {
    return (
      <div>
        <Header />
        <main className='default-body'>
          <Routes>
            <Route path="/" element={<Home />} />
          </Routes>
        </main>
      </div>
    )
  }
}

export default Default;
