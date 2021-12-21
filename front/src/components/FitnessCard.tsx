import { Box } from '@mui/material'
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import EditIcon from '@mui/icons-material/Edit';
import IconButton from '@mui/material/IconButton';
import CameraAltIcon from '@mui/icons-material/CameraAlt';
import { styled } from '@mui/material/styles';

const CustomCardHeader = styled(CardHeader)({
  backgroundColor: '#5B86F7',
  color: '#fff',
  textAlign: 'center'
});

export default function FitnessCard() {
  return (
    <Card variant="outlined">
      <CustomCardHeader
        title="FITNESS"
        >
      </CustomCardHeader>
      <CardContent>
      </CardContent>
    </Card>
  );
}