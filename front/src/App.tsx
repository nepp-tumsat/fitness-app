import './App.css';
import { BrowserRouter, Route } from 'react-router-dom';
import { Grid } from '@mui/material';
import { styled } from '@mui/material/styles';
import Paper from '@mui/material/Paper';
import Header from './components/Header';

const Item = styled(Paper)(({ theme }) => ({
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

function App() {
  return (
    <Grid container direction="column">
      <Grid container spacing={3}>
        <Grid item xs="auto">
          <Item>variable width content</Item>
        </Grid>
        <Grid item xs={6}>
          <Item>xs=6</Item>
        </Grid>
        <Grid item xs>
          <Item>xs</Item>
        </Grid>
      </Grid>
    </Grid>
  );
}

function Home() {
  return <h2>Home</h2>;
}

export default App;