import React from 'react';
import {
  List,
  Datagrid,
  Show,
  SimpleShowLayout,
  SingleFieldList,
  ReferenceArrayField,
  NumberField,
  ChipField,
  TextField,
  ImageField,
  ShowButton
} from 'react-admin';
import ViewComfy from '@material-ui/icons/ViewComfy';

export const KingdomIcon = ViewComfy;

export function KingdomShow(props) {
  return (
    <Show {...props}>
      <SimpleShowLayout>
        <TextField source="name" />

        <ReferenceArrayField label="Cards" reference="Card" source="cardIds">
          <Datagrid>
            <TextField source="name" />
            <TextField source="cost" />
            <TextField source="potionCost" />
            <TextField source="specialCost" />
            <ImageField source="imageUrl" />
            <ShowButton />
          </Datagrid>
        </ReferenceArrayField>
      </SimpleShowLayout>
    </Show>
  );
}


export function KingdomList(props) {
  return (
    <List {...props}>
      <Datagrid>
        <TextField source="id" />
        <TextField source="name" />
        <NumberField source="rating" />
        <ReferenceArrayField label="Cards" reference="Card" source="cardIds">
          <SingleFieldList linkType="show">
            <ChipField source="name" />
          </SingleFieldList>
        </ReferenceArrayField>
        <ShowButton />
      </Datagrid>
    </List>
  );
}
