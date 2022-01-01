import { Grid, Box } from '@mui/material'
import WeightCard from './WeightCard'
import BfpCard from './BfpCard'
import PfcBalanceCard from './PfcBalanceCard'
import FitnessCard from './FitnessCard'

export default function Home() {
  return (
    <Box mt={2} mx={50} >
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