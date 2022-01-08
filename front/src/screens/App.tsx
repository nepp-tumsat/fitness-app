import { BrowserRouter, Routes, Route } from 'react-router-dom';
import React, { useState, useEffect, createContext } from 'react';
import Cookies from 'js-cookie';
import axios from 'axios';

import Default from './Default';

import Login from '../views/login';
import SignUp from '../views/signup';
import NotFound from '../views/errors/404';

interface User {
  id: number;
  uid: string;
  provider: string;
  email: string;
  name: string;
  image?: string;
  birthdate: string;
  tall?: number;
  allowPasswordChange: boolean;
  created_at: Date;
  updated_at: Date;
}

export const AuthContext = createContext(
  {} as {
    loading: boolean;
    setLoading: React.Dispatch<React.SetStateAction<boolean>>;
    isSignedIn: boolean;
    setIsSignedIn: React.Dispatch<React.SetStateAction<boolean>>;
    currentUser: User | undefined;
    setCurrentUser: React.Dispatch<React.SetStateAction<User | undefined>>;
  }
);

export default function App() {
  const getCurrentUser = () => {
    if (
      !Cookies.get('_access_token') ||
      !Cookies.get('_client') ||
      !Cookies.get('_uid')
    )
      return;
    return axios.get('http://localhost:3001/auth/sessions', {
      headers: {
        'access-token': Cookies.get('_access_token') || '',
        client: Cookies.get('_client') || '',
        uid: Cookies.get('_uid') || '',
      },
    });
  };
  const [loading, setLoading] = useState<boolean>(true);
  const [isSignedIn, setIsSignedIn] = useState<boolean>(false);
  const [currentUser, setCurrentUser] = useState<User | undefined>();

  const handleGetCurrentUser = async () => {
    try {
      const res = await getCurrentUser();

      if (res?.data.isLogin === true) {
        setIsSignedIn(true);
        setCurrentUser(res?.data.data);

        console.log(res?.data.data);
      } else {
        console.log('No current user');
      }
    } catch (err) {
      console.log(err);
    }

    setLoading(false);
  };

  useEffect(() => {
    handleGetCurrentUser();
  }, [setCurrentUser]);

  return (
    <BrowserRouter>
      <AuthContext.Provider
        value={{
          loading,
          setLoading,
          isSignedIn,
          setIsSignedIn,
          currentUser,
          setCurrentUser,
        }}
      >
        <div>
          <Routes>
            <Route path="/" element={<Default />} />
            <Route path="/login" element={<Login />} />
            <Route path="/signup" element={<SignUp />} />
            <Route path="*" element={<NotFound />} />
          </Routes>
        </div>
      </AuthContext.Provider>
    </BrowserRouter>
  );
}
