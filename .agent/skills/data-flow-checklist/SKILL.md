---
name: data-flow-checklist
description: Use whenever a field moves between database, API, shared types, client state, forms, UI, reports, exports, or external providers. Prevents broken deploys from missing mappings or invalid write payloads.
---

# Data Flow Checklist

Complete this before changing a data field.

## Six Steps

1. DB/source column exists.
2. Query/select includes the field when explicit field lists are used.
3. Mapping/normalization includes the field.
4. Shared schema/types include the field.
5. UI/service/component types match the actual field.
6. Insert/update payloads only write fields that exist.

## Search Pattern

```powershell
rg -n "fieldName|field_name|apiName|tableName" .
```

## Notes

- Check both read and write paths.
- Check create, update, duplicate/copy, import/export and archive paths if relevant.
- If a field is optional, verify null/undefined handling.
- If a field affects money, permissions, billing, or reporting, broaden verification.

