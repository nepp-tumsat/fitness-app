import {
  BrowserRouter,
  Routes,
  Route
} from 'react-router-dom'
import { Component } from 'react'
import './index.css'
import './App.css';
import Default from './Default'
import Login from './views/Login'

// const rootElement = document.getElementById('root')
class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div>
          <Routes>
            <Route path="login" element={<Login />} />
            <Route path="/" element={<Default />} />
          </Routes>
        </div>
      </BrowserRouter>
    );
  }
}

export default App