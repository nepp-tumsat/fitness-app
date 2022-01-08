import React, { useContext } from 'react';
import axios from 'axios';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import Link from '@mui/material/Link';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import Cookies from 'js-cookie';
import { useNavigate } from 'react-router-dom';
import { AuthContext } from '../../screens/App';
import './style.css';

import LoginHeader from '../../components/login_header';

export default function Login() {
  const navigate = useNavigate();
  const { setIsSignedIn, setCurrentUser } = useContext(AuthContext);
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    console.log({
      email: data.get('email'),
      password: data.get('password'),
    });
    axios
      .post('http://localhost:3001/auth/sign_in', {
        email: data.get('email'),
        password: data.get('password'),
      })
      .then((response) => {
        console.log('login response: ', response.data.data);
        Cookies.set('_access_token', response.headers['access-token']);
        Cookies.set('_client', response.headers['client']);
        Cookies.set('_uid', response.headers['uid']);
        setIsSignedIn(true);
        setCurrentUser(response.data.data);
        navigate('/');
      })
      .catch((error) => {
        console.log('registration error', error);
      });
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
        <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 5 }}>
          <TextField
            className="LoginFormField"
            margin="normal"
            required
            fullWidth
            id="email"
            label="Eメール"
            name="email"
            autoComplete="email"
            autoFocus
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
          <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="ログイン情報を保持する"
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
          >
            ログイン
          </Button>
          <Grid container>
            <Grid item xs>
              <Link href="#" variant="body2">
                パスワードを忘れましたか?
              </Link>
            </Grid>
          </Grid>
        </Box>
      </Box>
    </div>
  );
}
