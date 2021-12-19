import { Grid, Box } from '@mui/material'
import WeightCard from '../components/WeightCard'
import BfpCard from '../components/BfpCard'
import PfcBalanceCard from '../components/PfcBalanceCard'
import FitnessCard from '../components/FitnessCard'

export default function Home() {
  return (
    <Box mt={2} mx={10} >
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