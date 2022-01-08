import { Box, Grid } from '@mui/material'
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import { styled } from '@mui/material/styles';
import Typography from '@mui/material/Typography';

import PfcGraph from './PfcGraph'

const CustomCardHeader = styled(CardHeader)({
  backgroundColor: '#5B86F7',
  color: '#fff',
  textAlign: 'center'
});

const TodayInTakeCALORIES = styled(Typography)({
  color: '#7c7c7c'
})

export default function PfcBalanceCard() {
  return (
    <Box justifyContent="center">
      <Card variant="outlined">
      <CustomCardHeader
        title="PFC BALANCE"
        >
      </CustomCardHeader>
      <CardContent>
        <Grid container alignItems="center">
          <Grid item xs={12}>
            <PfcGraph />
          </Grid>
        </Grid>
        <TodayInTakeCALORIES variant='h5' textAlign='center'>
          TODAY'S CALORIES INTAKE: 2350 kcal (+350)
        </TodayInTakeCALORIES>
      </CardContent>
    </Card>
    </Box>
  );
}