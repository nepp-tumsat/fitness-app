import React, { useContext } from 'react';
import axios from 'axios';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Stack from '@mui/material/Stack'
import InputAdornment from '@mui/material/InputAdornment';
import Cookies from 'js-cookie';
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
    axios
      .post('http://localhost:3001/auth', {
        name: data.get('username'),
        email: data.get('email'),
        password: data.get('password'),
        password_confirmation: data.get('password_confirmation'),
        birthday: data.get('birthday'),
        tall: data.get('user_height') //後でカラム名をtall->user_heightに変更
      })
      .then((response) => {
        console.log('signup response: ', response.data.data);
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
        <Box
          component="form"
          onSubmit={handleSubmit}
          noValidate
          width="45%"
          sx={{ mt: 5 }}
        >
          <Stack spacing={3}>
            <TextField
              className="SignUpFormField"
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
              className="SignUpFormField"
              margin="normal"
              required
              fullWidth
              id="email"
              label="Eメール"
              name="email"
              autoComplete="email"
            />
            <TextField
              className="SignUpFormField"
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
              className="SignUpFormField"
              margin="normal"
              required
              fullWidth
              name="password_confirmation"
              label="パスワード再入力"
              type="password"
              id="password_confirmation"
              autoComplete="current-password"
            />
            <TextField
              id="birthday"
              name="birthday"
              label="生年月日"
              type="date"
              required
              margin="normal"
              defaultValue="2000-01-01"
              sx={{ width: 220 }}
              InputLabelProps={{
                shrink: true,
              }}
            />
            <TextField
              className="SignUpFormField"
              type="integer"
              label="身長"
              id="user_height"
              name="user_height"
              required
              margin="normal"
              sx={{ width: '22ch' }}
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">cm</InputAdornment>
                ),
              }}
            />
          </Stack>
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
