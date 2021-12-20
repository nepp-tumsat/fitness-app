import {
  BrowserRouter,
  Routes,
  Route
} from 'react-router-dom'
import { render } from 'react-dom'
import './index.css'
import './App.css';
import Home from './views/Home'
import Header from './components/Header'

const rootElement = document.getElementById('root')
function App() {
  return (
      <BrowserRouter>
        <div className='App'>
          <Header />
          <Routes>
            <Route path="/" element={<Home />} />
          </Routes>
        </div>
      </BrowserRouter>
  );
}

export default App;