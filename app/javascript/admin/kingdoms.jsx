import React from 'react';
import {
  List,
  Datagrid,
  SingleFieldList,
  ReferenceArrayField,
  NumberField,
  ChipField,
  TextField
} from 'react-admin';
import ViewComfy from '@material-ui/icons/ViewComfy';

export const KingdomIcon = ViewComfy;

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
      </Datagrid>
    </List>
  );
}
