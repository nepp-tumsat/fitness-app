import { NavLink } from 'react-router-dom';
import CssBaseline from '@mui/material/CssBaseline';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';

import { styled } from '@mui/material/styles';
import './index.css';

const LoginTitle = styled(Typography)({
  color: '#4395F6',
  fontWeight: 'bold',
});

export default function LoginHeader() {
  return (
    <div>
      <CssBaseline />
      <Grid className="Header" container direction="column" alignItems="center">
        <Grid item xs={12}>
          <LoginTitle variant="h2">FITNESS APP</LoginTitle>
        </Grid>
      </Grid>

      <div className="wrapper">
        <div className="element1">
          <NavLink to="/">
            <h2>ログイン</h2>
          </NavLink>
        </div>

        <div className="element2">
          <NavLink to="/">
            <h2>新規登録</h2>
          </NavLink>
        </div>
      </div>
    </div>
  );
}
