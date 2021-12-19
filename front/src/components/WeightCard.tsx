import { Box } from '@mui/material'
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import EditIcon from '@mui/icons-material/Edit';
import IconButton from '@mui/material/IconButton';
import CameraAltIcon from '@mui/icons-material/CameraAlt';
import Typography from '@mui/material/Typography';
import { styled } from '@mui/material/styles';

const CustomCardHeader = styled(CardHeader)({
  backgroundColor: '#5B86F7',
  color: '#fff',
  textAlign: 'center'
});

const CustomIconButton = styled(IconButton)({
  color: '#fff',
})

const CustomTypography = styled(Typography)({
  fontWeight: 600
})

const LastTimeTypography = styled(Typography)({
  color: '#7c7c7c'
})

export default function WeightCard() {
  return (
    <Card variant="outlined">
      <CustomCardHeader
        title="WEIGHT"
        action={
          <Box>
            <CustomIconButton aria-label="settings">
              <EditIcon />
            </CustomIconButton>
            <CustomIconButton aria-label="settings">
              <CameraAltIcon />
            </CustomIconButton>
          </Box>
        }
        >
      </CustomCardHeader>
      <CardContent>
        <CustomTypography gutterBottom variant="h2" textAlign='center'>
          67.4 kg
        </CustomTypography>
        <Typography gutterBottom variant="h5" component="div" textAlign='start'>
          目標まであと...
        </Typography>
        <CustomTypography gutterBottom variant="h2" textAlign='center'>
          - 7.4 kg
        </CustomTypography>
        <LastTimeTypography variant="h5" textAlign='center'>
          last time(2021/10/31) 68.0kg
        </LastTimeTypography>
      </CardContent>
    </Card>
  );
}