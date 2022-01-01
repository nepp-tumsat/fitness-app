import { Grid, Box } from '@mui/material'
import React, { useContext } from 'react';
import { AuthContext } from '../../screens/App';
import WeightCard from './WeightCard'
import BfpCard from './BfpCard'
import PfcBalanceCard from './PfcBalanceCard'
import FitnessCard from './FitnessCard'

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