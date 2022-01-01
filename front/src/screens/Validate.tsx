import { Component } from 'react';
import { Routes, Route } from 'react-router-dom';

import LoginHeader from '../components/login_header';
import Login from '../views/login';

import './Default.css';

class Validate extends Component {
  render() {
    return (
      <div>
        <LoginHeader />
        <main className="ValidateBody">
          <Routes>
            <Route path="/login" element={<Login />} />
          </Routes>
        </main>
      </div>
    );
  }
}

export default Validate;
