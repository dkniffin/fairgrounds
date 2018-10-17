import React from 'react';
import {
  List,
  Datagrid,
  Show,
  TextField,
  BooleanField,
  ImageField,
  ShowButton,
  SimpleShowLayout
} from 'react-admin';
import CropPortrait from '@material-ui/icons/CropPortrait';

export const CardIcon = CropPortrait;

export function CardShow(props) {
  return (
    <Show {...props}>
      <SimpleShowLayout>
        <TextField source="name" />
        <TextField source="specialCost" />
        <TextField source="cost" />
        <TextField source="potionCost" />

        <ImageField source="imageUrl" title="name" />

        <BooleanField source="action" />
        <BooleanField source="attack" />
        <BooleanField source="boon" />
        <BooleanField source="castle" />
        <BooleanField source="curse" />
        <BooleanField source="doom" />
        <BooleanField source="duration" />
        <BooleanField source="event" />
        <BooleanField source="fate" />
        <BooleanField source="gathering" />
        <BooleanField source="heirloom" />
        <BooleanField source="hex" />
        <BooleanField source="landmark" />
        <BooleanField source="looter" />
        <BooleanField source="night" />
        <BooleanField source="prize" />
        <BooleanField source="reaction" />
        <BooleanField source="reserve" />
        <BooleanField source="shelter" />
        <BooleanField source="spirit" />
        <BooleanField source="state" />
        <BooleanField source="supply" />
        <BooleanField source="trash" />
        <BooleanField source="traveller" />
        <BooleanField source="treasure" />
        <BooleanField source="victory" />
        <BooleanField source="zombie" />
      </SimpleShowLayout>
    </Show>
  );
}

// export const PostCreate = (props) => (
//     <Create title="Create a Post" {...props}>
//         <SimpleForm>
//             <TextInput source="title" />
//             <TextInput source="teaser" options={{ multiLine: true }} />
//             <LongTextInput source="body" />
//             <TextInput label="Publication date" source="published_at" />
//             <TextInput source="average_note" />
//         </SimpleForm>
//     </Create>
// );

export function CardList(props) {
  return (
    <List {...props}>
      <Datagrid>
        <TextField source="name" />
        <ImageField source="imageUrl" title="name" />
        <ShowButton />
      </Datagrid>
    </List>
  );
}
