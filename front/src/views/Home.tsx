import { Grid, Box } from '@mui/material'
import WeightCard from '../components/WeightCard'
import BfpCard from '../components/BfpCard'
import PfcBalanceCard from '../components/PfcBalanceCard'
import FitnessCard from '../components/FitnessCard'
import React, { useContext } from 'react';
import { AuthContext } from '../App';

declare global {
  namespace JSX {
    interface IntrinsicElements {
      userInfos: React.DetailedHTMLProps<React.HTMLAttributes<HTMLElement>, HTMLElement>;
    }
  }
}


export default function Home() {
  const { isSignedIn, currentUser } = useContext(AuthContext)
  const UserInfos = () => {
    if (isSignedIn && currentUser) {
      return (
        <div>
            <h2>Email: {currentUser?.email}</h2>
            <h2>Name: {currentUser?.name}</h2>
        </div>
      )
    }
    else {
      return (
        <div>
          {isSignedIn}
          {currentUser}
        </div>
      )
    }
  }
  return (
    <Box mt={2} mx={50} >
    <UserInfos />
    <Grid container spacing={2}>
      <Grid item xs={6}>
        <WeightCard />
      </Grid>
      <Grid item xs={6}>
        <BfpCard />
      </Grid>
      <Grid item xs={6}>
        <PfcBalanceCard />
      </Grid>
      <Grid item xs={12}>
        <FitnessCard />
      </Grid>
    </Grid>
    </Box>
  );
}