import React, { useContext } from 'react';
import axios from 'axios';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Cookies from 'js-cookie';
import AdapterDateFns from '@mui/lab/AdapterDateFns';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import DesktopDatePicker from '@mui/lab/DesktopDatePicker';
import { useNavigate } from 'react-router-dom';
import { AuthContext } from '../../screens/App';
import './style.css';

import LoginHeader from '../../components/login_header';

export default function SignUp() {
  const navigate = useNavigate();
  const { setIsSignedIn, setCurrentUser } = useContext(AuthContext);
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    // axios
    //   .post('http://localhost:3001/auth/sign_in', {
    //     email: data.get('email'),
    //     password: data.get('password'),
    //   })
    //   .then((response) => {
    //     console.log('login response: ', response.data.data);
    //     Cookies.set('_access_token', response.headers['access-token']);
    //     Cookies.set('_client', response.headers['client']);
    //     Cookies.set('_uid', response.headers['uid']);
    //     setIsSignedIn(true);
    //     setCurrentUser(response.data.data);
    //     navigate('/');
    //   })
    //   .catch((error) => {
    //     console.log('registration error', error);
    //   });
  };

  const [value, setValue] = React.useState(new Date('2014-08-18T21:11:54'));

  const handleChange = (newValue) => {
    setValue(newValue);
  };

  return (
    <div>
      <LoginHeader />
      <Box
        height="74vh"
        bgcolor="#f2f6ff"
        sx={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        }}
      >
        <Box
          component="form"
          onSubmit={handleSubmit}
          noValidate
          width="45%"
          sx={{ mt: 5 }}
        >
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            name="username"
            label="ユーザー名"
            type="username"
            id="username"
            autoFocus
          />
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            id="email"
            label="Eメール"
            name="email"
            autoComplete="email"
          />
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            name="password"
            label="パスワード"
            type="password"
            id="password"
            autoComplete="current-password"
          />
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            name="password"
            label="パスワード再入力"
            type="password"
            id="password"
            autoComplete="current-password"
          />
          <LocalizationProvider dateAdapter={AdapterDateFns}>
            <DesktopDatePicker
              className="LoginFormField"
              margin="normal"
              required
              fullWidth
              label="生年月日"
              inputFormat="MM/dd/yyyy"
              value={value}
              onChange={handleChange}
              renderInput={(params) => <TextField {...params} />}
            />
          </LocalizationProvider>
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            name="user_height"
            label="身長"
            type="integer"
            id="user_height"
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
          >
            新規登録
          </Button>
        </Box>
      </Box>
    </div>
  );
}
