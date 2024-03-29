Insert into
  PA_CLIENT.TEXT_BLOCK (
    TEXT_BLOCK_ID,
    TITLE,
    FIRM_ID,
    SCHEME_ID,
    TEXT_BLOCK_MESSAGE,
    STATUS,
    CREATED,
    UPDATED,
    CREATED_BY,
    UPDATED_BY,
    LANGUAGE_ID,
    ORDERING,
    SYMBOL,
    ACTION,
    ACTION_ID
  )
values
  (
    190,
    'Query for updating QUANTITY field for PA_CLIENT.TRANSACTION_BASE for transaction fixup',
    '7673',
    542,
    'update pa_client.transaction_base pt set pt.quantity = pt.quantity / decode((select psec.quantity_multiple from pa_client.security psec, pa_client.firm paf where psec.security_id = pt.security_id and psec.security_profile_id = paf.security_profile_id and paf.firm_id = pt.broker_id), null,1, 0,1, (select psec.quantity_multiple from pa_client.security psec, pa_client.firm paf where psec.security_id = pt.security_id and psec.security_profile_id = paf.security_profile_id and paf.firm_id = pt.broker_id)) where pt.broker_id = :FIRM_ID',
    'A',
    to_date('06-DEC-18', 'DD-MON-RR'),
    to_date('21-JUL-20', 'DD-MON-RR'),
    -1,
    -1,
    null,
    1110,
    'fixTransQuantity',
    'process_fixup_queries',
    null
  );
